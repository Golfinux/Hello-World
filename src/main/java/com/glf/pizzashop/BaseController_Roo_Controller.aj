// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.glf.pizzashop;

import com.glf.pizzashop.domain.Base;
import com.glf.pizzashop.service.BaseService;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect BaseController_Roo_Controller {
    
    @Autowired
    BaseService BaseController.baseService;
    
    @RequestMapping(method = RequestMethod.POST)
    public String BaseController.create(@Valid Base base, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("base", base);
            return "bases/create";
        }
        uiModel.asMap().clear();
        baseService.saveBase(base);
        return "redirect:/bases/" + encodeUrlPathSegment(base.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String BaseController.createForm(Model uiModel) {
        uiModel.addAttribute("base", new Base());
        return "bases/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String BaseController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("base", baseService.findBase(id));
        uiModel.addAttribute("itemId", id);
        return "bases/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String BaseController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("bases", baseService.findBaseEntries(firstResult, sizeNo));
            float nrOfPages = (float) baseService.countAllBases() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("bases", baseService.findAllBases());
        }
        return "bases/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String BaseController.update(@Valid Base base, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("base", base);
            return "bases/update";
        }
        uiModel.asMap().clear();
        baseService.updateBase(base);
        return "redirect:/bases/" + encodeUrlPathSegment(base.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String BaseController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("base", baseService.findBase(id));
        return "bases/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String BaseController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Base base = baseService.findBase(id);
        baseService.deleteBase(base);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/bases";
    }
    
    @ModelAttribute("bases")
    public Collection<Base> BaseController.populateBases() {
        return baseService.findAllBases();
    }
    
    String BaseController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
