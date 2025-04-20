package org.xaspect;

public class StringUtils {
    public static String getDaoNameWithPrefixHash(String daoName, String prefix) {
        String implClassName = daoName + "ImplWithPrefixHash";
        if (prefix != null && !prefix.isEmpty()) {
            int hashRes = prefix.hashCode();
            implClassName += Integer.toUnsignedString(hashRes).charAt(0) + Integer.toString(hashRes).substring(1);
        }
        return implClassName;
    }
}
