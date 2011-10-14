package com.glf.pizzashop.repository;

import com.glf.pizzashop.domain.Pizza;
import org.springframework.roo.addon.layers.repository.jpa.RooRepositoryJpa;

@RooRepositoryJpa(domainType = Pizza.class)
public interface PizzaRepository {
}
