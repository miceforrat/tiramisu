//package org.xaspect.testSupports;
//
//import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
//
//import java.lang.reflect.Method;
//import java.lang.reflect.Modifier;
//import java.util.*;
//
//public class RefRepository {
//    private static RefRepository instance;
//    private final Map<String, Method> staticMethods = new HashMap<>();
//    private final Set<Class<?>> scannedStaticClasses = new HashSet<>();
//    private final Map<Class<?>, Map<String, Method>> instanceMethods = new HashMap<>();
//    private final Map<Object, Map<String, Object>> refModelsToDUTObjs = new HashMap<>();
//
//
//    public static RefRepository getInstance() {
//        if (instance == null) {
//            synchronized (RefRepository.class) {
//                if (instance == null) {
//                    instance = new RefRepository();
//                }
//            }
//        }
//        return instance;
//    }
//
//    void registerStaticRefMethod(Class<?> staticClass, String methodId, Method method) {
//
//        if (staticMethods.containsKey(methodId)) {
//            System.err.println("Method already registered: " + methodId + " for class " + staticClass.getName());
//        } else {
//            staticMethods.put(methodId, method);
//        }
//
//    }
//
//    void registerInstanceRefMethod(Class<?> insClass, String methodId, Method method) {
//        if (!instanceMethods.containsKey(insClass)) {
//            instanceMethods.put(insClass, new HashMap<>());
//        }
//        if (instanceMethods.get(insClass).containsKey(methodId)) {
//            System.err.println("Method already registered: " + methodId + " for class " + insClass.getName());
//        } else {
//            instanceMethods.get(insClass).put(methodId,method);
//        }
//
//    }
//
//    public void attachModelWithDUT(Object model, Object dut){
//        refModelsToDUTObjs.computeIfAbsent(dut, k -> Collections.synchronizedMap(new HashMap<>()));
//
//        Class<?> clazz = model.getClass();
//        if (!scannedStaticClasses.contains(clazz)) {
//            scannedStaticClasses.add(clazz);
//            scanClassForMethods(clazz, false);
//        }
//        for (Method method: dut.getClass().getDeclaredMethods()) {
//            if (method.getAnnotation(RefWithInsMethod.class) != null) {
//                String toRefMethodId = method.getAnnotation(RefWithInsMethod.class).methodId();
//                if (refModelsToDUTObjs.get(dut).containsKey(toRefMethodId)) {
//                    System.err.println("Method already registered: " + toRefMethodId + "for class" + dut.getClass().getName());
//                } else {
//                    if (instanceMethods.get(clazz).containsKey(toRefMethodId)) {
//                        refModelsToDUTObjs.get(dut).put(toRefMethodId, model);
//                    }
//                }
//            }
//        }
//    }
//
//
//    public void submitRefClass(Class<?> clazz){
//        if (scannedStaticClasses.contains(clazz)) {
//            return;
//        }
//        scannedStaticClasses.add(clazz);
//
//        scanClassForMethods(clazz, true);
//    }
//
//
//
//    void scanClassForMethods(Class<?> clazz, boolean isStatic) {
//        for (Method method : clazz.getDeclaredMethods()) {
//            System.err.println(method.getName());
//            if (isStatic && method.isAnnotationPresent(StaticRefMethod.class)) {
//                if (!Modifier.isStatic(method.getModifiers())) {
//                    throw new IllegalArgumentException("Error occurs at class: " +  clazz.getName()+": Ref method " + method.getName() + " decorated with @StaticRefMethod SHOULD be static!");
//                }
//                System.err.println("@StaticRefMethod method found: " + method.getName());
//                StaticRefMethod staticRefMethod = method.getAnnotation(StaticRefMethod.class);
//                String staticMethodId = staticRefMethod.id();
//                if (staticMethodId.isEmpty()){
//                    throw new RuntimeException("@StaticRefMethod.id() is empty!");
//                }
//                method.setAccessible(true);
//                RefRepository.getInstance().registerStaticRefMethod(clazz, staticMethodId, method);
//            } else if ((!isStatic) && method.isAnnotationPresent(InsRefMethod.class)){
//                if (Modifier.isStatic(method.getModifiers())) {
//                    throw new IllegalArgumentException("Error occurs at class: " +  clazz.getName()+": Ref method " + method.getName() + " decorated with @InsRefMethod SHOULD not be static!");
//                }
//                System.err.println("@InsRefMethod found: " + method.getName());
//                InsRefMethod insRefMethod = method.getAnnotation(InsRefMethod.class);
//                String insMethodId = insRefMethod.id();
//                if (insMethodId.isEmpty()){
//                    throw new RuntimeException("@InsRefMethod.id() is empty!");
//                }
//                method.setAccessible(true);
//                RefRepository.getInstance().registerInstanceRefMethod(clazz, insMethodId, method);
//            }
//        }
//    }
//
//
//    Method getStaticMethod( String methodId) {
//        if (!staticMethods.containsKey(methodId)) {
//            this.logNonExistenceStaticMethod(methodId);
//        }
//
//        return staticMethods.get(methodId);
//    }
//
//    InstanceWithMethod getInstanceWithMethod(Object dut, String methodId) {
//        if (!refModelsToDUTObjs.containsKey(dut)) {
//            throw new RuntimeException("object " + dut + "does not register to any ref model!");
//        }
//
//        if (!refModelsToDUTObjs.get(dut).containsKey(methodId)) {
//            throw new RuntimeException("object " + dut + " with method id " + methodId + " does not register to any ref model's ref method!");
//        }
//
//        Object model = refModelsToDUTObjs.get(dut).get(methodId);
//
//        Class<?> clazz = model.getClass();
//        assert instanceMethods.containsKey(clazz);
//        assert instanceMethods.get(clazz).containsKey(methodId);
//
//        Method method = instanceMethods.get(clazz).get(methodId);
//        return new InstanceWithMethod(model, method);
//    }
//
//    private final Set<String> nonExistenceStaticMethodIds = new HashSet<>();
//
//    private void logNonExistenceStaticMethod(String methodId) {
//        if (!nonExistenceStaticMethodIds.contains(methodId)) {
//            System.out.println("Static Reference Method not found: " + methodId);
//            nonExistenceStaticMethodIds.add(methodId);
//        }
//    }
//
//    private final Map<String, Set<String>> instanceMethodIds = new HashMap<>();
//
//    private void logNonExistenceInstanceMethod(String modelId, String methodId) {
//        if (!instanceMethodIds.containsKey(modelId)) {
//            instanceMethodIds.put(modelId, new HashSet<>());
//        }
//
//        if (!instanceMethodIds.get(modelId).contains(methodId)) {
//            instanceMethodIds.get(modelId).add(methodId);
//            System.out.println("Instance Reference Method not found: " + methodId + " in model with id: " + modelId);
//        }
//    }
//
//    private void logNonExistenceModel(String modelId) {
//        if (!instanceMethodIds.containsKey(modelId)) {
//            instanceMethodIds.put(modelId, new HashSet<>());
//            System.out.println("Instance Reference Method not found with id: " + modelId);
//        }
//    }
//
//    static class InstanceWithMethod {
//        final Object instance;
//        final Method method;
//        InstanceWithMethod(Object instance, Method method) {
//            this.instance = instance;
//            this.method = method;
//        }
//    }
//
//
//
//}


