
package com.ecom.mykart.helper;

public class Helpers {
    public static String get10Words(String desc) {
        String[] strs = desc.split(" ");
        if(strs.length>10) {
            String res="";
            for(int i=0;i<10;i++) {
                res += strs[i]+" ";
            }
            return (res+"...");
        } else {
            return (desc+"...");
        }
    }
    
}
