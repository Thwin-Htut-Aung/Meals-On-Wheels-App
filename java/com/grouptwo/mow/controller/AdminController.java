package com.grouptwo.mow.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.grouptwo.mow.dao.FileDB;
import com.grouptwo.mow.dao.RoleName;
import com.grouptwo.mow.dao.Users;
import com.grouptwo.mow.repo.RolesRepo;
import com.grouptwo.mow.repo.UsersRepo;
import com.grouptwo.mow.service.FileStorageService;
import com.grouptwo.mow.service.UsersService;

@Controller
@RequestMapping("/admin")
@Secured(value = "ROLE_ADMIN")
public class AdminController {
	
	@Autowired
	private UsersRepo usersRepo;
	
	@Autowired
	private RolesRepo rolesRepo;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private FileStorageService fileStorageService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping(value = "/add_user")
	public ModelAndView getAddUser(@ModelAttribute("user") Users user, ModelAndView mav) {
		mav.addObject("action", "add_user");
		mav.setViewName("user_add");
		return mav;
	}
	
	@PostMapping(value = "/add_user")
	public ModelAndView postRegisCaregiver(@ModelAttribute("user") Users user, ModelAndView mav,
			@RequestParam("role") String role) throws ModelAndViewDefiningException {
		if(usersService.getByEmail(user.getEmail()) == true) {
			mav.addObject("action", "add_user");
			mav.addObject("msg_dupe", "Email already used. Please create another one");
    		mav.setViewName("user_add");
		}
		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		if (role.equalsIgnoreCase("admin")) {
			user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_ADMIN)));
		} else if (role.equalsIgnoreCase("caregiver")) {
			user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_CAREGIVER)));
		} else if (role.equalsIgnoreCase("member")) {
			user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_MEMBER)));
		} else if (role.equalsIgnoreCase("partner")) {
			user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_PARTNER)));
		} else if (role.equalsIgnoreCase("volunteer")) {
			user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_VOLUNTEER)));
		} else if (role.equalsIgnoreCase("rider")) {
			user.setRoles(new HashSet<>(rolesRepo.findByName(RoleName.ROLE_RIDER)));
		} 
		
		user.setCreated(new Date());
		usersRepo.save(user);
		
		mav.addObject("action", "add_user");
		mav.addObject("msg", "add success");
		mav.setViewName("user_add");
		
		return mav;
	}
	
	@GetMapping("/list_users")
	public ModelAndView listAllUsers(ModelAndView mav) {
		List<Users> listusers = usersService.getUsers();
		mav.addObject("listusers", listusers);
		mav.addObject("msg_delete", "delete success");
		mav.setViewName("admin_dash");
		return mav;
	}
	
	@GetMapping("/view_user/{id}")
	public ModelAndView viewUser(@PathVariable long id, ModelAndView mav) {
		Users user = usersService.getUserById(id);
		mav.addObject("user", user);
		mav.setViewName("user_view");
		return mav;
	}
	
//	@GetMapping(value = "/files/{id}")
//	protected String preivewSection(HttpServletRequest request, HttpSession httpSession, HttpServletResponse response,
//			@PathVariable String id) {
//		try {
//			FileDB fileDB = fileStorageService.getFile(id);
//			response.setHeader("Content-Disposition", "attachment; filename="+ fileDB.getName());
////			response.setDateHeader("Expires", -1);
////			response.setContentType("application/pdf");
////			response.setContentLength(fileDB.getData().length);
////			response.getOutputStream().write(fileDB.getData());
//		} catch (Exception ioe) {
//		} finally {
//		}
//		return null;
//	}
	
//	@GetMapping(value = "/files/{id}")
//	public void downloadPDFResource( HttpServletRequest request, 
//            HttpServletResponse response, 
//            @PathVariable("id") String id) {
//		FileDB fileDB = fileStorageService.getFile(id);
//		String dataDirectory = request.getServletContext().getRealPath("D:/campus/aa12_devs-enerprise/download");
//	    Path file = Paths.get(dataDirectory, fileDB.getName());
//	    if (Files.exists(file)) 
//	    {
//	      response.setContentType("application/pdf");
//	      response.addHeader("Content-Disposition", "attachment; filename="+fileDB.getName());
//	      try
//	      {
//	        Files.copy(file, response.getOutputStream());
//	        response.getOutputStream().flush();
//	      } 
//	      catch (IOException ex) {
//	        ex.printStackTrace();
//	      }
//	    }
//	}
	
	@GetMapping(value = "/edit_user/{id}")
	public ModelAndView getEditUser(@PathVariable long id, ModelAndView mav) {
		Users user = usersService.getUserById(id);
		mav.addObject("user", user);
		mav.setViewName("user_edit");
		return mav;
	}
	
	@PostMapping(value = "/edit_user/{id}")
	public ModelAndView postEditUser(@ModelAttribute("user") Users user, @PathVariable long id, ModelAndView mav) {
		usersService.updateUser(user, id);
		mav.addObject("msg", "update success");
		mav.setViewName("redirect:/admin/edit_user/" + id);
		return mav;
	}
	
	@GetMapping(value = "/delete_user/{id}")
	public ModelAndView deleteUser(@PathVariable long id, ModelAndView mav) {
		usersService.deleteUser(id);
		mav.setViewName("redirect:/admin/list_users");
		return mav;
	}
	
	@GetMapping(value = "/verify/{id}")
	public ModelAndView verifyUser(@PathVariable long id, ModelAndView mav) {
		Users user = usersService.getUserById(id);
		if(user.isVerified() == false) {
			user.setVerified(true);
		} else {
			user.setVerified(false);
		}
		usersRepo.save(user);
		
		mav.setViewName("redirect:/admin/view_user/"+user.getUserId());
		return mav;
	}
	
	@GetMapping(value = "/search")
	public ModelAndView searchWithKey(@RequestParam(value = "keyword", required = false) String keyword, ModelAndView mav) {
		List<Users> listusers = usersService.searchByParam(keyword);
		
		if(listusers == null || listusers.isEmpty()) {
    		mav.addObject("msg", "Sorry we couldn't find any result for '"+keyword+"'");
    	} else {
    		mav.addObject("msg", "Result of your search for '"+keyword+"'");
    		mav.addObject("listusers", listusers);
    	}
    	mav.setViewName("admin_dash");
		
		return mav;
	}

}
