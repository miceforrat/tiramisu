package org.xaspect.testSupports;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class RefRepository {
    private static RefRepository instance;
    private final Map<String, Method> staticMethods = new HashMap<>();
    private final Set<Class<?>> scannedStaticClasses = new HashSet<>();
    private final Map<Class<?>, Map<String, Method>> instanceMethods = new HashMap<>();
    private final Map<String, Object> refModels = new HashMap<>();


    public static RefRepository getInstance() {
        if (instance == null) {
            instance = new RefRepository();
        }
        return instance;
    }


    public interface ClassHandler {
        void handle(Class<?> clazz);
    }


    void registerStaticRefMethod(Class<?> staticClass, String methodId, Method method) {

        if (staticMethods.containsKey(methodId)) {
            System.err.println("Method already registered: " + methodId + "for class" + staticClass.getName());
        } else {
            staticMethods.put(methodId, method);

        }

    }

    void registerInstanceRefMethod(Class<?> insClass, String methodId, Method method) {
        if (!instanceMethods.containsKey(insClass)) {
            instanceMethods.put(insClass, new HashMap<>());
        }
        if (instanceMethods.get(insClass).containsKey(methodId)) {
            System.err.println("Method already registered: " + methodId + "for class" + insClass.getName());
        } else {
            instanceMethods.get(insClass).put(methodId,method);
        }

    }

    public <T> void submitRefModel(String modelId, T model) {
        if (refModels.containsKey(modelId)) {
            System.err.println("Model already registered: " + modelId);
        } else {
            this.refModels.put(modelId, model);
        }

        Class<?> clazz = model.getClass();
        if (instanceMethods.containsKey(clazz)) {
            return;
        }
        scanClassForMethods(clazz, false);
    }

    public void submitRefClass(Class<?> clazz){
        if (scannedStaticClasses.contains(clazz)) {
            return;
        }
        scannedStaticClasses.add(clazz);

        scanClassForMethods(clazz, true);
    }

    void scanClassForMethods(Class<?> clazz, boolean isStatic) {
        for (Method method : clazz.getDeclaredMethods()) {
            System.err.println(method.getName());
            if (isStatic && method.isAnnotationPresent(StaticRefMethod.class)) {
                if (!Modifier.isStatic(method.getModifiers())) {
                    throw new IllegalArgumentException("Error occurs at class: " +  clazz.getName()+": Ref method " + method.getName() + " decorated with @StaticRefMethod SHOULD be static!");
                }
                System.err.println("@RefWithStaticMethod method found: " + method.getName());
                StaticRefMethod staticRefMethod = method.getAnnotation(StaticRefMethod.class);
                String staticMethodId = staticRefMethod.id();
                method.setAccessible(true);
                RefRepository.getInstance().registerStaticRefMethod(clazz, staticMethodId, method);
            } else if ((!isStatic) && method.isAnnotationPresent(InsRefMethod.class)){
                if (Modifier.isStatic(method.getModifiers())) {
                    throw new IllegalArgumentException("Error occurs at class: " +  clazz.getName()+": Ref method " + method.getName() + " decorated with @InsRefMethod SHOULD not be static!");
                }
                System.err.println("@RefWithInsMethod found: " + method.getName());
                InsRefMethod insRefMethod = method.getAnnotation(InsRefMethod.class);
                String insMethodId = insRefMethod.id();
                method.setAccessible(true);
                RefRepository.getInstance().registerInstanceRefMethod(clazz, insMethodId, method);
            }
        }
    }


    Method getStaticMethod( String methodId) {
        if (!staticMethods.containsKey(methodId)) {
            this.logNonExistenceStaticMethod(methodId);
        }

        return staticMethods.get(methodId);
    }

    InstanceWithMethod getInstanceWithMethod(String modelId, String methodId) {
        Object model = refModels.get(modelId);
        if (model == null) {
            logNonExistenceModel(modelId);
            return null;
        }

        Class<?> clazz = model.getClass();
        Map<String, Method> methods = instanceMethods.get(clazz);
        if (methods == null) {
            logNonExistenceModel(modelId);
            return null;
        }

        if (!methods.containsKey(methodId)) {
            logNonExistenceInstanceMethod(modelId, methodId);
            return null;
        }
        Method method = methods.get(methodId);

        return new InstanceWithMethod(model, method);
    }

    private final Set<String> nonExistenceStaticMethodIds = new HashSet<>();

    private void logNonExistenceStaticMethod(String methodId) {
        if (!nonExistenceStaticMethodIds.contains(methodId)) {
            System.out.println("Static Reference Method not found: " + methodId);
            nonExistenceStaticMethodIds.add(methodId);
        }
    }

    private final Map<String, Set<String>> instanceMethodIds = new HashMap<>();

    private void logNonExistenceInstanceMethod(String modelId, String methodId) {
        if (!instanceMethodIds.containsKey(modelId)) {
            instanceMethodIds.put(modelId, new HashSet<>());
        }

        if (!instanceMethodIds.get(modelId).contains(methodId)) {
            instanceMethodIds.get(modelId).add(methodId);
            System.out.println("Instance Reference Method not found: " + methodId + " in model with id: " + modelId);
        }
    }

    private void logNonExistenceModel(String modelId) {
        if (!instanceMethodIds.containsKey(modelId)) {
            instanceMethodIds.put(modelId, new HashSet<>());
            System.out.println("Instance Reference Method not found with id: " + modelId);
        }
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
