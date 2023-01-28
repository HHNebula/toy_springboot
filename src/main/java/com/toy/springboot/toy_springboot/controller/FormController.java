package com.toy.springboot.toy_springboot.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.toy.springboot.toy_springboot.service.FormService;

@Controller
@RequestMapping(value = "/form")
public class FormController {

    @Autowired
    FormService formService;

    @GetMapping(value = "")
    public String root() {

        return "redirect:/form/survey";

    }

    @GetMapping(value = "/login")
    public ModelAndView loginGet(ModelAndView modelAndView) {

        modelAndView.setViewName("form/login");

        return modelAndView;

    }

    @PostMapping(value = "/login")
    public Object loginPost(@RequestParam Map<String, Object> params, ModelAndView modelAndView,
            HttpSession session) {

        Object userInfo = formService.loginAttempt(params);

        if (userInfo == null) {
            modelAndView.addObject("msg", "로그인 정보가 불일치합니다.");
            modelAndView.setViewName("form/login");
            return modelAndView;
        } else {
            session.setAttribute("userInfo", userInfo);
            return "redirect:/form/survey";
        }

    }

    @GetMapping(value = "/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/form/login";

    }

    @GetMapping(value = "/survey")
    public ModelAndView survueyGet(ModelAndView modelAndView, HttpSession session) {

        Object questionList = formService.getQuestionList();
        modelAndView.addObject("questionList", questionList);

        Object carInfo = formService.getCarInfo(session.getAttribute("userInfo"));
        modelAndView.addObject("carInfo", carInfo);

        Object answerList = formService.getAnswerList();
        modelAndView.addObject("answerList", answerList);

        modelAndView.setViewName("form/survey");

        return modelAndView;

    }

    @PostMapping(value = "/survey")
    public String survueyPost(@RequestParam Map<String, Object> params) {

        formService.insertSurvey(params);

        return "redirect:/form/survey";

    }

    @GetMapping(value = "/mypage")
    public ModelAndView mypage(ModelAndView modelAndView) {

        Object cars = formService.getCarList();
        modelAndView.addObject("cars", cars);

        modelAndView.setViewName("form/mypage");

        return modelAndView;
    }

    @PostMapping(value = "/mypage")
    public String update(@RequestParam Map<String, Object> params, HttpSession session) {

        formService.updateUserInfo(params);

        Map<String, Object> updateInfo = new HashMap<>();
        updateInfo.put("id", params.get("id"));
        updateInfo.put("pw", params.get("pw"));

        Object userInfo = formService.loginAttempt(updateInfo);
        session.setAttribute("userInfo", userInfo);

        return "redirect:/form/survey";

    }

    @PostMapping(value = "/delete")
    public String drop(@RequestParam Map<String, Object> params, HttpSession session) {

        formService.dropUser(params);

        session.invalidate();

        return "redirect:/form/login";

    }

    @GetMapping(value = "/signup")
    public ModelAndView signupGet(ModelAndView modelAndView) {

        Object cars = formService.getCarList();
        modelAndView.addObject("cars", cars);

        modelAndView.setViewName("form/mypage");

        return modelAndView;
    }

    @PostMapping(value = "/signup")
    public String signupPost(@RequestParam Map<String, Object> params) {

        Object muid = UUID.randomUUID().toString();
        params.put("muid", muid);
        formService.insertUser(params);

        return "redirect:/form/login";

    }

}
