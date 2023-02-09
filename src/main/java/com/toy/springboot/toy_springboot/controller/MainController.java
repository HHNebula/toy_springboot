package com.toy.springboot.toy_springboot.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    @GetMapping("")
    public ModelAndView home(ModelAndView modelAndView) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            String password = ((UserDetails) principal).getPassword();
            System.out.println("Username : " + username);
            System.out.println("Password : " + password);

            System.out.println(((UserDetails) principal).hashCode());
            System.out.println(((UserDetails) principal).isAccountNonExpired());
            System.out.println(((UserDetails) principal).isAccountNonExpired());
            System.out.println(((UserDetails) principal).isAccountNonLocked());
            System.out.println(((UserDetails) principal).isCredentialsNonExpired());
            System.out.println(((UserDetails) principal).isEnabled());
            System.out.println(((UserDetails) principal).toString());
            System.out.println(((UserDetails) principal).getClass());
            System.out.println(((UserDetails) principal).getAuthorities());
        } else {
            String username = principal.toString();
        }
        modelAndView.setViewName("home/home");
        return modelAndView;
    }

}
