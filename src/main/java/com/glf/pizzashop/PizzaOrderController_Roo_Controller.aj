// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.glf.pizzashop;

import com.glf.pizzashop.domain.Pizza;
import com.glf.pizzashop.domain.PizzaOrder;
import com.glf.pizzashop.domain.PizzaOrderPk;
import com.glf.pizzashop.service.PizzaOrderService;
import com.glf.pizzashop.service.PizzaService;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.ConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PizzaOrderController_Roo_Controller {
    
    private ConversionService PizzaOrderController.conversionService;
    
    @Autowired
    PizzaOrderService PizzaOrderController.pizzaOrderService;
    
    @Autowired
    PizzaService PizzaOrderController.pizzaService;
    
    @Autowired
    public PizzaOrderController.new(ConversionService conversionService) {
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String PizzaOrderController.create(@Valid PizzaOrder pizzaOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("pizzaOrder", pizzaOrder);
            addDateTimeFormatPatterns(uiModel);
            return "pizzaorders/create";
        }
        uiModel.asMap().clear();
        pizzaOrderService.savePizzaOrder(pizzaOrder);
        return "redirect:/pizzaorders/" + encodeUrlPathSegment(conversionService.convert(pizzaOrder.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PizzaOrderController.createForm(Model uiModel) {
        uiModel.addAttribute("pizzaOrder", new PizzaOrder());
        addDateTimeFormatPatterns(uiModel);
        return "pizzaorders/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PizzaOrderController.show(@PathVariable("id") PizzaOrderPk id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("pizzaorder", pizzaOrderService.findPizzaOrder(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "pizzaorders/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PizzaOrderController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("pizzaorders", pizzaOrderService.findPizzaOrderEntries(firstResult, sizeNo));
            float nrOfPages = (float) pizzaOrderService.countAllPizzaOrders() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("pizzaorders", pizzaOrderService.findAllPizzaOrders());
        }
        addDateTimeFormatPatterns(uiModel);
        return "pizzaorders/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PizzaOrderController.update(@Valid PizzaOrder pizzaOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("pizzaOrder", pizzaOrder);
            addDateTimeFormatPatterns(uiModel);
            return "pizzaorders/update";
        }
        uiModel.asMap().clear();
        pizzaOrderService.updatePizzaOrder(pizzaOrder);
        return "redirect:/pizzaorders/" + encodeUrlPathSegment(conversionService.convert(pizzaOrder.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PizzaOrderController.updateForm(@PathVariable("id") PizzaOrderPk id, Model uiModel) {
        uiModel.addAttribute("pizzaOrder", pizzaOrderService.findPizzaOrder(id));
        addDateTimeFormatPatterns(uiModel);
        return "pizzaorders/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PizzaOrderController.delete(@PathVariable("id") PizzaOrderPk id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PizzaOrder pizzaOrder = pizzaOrderService.findPizzaOrder(id);
        pizzaOrderService.deletePizzaOrder(pizzaOrder);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pizzaorders";
    }
    
    @ModelAttribute("pizzas")
    public Collection<Pizza> PizzaOrderController.populatePizzas() {
        return pizzaService.findAllPizzas();
    }
    
    @ModelAttribute("pizzaorders")
    public Collection<PizzaOrder> PizzaOrderController.populatePizzaOrders() {
        return pizzaOrderService.findAllPizzaOrders();
    }
    
    void PizzaOrderController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("pizzaOrder_deliverydate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String PizzaOrderController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
