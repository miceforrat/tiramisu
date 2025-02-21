package org.xaspect.coroutines;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Aspect
public class CoroutineAspect {

    private Set<String> paused = new HashSet<String>();

    @Around("@annotation(coroutineInterrupt)")
    public Object aroundAgentMethod(ProceedingJoinPoint joinPoint, CoroutineInterrupt coroutineInterrupt) throws Throwable {
        String key = coroutineInterrupt.key();
        String signature = joinPoint.getSignature().toShortString();
        boolean resume = coroutineInterrupt.pauseOrResume();
        if (!resume) {
            System.out.println("CoroutineAspect.aroundAgentMethod called: " + key);
            String pausedKey = key + "_" + signature;
            if (paused.contains(pausedKey)) {
                paused.remove(pausedKey);
                return joinPoint.proceed();
            }
            paused.add(pausedKey);
            CoroutineScheduler.getInstance().pauseTask(key, () -> {
                try {
                    System.out.println(joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName() + " resumed");
                    joinPoint.proceed();
                } catch (Throwable e) {
                    if (e instanceof CoroutineBreakpointException) {
                        throw new CoroutineBreakpointException(e.getMessage());
                    } else {
                        throw new RuntimeException(e);
                    }
                }
            });
            throw new CoroutineBreakpointException("Coroutine calls for a stop at key: " + key);
        } else {
            CoroutineScheduler.getInstance().resumeTask(key);
            return joinPoint.proceed();
        }
    }

}
