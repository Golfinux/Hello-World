// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.glf.pizzashop;

import com.glf.pizzashop.domain.PizzaOrder;
import com.glf.pizzashop.domain.PizzaOrderPk;
import java.lang.String;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect PizzaOrderController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PizzaOrderController.showJson(@PathVariable("id") PizzaOrderPk id) {
        PizzaOrder pizzaorder = pizzaOrderService.findPizzaOrder(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        if (pizzaorder == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(pizzaorder.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> PizzaOrderController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        List<PizzaOrder> result = pizzaOrderService.findAllPizzaOrders();
        return new ResponseEntity<String>(PizzaOrder.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PizzaOrderController.createFromJson(@RequestBody String json) {
        PizzaOrder pizzaOrder = PizzaOrder.fromJsonToPizzaOrder(json);
        pizzaOrderService.savePizzaOrder(pizzaOrder);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PizzaOrderController.createFromJsonArray(@RequestBody String json) {
        for (PizzaOrder pizzaOrder: PizzaOrder.fromJsonArrayToPizzaOrders(json)) {
            pizzaOrderService.savePizzaOrder(pizzaOrder);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> PizzaOrderController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        PizzaOrder pizzaOrder = PizzaOrder.fromJsonToPizzaOrder(json);
        if (pizzaOrderService.updatePizzaOrder(pizzaOrder) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> PizzaOrderController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        for (PizzaOrder pizzaOrder: PizzaOrder.fromJsonArrayToPizzaOrders(json)) {
            if (pizzaOrderService.updatePizzaOrder(pizzaOrder) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> PizzaOrderController.deleteFromJson(@PathVariable("id") PizzaOrderPk id) {
        PizzaOrder pizzaOrder = pizzaOrderService.findPizzaOrder(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text");
        if (pizzaOrder == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        pizzaOrderService.deletePizzaOrder(pizzaOrder);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
