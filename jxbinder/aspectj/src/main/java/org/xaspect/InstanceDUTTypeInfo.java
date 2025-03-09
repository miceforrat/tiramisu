package org.xaspect;

class InstanceDUTTypeInfo {
    private final String instanceName;
    private final Class<?> instanceClass;
    InstanceDUTTypeInfo(String instanceName, Class<?> instanceClass) {
        this.instanceName = instanceName;
        this.instanceClass = instanceClass;
    }

    String getInstanceName() {
        return instanceName;
    }

    Class<?> getInstanceClass() {
        return instanceClass;
    }
}
