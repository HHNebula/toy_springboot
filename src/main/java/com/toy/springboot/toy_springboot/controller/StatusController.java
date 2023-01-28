package com.toy.springboot.toy_springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.toy.springboot.toy_springboot.service.FormService;
import com.toy.springboot.toy_springboot.service.StatusService;

@Controller
@RequestMapping(value = "/status")
public class StatusController {

    @Autowired
    FormService formService;

    @Autowired
    StatusService statusService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String root() {

        return "redirect:/status/interest";

    }

    @RequestMapping(value = "/interest", method = RequestMethod.GET)
    public ModelAndView interest(ModelAndView modelAndView) {

        Object carList = formService.getCarList();
        Object interestList = statusService.getInterestList();

        modelAndView.addObject("carList", carList);
        modelAndView.addObject("interestList", interestList);

        modelAndView.setViewName("status/interest");

        return modelAndView;

    }

    @RequestMapping(value = "/satisfaction/{cuid}", method = RequestMethod.GET)
    public ModelAndView status(@PathVariable Object cuid, ModelAndView modelAndView) {

        Object carList = formService.getCarList();
        Object questionList = formService.getQuestionList();
        Object answerList = statusService.getAnswerList();
        Object satisfactionList = statusService.getSatisfactionList(cuid);

        modelAndView.addObject("cuid", cuid);
        modelAndView.addObject("carList", carList);
        modelAndView.addObject("questionList", questionList);
        modelAndView.addObject("answerList", answerList);
        modelAndView.addObject("satisfactionList", satisfactionList);

        modelAndView.setViewName("status/satisfaction");

        return modelAndView;

    }

}