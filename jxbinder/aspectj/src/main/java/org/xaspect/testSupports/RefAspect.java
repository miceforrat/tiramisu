package org.xaspect.testSupports;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.xaspect.InnerThreadPool;

import java.lang.reflect.Method;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;

@Aspect
public class RefAspect {
    RefAspect(){

    }

    @Around("@annotation(refWithStaticMethod)")
    public Object around(ProceedingJoinPoint pjp, RefWithStaticMethod refWithStaticMethod) throws Throwable {
        String refId = refWithStaticMethod.methodId();
        Method method = RefRepository.getInstance().getStaticMethod(refId);
        if (method != null) {
            Class<?>[] methodParameterTypes = method.getParameterTypes();
            Object[] args = pjp.getArgs();

            if (args.length != methodParameterTypes.length) {
                System.err.println("Not enough parameters for " + refId);
            }

            MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
            Class<?>[] paramTypes = methodSignature.getParameterTypes();
            for (int i = 0; i < paramTypes.length; i++) {
               if (!paramTypes[i].equals(methodParameterTypes[i])) {
                   throw new RuntimeException("Wrong parameter type for " + refId + ": expected: " + methodParameterTypes[i].getName() + ", got: " + methodParameterTypes[i].getName()
                           + "actual: " + paramTypes[i].getName());
               }
            }
            Future<Object> refFuture = InnerThreadPool.submit(new Callable<Object>() {
                @Override
                public Object call() throws Exception {
                    return method.invoke(null, args);
                }
            });
            Object result = pjp.proceed();
            Object ref = refFuture.get();
            if (!ref.equals(result)) {
                throw new AssertionError("Auto Reference Method Results Assertion Failed: expected: " + ref + ", actual: " + result);
            }
            return result;
        } else {
            RefRepository.getInstance().logNonExistenceStaticMethod(refId);
            return pjp.proceed();
        }
    }
}
