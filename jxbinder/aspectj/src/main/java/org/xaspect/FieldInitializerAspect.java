package org.xaspect;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;

import java.lang.reflect.*;
import java.util.HashMap;
import java.util.Map;


import org.aspectj.lang.reflect.MethodSignature;
import org.xaspect.datas.Pin;


@Aspect
public class FieldInitializerAspect {

    FieldInitializerAspect(){
//        System.err.println("FieldInitializerAspect");
    }

    // 匹配所有目标类的构造方法
    @Pointcut("execution(*..*.new(..)) && target(obj) && !@target(org.xaspect.AspectIgnore) && !within(org.xaspect..*)")
    public void constructorCall(Object obj) {}

    // 在构造方法调用前执行初始化逻辑
    @Before(value = "constructorCall(obj)", argNames = "obj")
    public void initializeFields(Object obj) {
        Class<?> clazz = obj.getClass();
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            // 检查字段是否带有 @AutoDUTDao 注解
            if (field.isAnnotationPresent(AutoDUTDao.class)) {
                try {
                    field.setAccessible(true);

                    // 如果字段未初始化，则自动赋值
                    if (field.get(obj) == null) {

                        Class<?> fieldType = field.getType();
                        if (isInterfaceInherited(fieldType, DUTDao.class)) {
                            // 注入实现类实例
                            field.set(obj, dutDaoConstruct(field));
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (field.isAnnotationPresent(AutoDUT.class)) {
                try{
                    field.setAccessible(true);

                    if (field.get(obj) == null){
                        Class<?> fieldType = field.getType();
                        if (isInterfaceInherited(fieldType, DUTManager.class)){
                            field.set(obj, dutManagerConstruct(field));
                        }
                    }
                } catch (Exception e){
                    e.printStackTrace();
                }
            }
        }
    }

//    private final Map<String, DUTDao<?>> existingDaos = new HashMap<>();

    private DUTDao<?> dutDaoConstruct(Field field){

        Class<?> fieldType = field.getType();
        AutoDUTDao annotation = field.getAnnotation(AutoDUTDao.class);
//        String dutId = annotation.id();

        // 获取实现类的全限定名
        String implClassName = StringUtils.getDaoNameWithPrefixHash(fieldType.getCanonicalName(), annotation.value());

//        if (existingDaos.get(implClassName) != null) {
//            return existingDaos.get(implClassName);
//        }

        try {
            // 使用反射加载生成的实现类
            Class<?> implClass = Class.forName(implClassName);
            System.out.println(implClassName);
            DUTDao<?> wrapperImpl = (DUTDao<?>) implClass.getConstructor().newInstance();
//            existingDaos.put(implClassName, wrapperImpl);
            return wrapperImpl;
            // 使用构造方法实例化实现类
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to construct wrapper for field: " + field.getName(), e);
        }
    }

    private DUTManager<?> dutManagerConstruct(Field field){
        Class<?> fieldType = field.getType();
        String implClassName = fieldType.getCanonicalName() + "Impl";


        try {
            // 使用反射加载生成的实现类
            Class<?> implClass = Class.forName(implClassName);
            System.out.println(implClassName);
            DUTManager<?> managerImpl = (DUTManager<?>) implClass.getConstructor().newInstance();
            return managerImpl;
            // 使用构造方法实例化实现类
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to construct wrapper for field: " + field.getName(), e);
        }
    }

    public static boolean isInterfaceInherited(Class<?> child, Class<?> parent) {
        if (!child.isInterface() || !parent.isInterface()) {
            return false; // 仅支持接口判断
        }

        // 获取子接口直接继承的接口
        Class<?>[] interfaces = child.getInterfaces();

        for (Class<?> intf : interfaces) {
            if (intf.equals(parent)) {
                return true; // 直接继承
            }
            // 递归检查父接口链
            if (isInterfaceInherited(intf, parent)) {
                return true;
            }
        }

        return false; // 未继承
    }

    /**
     * 获取继承 DUTWrapper 的泛型 DUT 类型
     *
     * @param clazz 实现或继承 DUTWrapper 的类
     * @return 泛型 DUT 的类型
     */
    public static Class<?> getDUTType(Class<?> clazz) {
        // 检查当前类或接口的所有父接口
        Class<?> dutType = findDUTTypeInInterfaces(clazz);
        if (dutType != null) {
            return dutType;
        }

        // 检查父类（适用于非接口情况）
        Type superClass = clazz.getGenericSuperclass();
        if (superClass instanceof ParameterizedType) {
            ParameterizedType parameterizedSuperClass = (ParameterizedType) superClass;

            // 检查是否是 DUTWrapper
            if (parameterizedSuperClass.getRawType() == DUTDao.class) {
                Type[] typeArgs = parameterizedSuperClass.getActualTypeArguments();
                if (typeArgs.length > 0 && typeArgs[0] instanceof Class) {
                    return (Class<?>) typeArgs[0];
                }
            }
        }

        // 如果没有找到泛型 DUT 类型，抛出异常
        throw new IllegalArgumentException("Class does not implement DUTWrapper with a concrete type.");
    }

    private static Class<?> findDUTTypeInInterfaces(Class<?> clazz) {
        for (Type genericInterface : clazz.getGenericInterfaces()) {
            if (genericInterface instanceof ParameterizedType) {
                ParameterizedType parameterizedType = (ParameterizedType) genericInterface;

                // 检查是否是 DUTWrapper
                if (parameterizedType.getRawType() == DUTDao.class) {
                    Type[] typeArgs = parameterizedType.getActualTypeArguments();
                    if (typeArgs.length > 0 && typeArgs[0] instanceof Class) {
                        return (Class<?>) typeArgs[0];
                    }
                }
            } else if (genericInterface instanceof Class) {
                // 递归检查父接口
                Class<?> result = findDUTTypeInInterfaces((Class<?>) genericInterface);
                if (result != null) {
                    return result;
                }
            }
        }
        return null;
    }


    private String constructIO(String pre, Class<?> DataClass, String insName, boolean isIn){
        String prefix = pre;
        StringBuilder ret = new StringBuilder();
        String typeName = DataClass.getName();
        String fieldPrefix;
        if (isIn){
            fieldPrefix = "inBundle";
            String inTransfer = typeName + " " + fieldPrefix+" = " + "$1;\n";
            ret.append(inTransfer);

        } else {
            fieldPrefix = "outBundle";
//            String typeName = DataClass.geName();
//            System.out.println(DataClass.getName());
            String initializr = typeName + " " + fieldPrefix ;
            if (!typeName.equals("java.lang.Integer")) {
                initializr += " = new " + typeName + "()";
            }
            initializr += ";\n";
            ret.append(initializr);
        }

//        System.out.println(DataClass.getName());
        if (typeName.equals("java.lang.Integer")){

            String trueInsPin = "this." + insName + "." + prefix;
            String dataWrapperVar = fieldPrefix;
            if (isIn) {
                ret.append(trueInsPin).append(".Set(").append(dataWrapperVar).append(");\n");
            } else {
                ret.append(dataWrapperVar).append(" = Integer.valueOf(").append(trueInsPin).append(".S().intValue());\n");
            }
        } else {
            for (Field pin : DataClass.getDeclaredFields()) {
                if (pin.isAnnotationPresent(Pin.class)) {
                    String varName = pin.getName();
                    String pinName = pin.getAnnotation(Pin.class).value();
                    if (pinName.isEmpty()) {
                        pinName = varName;
                    }

                    String trueInsPin = "this." + insName + "." + prefix + pinName;
                    String dataWrapperVar = fieldPrefix + "." + varName;
                    if (isIn) {
                        ret.append(trueInsPin).append(".Set(").append(dataWrapperVar).append(");\n");
                    } else {
                        ret.append(dataWrapperVar).append(" = ").append(trueInsPin).append(".S().intValue();\n");
                    }
                }
            }
        }

        if (!isIn){
            ret.append("return " + fieldPrefix + ";\n");
        }
        return ret.toString();
    }


    private Method getCurrentMethod(ProceedingJoinPoint joinPoint) throws NoSuchMethodException {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();

        String methodName = signature.getName();
        Class<?> targetClass = signature.getDeclaringType();
        Class<?>[] parameterTypes = signature.getParameterTypes();
        return targetClass.getMethod(methodName, parameterTypes);
//        return null;
    }

}

