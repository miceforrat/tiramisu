package org.xaspect.testSupports;


import co.paralleluniverse.common.util.Pair;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.*;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.function.Function;
import java.util.stream.Collectors;


import java.util.concurrent.ConcurrentHashMap;


public class RefPips {
    private final Map<String, FullParamTriggerWorker> paramPipes = new HashMap<>();
    private final Map<String, ResultComparator> resultComparators = new HashMap<>();

    private static final RefPips instance = new RefPips();

    public static RefPips getInstance() {
        return instance;
    }

    public void registerComparator(String id) {
        resultComparators.computeIfAbsent(id, ResultComparator::getOrCreate);
    }

    public void checkRefMethod(Method method, Object instance) {
        FullParamTriggerWorker worker = FullParamTriggerWorker.getFullParamTrigger(method, instance);
        if (worker != null) {
            for (String param : worker.paramNeeds) {
                paramPipes.putIfAbsent(param, worker);
            }
        }
    }

    public void putParamForUse(String key, Object param) {
        FullParamTriggerWorker worker = paramPipes.get(key);
        if (worker == null) {
            System.err.println("[RefPips] No ref consumer for param key: " + key);
            return;
        }
        try {
            worker.addParam(key, param);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public void putDUTResForCmp(String key, Object param) {
        ResultComparator cmp = resultComparators.get(key);
        if (cmp == null) {
            System.err.println("[RefPips] No comparator registered for id: " + key);
            return;
        }
        cmp.pushDut(param);
    }

    public void putRefResForCmp(String key, Object param) {
        ResultComparator cmp = resultComparators.get(key);
        if (cmp == null) {
            System.err.println("[RefPips] No comparator registered for id: " + key);
            return;
        }
        cmp.pushRef(param);
    }

    // ========================= TRIGGER WORKER =============================

    static class FullParamTriggerWorker implements Runnable {
        private final Map<String, BlockingQueue<Object>> paramPipes;
        final List<String> paramNeeds;
        private final Method method;
        private final Object methodInvokeInstance;
        private final String retValTo;

        private static final Map<Pair<Method, Object>, FullParamTriggerWorker> paramTriggers = new HashMap<>();
        private static final Set<String> acceptors = new HashSet<>();

        static FullParamTriggerWorker getFullParamTrigger(Method method, Object methodInvokeInstance) {
            Pair<Method, Object> key = new Pair<>(method, methodInvokeInstance);
            if (paramTriggers.containsKey(key)) return paramTriggers.get(key);

            boolean started = false;
            boolean allWithParams = true;
            List<String> paramIds = new ArrayList<>();

            for (Parameter p : method.getParameters()) {
                RefParam refParam = p.getAnnotation(RefParam.class);
                if (refParam == null) {
                    allWithParams = false;
                } else {
                    started = true;
                    if (!allWithParams) {
                        throw new IllegalArgumentException("All parameters must be annotated with @RefParam");
                    }
                    if (refParam.direction() != RefDirection.FROM) {
                        throw new IllegalArgumentException("Param " + p.getName() + " must use direction FROM");
                    }
                    String id = refParam.id();
                    if (!acceptors.add(id)) {
                        throw new IllegalArgumentException("Param id " + id + " already consumed by another method");
                    }
                    paramIds.add(id);
                }
            }

            if (!started) return null;
            if (!allWithParams) throw new IllegalArgumentException("Mixed annotated/non-annotated parameters");

            String retTo = Optional.ofNullable(method.getAnnotation(RefReturnVal.class))
                    .map(RefReturnVal::id)
                    .orElse("");

            if (!retTo.isEmpty()) RefPips.getInstance().registerComparator(retTo);

            FullParamTriggerWorker worker = new FullParamTriggerWorker(method, methodInvokeInstance, paramIds, retTo);
            paramTriggers.put(key, worker);
            new Thread(worker, "FullParamTrigger-" + method.getName()).start();
            return worker;
        }

        FullParamTriggerWorker(Method method, Object methodInvokeInstance, List<String> paramKeys, String retValTo) {
            this.method = method;
            this.methodInvokeInstance = methodInvokeInstance;
            this.paramNeeds = paramKeys;
            this.retValTo = retValTo;
            this.paramPipes = paramKeys.stream()
                    .collect(Collectors.toMap(Function.identity(), k -> new LinkedBlockingQueue<>()));
        }

        void addParam(String key, Object value) throws InterruptedException {
            BlockingQueue<Object> q = paramPipes.get(key);
            if (q == null) throw new IllegalStateException("No queue for key: " + key);
            q.put(value);
        }

        @Override
        public void run() {
            try {
                while (true) {
                    Object[] args = new Object[paramNeeds.size()];
                    for (int i = 0; i < paramNeeds.size(); i++) {
                        args[i] = paramPipes.get(paramNeeds.get(i)).take();
                    }

                    Object result = method.invoke(methodInvokeInstance, args);
                    if (!retValTo.isEmpty()) {
                        RefPips.getInstance().putRefResForCmp(retValTo, result);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // ========================= COMPARATOR =============================

    static class ResultComparator implements Runnable {
        private final BlockingQueue<Object> dutReses = new LinkedBlockingQueue<>();
        private final BlockingQueue<Object> refReses = new LinkedBlockingQueue<>();
        private final String id;

        private static final Map<String, ResultComparator> globalComparers = new ConcurrentHashMap<>();

        private ResultComparator(String id) {
            this.id = id;
        }

        static ResultComparator getOrCreate(String id) {
            return globalComparers.computeIfAbsent(id, key -> {
                ResultComparator c = new ResultComparator(key);
                new Thread(c, "ResultComparator-" + key).start();
                return c;
            });
        }

        public void pushDut(Object val) {
            try {
                dutReses.put(val);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }

        public void pushRef(Object val) {
            try {
                refReses.put(val);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }

        @Override
        public void run() {
            try {
                while (true) {
                    Object dut = dutReses.take();
                    Object ref = refReses.take();
                    compare(dut, ref);
                }
            } catch (InterruptedException e) {
                System.err.println("[" + id + "] Comparator thread interrupted");
                Thread.currentThread().interrupt();
            }
        }

        protected void compare(Object dut, Object ref) {
            if (Objects.equals(dut, ref)) {
                System.out.println("[" + id + "] ✅ Match: " + dut);
            } else {
                System.err.println("[" + id + "] ❌ MISMATCH:\n  DUT: " + dut + "\n  REF: " + ref);
            }
        }
    }
}
