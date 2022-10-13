package com.grouptwo.mow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grouptwo.mow.dao.Users;
import com.grouptwo.mow.service.UsersService;

//@Controller
public class OtherControllers {
	
//	@Autowired
//	UsersService userService;
//
//	@GetMapping(value = "/profile")
//	public String showProfile(Model model) {
//		
//		 String uemail;
//		   Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		   if(principal instanceof UserDetails) {
//			    uemail=((UserDetails) principal).getUsername();
//			 
//		   }
//		   else {
//			    uemail=principal.toString();
//		   }
//		Users user = userService.getUserByEmail(uemail);
//		model.addAttribute("user", user);
//		
//		return "profile";
//	}
	
}
