package com.toy.springboot.toy_springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    @GetMapping("")
    public ModelAndView home(ModelAndView modelAndView) {
        modelAndView.setViewName("home/home");
        return modelAndView;
    }

}
