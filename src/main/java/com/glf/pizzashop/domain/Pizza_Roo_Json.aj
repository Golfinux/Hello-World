// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.glf.pizzashop.domain;

import com.glf.pizzashop.domain.Pizza;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Pizza_Roo_Json {
    
    public String Pizza.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public static Pizza Pizza.fromJsonToPizza(String json) {
        return new JSONDeserializer<Pizza>().use(null, Pizza.class).deserialize(json);
    }
    
    public static String Pizza.toJsonArray(Collection<Pizza> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Pizza> Pizza.fromJsonArrayToPizzas(String json) {
        return new JSONDeserializer<List<Pizza>>().use(null, ArrayList.class).use("values", Pizza.class).deserialize(json);
    }
    
}
