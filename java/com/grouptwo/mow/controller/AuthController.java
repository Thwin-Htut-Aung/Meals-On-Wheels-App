package com.grouptwo.mow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {
	
	@GetMapping(value="/login")
    public ModelAndView onLogin(ModelAndView mav) {
    	
    	mav.addObject("action", "action");
    	mav.setViewName("login");
        return mav;
    }

    @GetMapping(value="/login_error")
    public ModelAndView onLoginError(ModelAndView mav) {
        String error_msg = "Incorrect user or password. Please re-enter.";
        mav.addObject("action", "action");
        mav.addObject("error_msg", error_msg);
        mav.setViewName("login");
        return mav;
    }

}
