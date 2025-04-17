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
            Class<?>[] refParameterTypes = method.getParameterTypes();

            MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
            Class<?>[] realParamTypes = methodSignature.getParameterTypes();

            checkArgs(refParameterTypes, realParamTypes, refId);
            Object[] args = pjp.getArgs();


//            Future<Object> refFuture = InnerThreadPool.submit(new Callable<Object>() {
//                @Override
//                public Object call() throws Exception {
//                    return method.invoke(null, args);
//                }
//            });
            Object result = pjp.proceed();
//            Object ref = refFuture.get();
            Object ref = method.invoke(null, args);
            if (!ref.equals(result)) {
                throw new AssertionError("Auto Reference Method Results Assertion Failed: expected: " + ref + ", actual: " + result);
            }
            return result;
        } else {
            return pjp.proceed();
        }
    }


    @Around("@annotation(refWithInsMethod)")
    public Object around(ProceedingJoinPoint pjp, RefWithInsMethod refWithInsMethod) throws Throwable {
        String refId = refWithInsMethod.methodId();
        Object dut = pjp.getTarget();
        RefRepository.InstanceWithMethod insWithMethod = RefRepository.getInstance().getInstanceWithMethod(dut, refId);
        if (insWithMethod != null && insWithMethod.method != null && insWithMethod.instance != null) {
            Class<?>[] refParameterTypes = insWithMethod.method.getParameterTypes();
            MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
            Class<?>[] realParamTypes = methodSignature.getParameterTypes();

            checkArgs(refParameterTypes, realParamTypes, "method " + refId + " in model " + dut);

            Object[] args = pjp.getArgs();

//            Future<Object> refFuture = InnerThreadPool.submit(new Callable<Object>() {
//                @Override
//                public Object call() throws Exception {
//                    return insWithMethod.method.invoke(insWithMethod.instance, args);
//                }
//            });

            Object result = pjp.proceed();
            Object ref = insWithMethod.method.invoke(insWithMethod.instance, args);
//            Object ref = refFuture.get();
            if (!ref.equals(result)) {
                throw new AssertionError("Auto Reference Method Results Assertion Failed: expected: " + ref + ", actual: " + result);
            }

            return result;
        } else {
            return pjp.proceed();
        }
    }

    private void checkArgs(Class<?>[] refMethodParameterTypes, Class<?>[] realMethodParameterTypes, String refMethodName) {
        if (refMethodParameterTypes.length != realMethodParameterTypes.length) {
            throw new RuntimeException("Not enough parameters for " + refMethodName);
        }
        for (int i = 0; i < refMethodParameterTypes.length; i++) {
            if (!realMethodParameterTypes[i].equals(realMethodParameterTypes[i])) {
                throw new RuntimeException("Wrong parameter type for " + refMethodName + ": expected: " + realMethodParameterTypes[i].getName() + ", got: " + refMethodParameterTypes[i].getName());
            }
        }
    }
}
