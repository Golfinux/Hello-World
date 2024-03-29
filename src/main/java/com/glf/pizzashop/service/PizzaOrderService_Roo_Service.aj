// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.glf.pizzashop.service;

import com.glf.pizzashop.domain.PizzaOrder;
import com.glf.pizzashop.domain.PizzaOrderPk;
import java.util.List;

privileged aspect PizzaOrderService_Roo_Service {
    
    public abstract long PizzaOrderService.countAllPizzaOrders();    
    public abstract void PizzaOrderService.deletePizzaOrder(PizzaOrder pizzaOrder);    
    public abstract PizzaOrder PizzaOrderService.findPizzaOrder(PizzaOrderPk id);    
    public abstract List<PizzaOrder> PizzaOrderService.findAllPizzaOrders();    
    public abstract List<PizzaOrder> PizzaOrderService.findPizzaOrderEntries(int firstResult, int maxResults);    
    public abstract void PizzaOrderService.savePizzaOrder(PizzaOrder pizzaOrder);    
    public abstract PizzaOrder PizzaOrderService.updatePizzaOrder(PizzaOrder pizzaOrder);    
}
