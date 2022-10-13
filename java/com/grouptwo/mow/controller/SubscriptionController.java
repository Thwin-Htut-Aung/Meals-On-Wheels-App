package com.grouptwo.mow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grouptwo.mow.dao.Subscription;
import com.grouptwo.mow.dao.Users;
import com.grouptwo.mow.repo.RolesRepo;
import com.grouptwo.mow.service.SubService;
import com.grouptwo.mow.service.UsersService;

@Controller
public class SubscriptionController {

	@Autowired
	private UsersService usersService;
	
	@Autowired
	private SubService subService;
	
	@Autowired
	private RolesRepo rolesRepo;
	
	
	@GetMapping("view-subs")
    public String viewSubcriptions(Model model) {
		
		String uemail;
		   Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		   if(principal instanceof UserDetails) {
			    uemail=((UserDetails) principal).getUsername();
			 
		   }
		   else {
			    uemail=principal.toString();
		   }
		   
		   Users user = usersService.findByEmail(uemail);
		   
		   
		   if(user.getRoles().contains(rolesRepo.getById(Long.valueOf(3))) || 
					  user.getRoles().contains(rolesRepo.getById(Long.valueOf(4))) || 
				   	  user.getRoles().contains(rolesRepo.getById(Long.valueOf(6)))){
			   
			   List<Subscription> subs = subService.viewSubs();
			   if(!CollectionUtils.isEmpty(subs)) {
		            model.addAttribute("subs", subs);
		        }  
		   }
		   
		   if(user.getRoles().contains(rolesRepo.getById(Long.valueOf(1))) || 
				   	  user.getRoles().contains(rolesRepo.getById(Long.valueOf(2)))){
			   
		   List<Subscription> subs = user.getSubs();
        
		   		if(!CollectionUtils.isEmpty(subs)) {
            model.addAttribute("subs", subs);
		   		}
		   }
		   
        return "view_subs";
    }
	
	
	@GetMapping("new-sub")
    public String addSubscripion(Model model) {
        Subscription sub = new Subscription();
        model.addAttribute("sub", sub);
        return "new_sub";
    }

	
	@PostMapping("save-sub")
    public String saveSubscription(Subscription sub, Model model) {
		
		
		String uemail;
		   Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		   if(principal instanceof UserDetails) {
			    uemail=((UserDetails) principal).getUsername();
			 
		   }
		   else {
			    uemail=principal.toString();
		   }
		   
		   Users user = usersService.findByEmail(uemail);
		   
		   sub.setUser(user);
		   subService.saveSub(sub);
		
        return "redirect:view-subs";
    }
	
	@GetMapping("delete-sub")
    public String deleteSubscripion(@RequestParam long id) {
        subService.deleteSub(id);
        return "redirect:view-subs";
    }
	
	
}
