// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.glf.pizzashop.domain;

import com.glf.pizzashop.domain.PizzaOrderPk;
import java.lang.Integer;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Version;

privileged aspect PizzaOrder_Roo_Jpa_Entity {
    
    declare @type: PizzaOrder: @Entity;
    
    @EmbeddedId
    private PizzaOrderPk PizzaOrder.id;
    
    @Version
    @Column(name = "version")
    private Integer PizzaOrder.version;
    
    public PizzaOrderPk PizzaOrder.getId() {
        return this.id;
    }
    
    public void PizzaOrder.setId(PizzaOrderPk id) {
        this.id = id;
    }
    
    public Integer PizzaOrder.getVersion() {
        return this.version;
    }
    
    public void PizzaOrder.setVersion(Integer version) {
        this.version = version;
    }
    
}
