package org.xaspect;

import javax.lang.model.element.TypeElement;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

class InstanceDUTTypeInfo {
    private final String instanceName;
    private final SpecificDUTTypeInfo instanceType;

    InstanceDUTTypeInfo(String instanceName, TypeElement instanceType) {
        this.instanceName = instanceName;
        this.instanceType = SpecificDUTTypeInfo.getSpecificDUTTypeInfo(instanceType);
    }

    String getInstanceName() {
        return instanceName;
    }

    TypeElement getInstanceType() {
        return instanceType.typeElement;
    }

    Set<String> getFieldNames() {
        return instanceType.fieldNames;
    }


    private static class SpecificDUTTypeInfo {
        private final TypeElement typeElement;
        private final Set<String> fieldNames;
        private static final Map<TypeElement, SpecificDUTTypeInfo> elementMap = new HashMap<>();

        private static SpecificDUTTypeInfo getSpecificDUTTypeInfo(TypeElement typeElement) {
            if (!elementMap.containsKey(typeElement)) {
                elementMap.put(typeElement, new SpecificDUTTypeInfo(typeElement));
            }
            return elementMap.get(typeElement);
        }

        private SpecificDUTTypeInfo(TypeElement typeElement) {
            this.typeElement = typeElement;
            fieldNames = TypeParserHelper.getInstance().collectAllFields(typeElement).keySet();
            if (typeElement != null) {
                System.err.println(typeElement.getQualifiedName().toString());
            }
        }


    }


}