package org.xaspect.testSupports;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class RefRepository {
    private static volatile RefRepository instance;

    public static RefRepository getInstance() {
        if (instance == null) {
            synchronized (RefRepository.class) {
                if (instance == null) {
                    instance = new RefRepository();
                }
            }
        }
        return instance;
    }

    private final Map<String, Method> staticMethods = new ConcurrentHashMap<>();
    private final Set<Class<?>> scannedStaticClasses = Collections.synchronizedSet(new HashSet<>());
    private final Map<Class<?>, Map<String, Method>> instanceMethods = new ConcurrentHashMap<>();
    private final Map<Object, Map<String, Object>> refModelsToDUTObjs = new ConcurrentHashMap<>();
    private final Set<String> nonExistenceStaticMethodIds = Collections.synchronizedSet(new HashSet<>());
    private final Map<String, Set<String>> instanceMethodIds = new ConcurrentHashMap<>();

    void registerStaticRefMethod(Class<?> staticClass, String methodId, Method method) {
        staticMethods.putIfAbsent(methodId, method);
    }

    void registerInstanceRefMethod(Class<?> insClass, String methodId, Method method) {
        instanceMethods.computeIfAbsent(insClass, k -> new ConcurrentHashMap<>())
                .putIfAbsent(methodId, method);
    }

    public void attachModelWithDUT(Object model, Object dut) {
        refModelsToDUTObjs.computeIfAbsent(dut, k -> new ConcurrentHashMap<>());

        Class<?> clazz = model.getClass();
        synchronized (scannedStaticClasses) {
            if (!scannedStaticClasses.contains(clazz)) {
                scannedStaticClasses.add(clazz);
                scanClassForMethods(clazz, false);
            }
        }

        Map<String, Object> dutMap = refModelsToDUTObjs.get(dut);
        Map<String, Method> methodMap = instanceMethods.get(clazz);
        if (methodMap == null) return;

        for (Method method : dut.getClass().getDeclaredMethods()) {
            RefWithInsMethod anno = method.getAnnotation(RefWithInsMethod.class);
            if (anno != null) {
                String toRefMethodId = anno.methodId();
                if (!dutMap.containsKey(toRefMethodId) && methodMap.containsKey(toRefMethodId)) {
                    dutMap.put(toRefMethodId, model);
                }
            }
        }
    }

    public void submitRefClass(Class<?> clazz) {
        synchronized (scannedStaticClasses) {
            if (scannedStaticClasses.contains(clazz)) return;
            scannedStaticClasses.add(clazz);
        }
        scanClassForMethods(clazz, true);
    }

    void scanClassForMethods(Class<?> clazz, boolean isStatic) {
        for (Method method : clazz.getDeclaredMethods()) {
            if (isStatic && method.isAnnotationPresent(StaticRefMethod.class)) {
                if (!Modifier.isStatic(method.getModifiers())) {
                    throw new IllegalArgumentException("Error in " + clazz.getName() + ": static method required for @StaticRefMethod");
                }
                StaticRefMethod anno = method.getAnnotation(StaticRefMethod.class);
                String methodId = anno.id();
                if (methodId.isEmpty()) throw new RuntimeException("@StaticRefMethod.id() is empty!");
                method.setAccessible(true);
                registerStaticRefMethod(clazz, methodId, method);
            } else if (!isStatic && method.isAnnotationPresent(InsRefMethod.class)) {
                if (Modifier.isStatic(method.getModifiers())) {
                    throw new IllegalArgumentException("Error in " + clazz.getName() + ": instance method required for @InsRefMethod");
                }
                InsRefMethod anno = method.getAnnotation(InsRefMethod.class);
                String methodId = anno.id();
                if (methodId.isEmpty()) throw new RuntimeException("@InsRefMethod.id() is empty!");
                method.setAccessible(true);
                registerInstanceRefMethod(clazz, methodId, method);
                instanceMethodIds.computeIfAbsent(methodId, k -> Collections.synchronizedSet(new HashSet<>()))
                        .add(clazz.getName());
            }
        }
    }

    Method getStaticMethod(String methodId) {
        if (!staticMethods.containsKey(methodId)) {
            logNonExistenceStaticMethod(methodId);
        }
        return staticMethods.get(methodId);
    }

    InstanceWithMethod getInstanceWithMethod(Object dut, String methodId) {
        Map<String, Object> dutMap = refModelsToDUTObjs.get(dut);
        if (dutMap == null || !dutMap.containsKey(methodId)) {
            throw new RuntimeException("DUT or method ID not registered: " + dut + " / " + methodId);
        }
        Object model = dutMap.get(methodId);
        Class<?> clazz = model.getClass();
        Method method = instanceMethods.getOrDefault(clazz, Collections.emptyMap()).get(methodId);
        if (method == null) throw new RuntimeException("Method not found in instanceMethods: " + methodId);
        return new InstanceWithMethod(model, method);
    }

    private void logNonExistenceStaticMethod(String methodId) {
        if (nonExistenceStaticMethodIds.add(methodId)) {
            System.out.println("Static Reference Method not found: " + methodId);
        }
    }

    private void logNonExistenceInstanceMethod(String modelId, String methodId) {
        instanceMethodIds.computeIfAbsent(modelId, k -> Collections.synchronizedSet(new HashSet<>()))
                .add(methodId);
        System.out.println("Instance Reference Method not found: " + methodId + " in model with id: " + modelId);
    }

    private void logNonExistenceModel(String modelId) {
        instanceMethodIds.computeIfAbsent(modelId, k -> Collections.synchronizedSet(new HashSet<>()));
        System.out.println("Instance Reference Method not found with id: " + modelId);
    }

    static class InstanceWithMethod {
        final Object instance;
        final Method method;
        InstanceWithMethod(Object instance, Method method) {
            this.instance = instance;
            this.method = method;
        }
    }
}
