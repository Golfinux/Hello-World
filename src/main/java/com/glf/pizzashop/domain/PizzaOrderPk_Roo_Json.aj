// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.glf.pizzashop.domain;

import com.glf.pizzashop.domain.PizzaOrderPk;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect PizzaOrderPk_Roo_Json {
    
    public String PizzaOrderPk.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static PizzaOrderPk PizzaOrderPk.fromJsonToPizzaOrderPk(String json) {
        return new JSONDeserializer<PizzaOrderPk>().use(null, PizzaOrderPk.class).deserialize(json);
    }
    
    public static String PizzaOrderPk.toJsonArray(Collection<PizzaOrderPk> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<PizzaOrderPk> PizzaOrderPk.fromJsonArrayToPizzaOrderPks(String json) {
        return new JSONDeserializer<List<PizzaOrderPk>>().use(null, ArrayList.class).use("values", PizzaOrderPk.class).deserialize(json);
    }
    
}
