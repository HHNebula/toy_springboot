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
    public Object root(HttpSession session) {
        Map<String, Object> check = (Map<String, Object>) session.getAttribute("userInfo");
        if (check != null) {
            return "redirect:/form/survey";
        } else {
            return "redirect:/form/login";
        }
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
        Map<String, Object> resultMap = (Map<String, Object>) userInfo;
        String muid;
        try {
            muid = (String) resultMap.get("MUID");
        } catch (Exception e) {
            muid = null;
        }

        if (muid == null) {
            modelAndView.addObject("msg", "로그인 정보가 불일치합니다.");
            modelAndView.setViewName("form/login");
            return modelAndView;
        } else {
            session.setAttribute("userInfo", userInfo);
            return "redirect:/form/survey";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/form/login";
    }

    @GetMapping("/survey")
    public ModelAndView survuey(ModelAndView modelAndView) {
        modelAndView.setViewName("form/survey");
        return modelAndView;
    }

    @GetMapping("/mypage")
    public ModelAndView mypage(ModelAndView modelAndView, HttpSession session) {
        Object cars = formService.getCarList();
        modelAndView.addObject("cars", cars);
        modelAndView.setViewName("form/mypage");
        return modelAndView;
    }

    @PostMapping("/mypage")
    public ModelAndView update(@RequestParam Map<String, Object> params, ModelAndView modelAndView,
            HttpSession session) {
        formService.updateUserInfo(params);
        Map<String, Object> updateInfo = new HashMap<>();
        updateInfo.put("id", params.get("id"));
        updateInfo.put("pw", params.get("pw"));
        Object userInfo = formService.loginAttempt(updateInfo);
        session.setAttribute("userInfo", userInfo);
        Object cars = formService.getCarList();
        modelAndView.addObject("cars", cars);
        modelAndView.setViewName("form/mypage");
        return modelAndView;
    }

    @PostMapping("/delete")
    public String drop(@RequestParam Map<String, Object> params, ModelAndView modelAndView,
            HttpSession session) {
        formService.dropUser(params);
        session.invalidate();
        return "redirect:/form/login";
    }

    @GetMapping("/signup")
    public ModelAndView signupGet(ModelAndView modelAndView) {
        Object cars = formService.getCarList();
        modelAndView.addObject("cars", cars);
        modelAndView.setViewName("form/mypage");
        return modelAndView;
    }

    @PostMapping("/signup")
    public String signupPost(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object muid = UUID.randomUUID().toString();
        params.put("muid", muid);
        formService.insertUser(params);

        return "redirect:/form/login";
    }

}
