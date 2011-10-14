// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.glf.pizzashop.domain;

import com.glf.pizzashop.domain.PizzaOrder;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect PizzaOrder_Roo_Json {
    
    public String PizzaOrder.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public static PizzaOrder PizzaOrder.fromJsonToPizzaOrder(String json) {
        return new JSONDeserializer<PizzaOrder>().use(null, PizzaOrder.class).deserialize(json);
    }
    
    public static String PizzaOrder.toJsonArray(Collection<PizzaOrder> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<PizzaOrder> PizzaOrder.fromJsonArrayToPizzaOrders(String json) {
        return new JSONDeserializer<List<PizzaOrder>>().use(null, ArrayList.class).use("values", PizzaOrder.class).deserialize(json);
    }
    
}
