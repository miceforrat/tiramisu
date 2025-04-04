package org.xaspect.testSupports;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class RefRepository {
    private static RefRepository instance;
    private final Map<String, Method> staticMethods = new HashMap<>();
    private final Map<String, InstanceWithMethods> instanceMethods = new HashMap<>();

    public static RefRepository getInstance() {
        if (instance == null) {
            instance = new RefRepository();
        }
        return instance;
    }

    public void registerStaticRefMethod(String methodId, Method method) {
        if (staticMethods.containsKey(methodId)) {
            throw new RuntimeException("Method already registered: " + methodId);
        }

        staticMethods.put(methodId,method);
    }

//    public void registerInstanceRefMethod(Class<?> insClass, String methodId, Method method) {
//        if (!instanceMethods.containsKey(insClass)) {
//            instanceMethods.put(insClass, new InstanceWithMethods())
//        }
//        instanceMethods.get(insClass).addMethod(methodId, method);
//
//    }

    Method getStaticMethod(String methodId) {
        return staticMethods.get(methodId);
    }

    private final Set<String> nonExistenceStaticMethodIds = new HashSet<>();

    void logNonExistenceStaticMethod(String methodId) {
        if (!nonExistenceStaticMethodIds.contains(methodId)) {
            System.out.println("Static Reference Method not found: " + methodId);
            nonExistenceStaticMethodIds.add(methodId);
        }
    }

    private static class InstanceWithMethods {
        private final Object instance;
        private final Map<String, Method> instanceMethods = new HashMap<>();

        InstanceWithMethods(Object instance) {
            this.instance = instance;
        }

        Method getInstanceMethod(String methodId) {
            return instanceMethods.get(methodId);
        }

        private void addMethod(String methodId, Method method) {
            if (instanceMethods.containsKey(methodId)) {
                throw new RuntimeException("Method already registered: " + methodId);
            }
            instanceMethods.put(methodId, method);
        }
    }


}
