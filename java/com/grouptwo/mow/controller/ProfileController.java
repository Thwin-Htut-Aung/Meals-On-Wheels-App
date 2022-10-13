package com.grouptwo.mow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.grouptwo.mow.annotation.Authenticated;
import com.grouptwo.mow.dao.Users;
import com.grouptwo.mow.service.MoWUserDetails;
import com.grouptwo.mow.service.UsersService;

@Controller
public class ProfileController {
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/profile")
	@Authenticated
	public ModelAndView getProfile(ModelAndView mav, @AuthenticationPrincipal MoWUserDetails userDetails) {
		Users user = usersService.findByEmail(userDetails.getUsername());
		
		mav.addObject("user", user);
		
		mav.setViewName("profile");
		return mav;
	}
	
	@GetMapping("/update_profile")
	@Authenticated
	public ModelAndView loadUpdateProfile(ModelAndView mav, @AuthenticationPrincipal MoWUserDetails userDetails) {
		Users user = usersService.findByEmail(userDetails.getUsername());
		
		mav.addObject("user", user);
		
		mav.setViewName("profile_updt");
		return mav;
	}
	
	@PostMapping(value = "/update_profile/{id}")
	@Authenticated
	public ModelAndView saveUpdateProfile(@ModelAttribute("user") Users user, @PathVariable long id, ModelAndView mav) {
		usersService.updateUser(user, id);
		mav.setViewName("profile");
		return mav;
	}

}
