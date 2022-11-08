package com.grouptwo.mow.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.grouptwo.mow.dao.RiderDetails;
import com.grouptwo.mow.dao.RoleName;
import com.grouptwo.mow.dao.Roles;
import com.grouptwo.mow.dao.Users;
import com.grouptwo.mow.repo.RiderDetailsRepo;
import com.grouptwo.mow.repo.RolesRepo;
import com.grouptwo.mow.repo.UsersRepo;
import com.grouptwo.mow.service.FileStorageService;
import com.grouptwo.mow.service.MoWUserDetails;
import com.grouptwo.mow.service.UsersService;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private UsersRepo usersRepo;
	
	@Autowired
	private RolesRepo rolesRepo;
	
	@Autowired
	private RiderDetailsRepo riderRepo;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private FileStorageService fileStorageService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//registration page for different roles
    @GetMapping
    public ModelAndView toRegistration(ModelAndView mav) {
    	mav.addObject("action", "action");
    	mav.setViewName("register");
        return mav;
    }
	
	// ========== CAREGIVER =============
	@GetMapping(value = "/caregiver")
	public ModelAndView getRegisCaregiver(@ModelAttribute("user") Users user, ModelAndView mav) {
		mav.addObject("action", "caregiver");
		mav.setViewName("form_regis");
		return mav;
	}
	
	@PostMapping(value = "/caregiver")
	public ModelAndView postRegisCaregiver(@ModelAttribute("user") Users user, ModelAndView mav) throws ModelAndViewDefiningException {
		if(usersService.getByEmail(user.getEmail()) == true) {
			mav.addObject("action", "caregiver");
			mav.addObject("msg_dupe", "Email already used. Please create another one");
    		mav.setViewName("form_regis");
		}
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_CAREGIVER)));
		user.setCreated(new Date());
		usersRepo.save(user);
		
		mav.addObject("action", "caregiver");
		mav.setViewName("thankyou_regis");
		
		return mav;
	}
	
	// ========  MEMBER ==========
	@GetMapping(value = "/member")
	public ModelAndView getRegisMember(@ModelAttribute("user") Users user, ModelAndView mav) {
		mav.addObject("action", "member");
		mav.setViewName("form_regis");
		return mav;
	}
	
	@PostMapping(value = "/member")
	public ModelAndView postRegisMember(@ModelAttribute("user") Users user, ModelAndView mav, 
			@RequestParam("file") MultipartFile file, @AuthenticationPrincipal MoWUserDetails userDetails){
		
		if(usersService.getByEmail(user.getEmail()) == true) {
			mav.addObject("action", "member");
			mav.addObject("msg_dupe", "Email already used. Please create another one");
    		mav.setViewName("form_regis");
		}
		
		if(userDetails != null) {
			String email = userDetails.getUsername();
			Users caregiver = usersRepo.findByEmail(email).get();
			
			user.setCaregiverId(caregiver.getUserId());
		}
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_MEMBER)));
		user.setCreated(new Date());
		
		try {
			usersRepo.save(user);
			fileStorageService.storeFile(file, user);
			mav.addObject("action", "member");
			mav.setViewName("thankyou_regis");
			return mav;
		} catch (IOException e) {
			e.printStackTrace();
			mav.addObject("msg_uperror", "Upload Fail");
			mav.setViewName("form_regis");
			return mav;
		}
	}
	
	// ========= PARTNER ========
	@GetMapping(value = "/partner")
	public ModelAndView getRegisPartner(@ModelAttribute("user") Users user, ModelAndView mav) {
		mav.addObject("action", "partner");
		mav.setViewName("form_regis");
		return mav;
	}
	
	@PostMapping(value = "/partner")
	public ModelAndView postRegisPartner(@ModelAttribute("user") Users user, ModelAndView mav, 
			 @RequestParam("file") MultipartFile file){
		if(usersService.getByEmail(user.getEmail()) == true) {
			mav.addObject("action", "partner");
			mav.addObject("msg_dupe", "Email already used. Please create another one");
    		mav.setViewName("form_regis");
		}
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_PARTNER)));
		user.setCreated(new Date());
		
		try {
			usersRepo.save(user);
			fileStorageService.storeFile(file, user);
			mav.addObject("action", "partner");
			mav.setViewName("thankyou_regis");
			return mav;
		} catch (IOException e) {
			e.printStackTrace();
			mav.addObject("msg_uperror", "Upload Fail");
			mav.setViewName("form_regis");
			return mav;
		}
	}
	
	// ========== VOLUNTEER ==========
	@GetMapping(value = "/volunteer")
	public ModelAndView getRegisVolunteer(@ModelAttribute("user") Users user, ModelAndView mav) {
		mav.addObject("action", "volunteer");
		mav.setViewName("form_regis");
		return mav;
	}
	
	@PostMapping(value = "/volunteer")
	public ModelAndView postRegisVolunteer(@ModelAttribute("user") Users user, ModelAndView mav, 
			@RequestParam("file") MultipartFile file){
		if(usersService.getByEmail(user.getEmail()) == true) {
			mav.addObject("action", "volunteer");
			mav.addObject("msg_dupe", "Email already used. Please create another one");
    		mav.setViewName("form_regis");
		}
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_VOLUNTEER)));
		user.setCreated(new Date());
		
		try {
			usersRepo.save(user);
			fileStorageService.storeFile(file, user);
			mav.addObject("action", "volunteer");
			mav.setViewName("thankyou_regis");
			return mav;
		} catch (IOException e) {
			e.printStackTrace();
			mav.addObject("msg_uperror", "Upload Fail");
			mav.setViewName("form_regis_one");
			return mav;
		}
	}
	
	// ========= RIDER ============
	@GetMapping(value = "/rider")
	public ModelAndView getRegisRider(@ModelAttribute("user") Users user, ModelAndView mav) {
		mav.addObject("action", "rider");
		mav.setViewName("form_regis");
		return mav;
	}
	
	
	@PostMapping(value = "/rider")
	public ModelAndView postRegisRider(@ModelAttribute("user") Users user, ModelAndView mav, 
			@RequestParam("file") MultipartFile file){
		if(usersService.getByEmail(user.getEmail()) == true) {
			mav.addObject("action", "rider");
			mav.addObject("msg_dupe", "Email already used. Please create another one");
    		mav.setViewName("form_regis");
		}
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_RIDER)));
		user.setCreated(new Date());
		
		try {
			usersRepo.save(user);
			fileStorageService.storeFile(file, user);
			
			RiderDetails rider = new RiderDetails();
			rider.setUser(user);
			rider.setNumberOfOrders(0);
			riderRepo.save(rider);
			
			mav.addObject("action", "rider");
			mav.setViewName("thankyou_regis");
			return mav;
		} catch (IOException e) {
			e.printStackTrace();
			mav.addObject("msg_uperror", "Upload Fail");
			mav.setViewName("form_regis_rider");
			return mav;
		}
	}
	
	
	@GetMapping("thx")
	public ModelAndView testThx(ModelAndView mav) {
		
		mav.addObject("action", "member");
		
		mav.setViewName("thankyou_regis");
		return mav;
	}

	
//	// Upload File Controller
//	@PostMapping("/uploadfile")
//	public ModelAndView uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("email") String email,
//			ModelAndView mav) /*throws ModelAndViewDefiningException*/ {
//		
////		ModelAndView maverror = new ModelAndView();
////		maverror.setViewName("upload_file");
//		
//		if(email == null || email.isEmpty()) {
////			maverror.addObject("msg_error", "Email not exist");
////			  throw new ModelAndViewDefiningException(maverror);
//			mav.addObject("msg", "Email not exist");
//			mav.setViewName("upload_file");
//			return mav;
//		}
//		
//		Users user = usersRepo.findByEmail(email).get();
//		try {
//			fileStorageService.storeFile(file, user);
//			mav.addObject("msg", "Upload Success | Registration Success");
//			mav.setViewName("thankyou_one");
//			return mav;
//		} catch (IOException e) {
//			e.printStackTrace();
//			mav.addObject("msg", "Upload Fail");
//			mav.setViewName("upload_file");
//			return mav;
//		}
//		
//		//return mav;

	


}
