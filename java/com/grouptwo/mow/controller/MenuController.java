package com.grouptwo.mow.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.grouptwo.mow.dao.Menu;
import com.grouptwo.mow.dao.MenuOrder;
import com.grouptwo.mow.dao.MenuOrderKey;
import com.grouptwo.mow.dao.Orders;
import com.grouptwo.mow.dao.RiderDetails;
import com.grouptwo.mow.dao.Users;
import com.grouptwo.mow.repo.RiderDetailsRepo;
import com.grouptwo.mow.repo.RolesRepo;
import com.grouptwo.mow.service.MenuService;
import com.grouptwo.mow.service.UsersService;

@Controller
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private RolesRepo rolesRepo;
	
	@Autowired
	private RiderDetailsRepo riderDetailsRepo;
	
	@GetMapping("view-menu")
	@Secured(value = { "ROLE_CAREGIVER", "ROLE_MEMBER", "ROLE_PARTNER", "ROLE_VOLUNTEER", "ROLE_ADMIN"})
    public String viewMeals(Model model) {
        List<Menu> meals = menuService.viewMeals();
        if(!CollectionUtils.isEmpty(meals)) {
            model.addAttribute("meals", meals);
        }
        return "view_menu";
    }
	
	@GetMapping("view-orders")
	@Secured(value = { "ROLE_CAREGIVER", "ROLE_MEMBER", "ROLE_PARTNER", "ROLE_VOLUNTEER", "ROLE_RIDER", "ROLE_ADMIN"})
    public String viewOrders(Model model) {
        
        String uemail;
		   Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		   if(principal instanceof UserDetails) {
			    uemail=((UserDetails) principal).getUsername();
			 
		   }
		   else {
			    uemail=principal.toString();
		   }
		   
		   Users user = usersService.findByEmail(uemail);
		   
		
		   if(user.getRoles().contains(rolesRepo.getById(Long.valueOf(1))) || 
				   user.getRoles().contains(rolesRepo.getById(Long.valueOf(2)))) {
		   
			   List<Orders> orders = user.getOrders();
			   if(!CollectionUtils.isEmpty(orders)) {
		            model.addAttribute("orders", orders);
		        }
		        
		   }
		  
		   if(user.getRoles().contains(rolesRepo.getById(Long.valueOf(3))) || 
			  user.getRoles().contains(rolesRepo.getById(Long.valueOf(4))) || 
		   	  user.getRoles().contains(rolesRepo.getById(Long.valueOf(6)))){
			   
			   List<Orders> orders = menuService.viewOrders();
		        if(!CollectionUtils.isEmpty(orders)) {
		            model.addAttribute("orders", orders);
		        }
		        
		        List<Users> users = usersService.getUsers();
		        List<Users> riders = new ArrayList<Users>();
		        for(Users u : users){
		        	if(u.getRoles().contains(rolesRepo.getById(Long.valueOf(5)))){
		        		riders.add(u);
		        	}
		        }
		        model.addAttribute("riders", riders);
		        
		        
		   }
		   
		   if(user.getRoles().contains(rolesRepo.getById(Long.valueOf(5)))){
			   RiderDetails riderDetails = user.getRider();
			   int numberOfOrders = riderDetails.getNumberOfOrders();
			   model.addAttribute("number_of_orders", numberOfOrders);
			   
			   List<Orders> allOrders = riderDetails.getOrders();
			   if(!CollectionUtils.isEmpty(allOrders)) {
				   List<Orders> orders = new ArrayList<Orders>();
				   for(Orders o:allOrders){
					   if(o.isPickedUp()==false){ orders.add(o); }
				   }
		            model.addAttribute("orders", orders);
		        }
		            
		        
		   }
		   
		   
		   return "view_orders";
    }
    
	
    @GetMapping("new-meal")
    @Secured(value = { "ROLE_PARTNER", "ROLE_VOLUNTEER", "ROLE_ADMIN"})
	public String addMeal(Model model) {
    	System.out.println("To show add new meal page");
		Menu meal = new Menu();
		model.addAttribute("meal", meal);
		return "new_meal";
	}
    
    @PostMapping("save-meal")
    @Secured(value = { "ROLE_PARTNER", "ROLE_VOLUNTEER", "ROLE_ADMIN"})
    public String saveMeal(Menu meal, Model model) {
    	
    	System.out.println("Save & Update new meal");
        menuService.saveMeal(meal);	       
        return "redirect:view-menu";
    }
    
    @GetMapping("save-order")
    @Secured(value = { "ROLE_CAREGIVER", "ROLE_MEMBER"})
    public String saveOrder(@RequestParam Map<String,String> params) {
    	
    	System.out.println("Save meal order");
    	
    	List<MenuOrder> orderedMeals = new ArrayList<MenuOrder>();
    	
    	List<Menu> allMeals = menuService.viewMeals();
    	Long[] allMealIds = new Long[100];
    	int a=0;
    	for(Menu meal : allMeals){
    		allMealIds[a] = meal.getMealId();
    		a++;
    	}
    	
    	int i=0;
    
    	for (Map.Entry<String,String> entry : params.entrySet()){
    		
    		String key = entry.getKey();
    		String value = entry.getValue();
    		String j = String.valueOf(i);
    		
    		
    		if(key.equalsIgnoreCase("quantity"+j) && value!="" && Integer.parseInt(value)>0){
    			
    					MenuOrder orderedMeal = new MenuOrder();
    	    			orderedMeal.setQuantity(Integer.parseInt(value));
    	    			Long mealId = allMealIds[i];
    	    			orderedMeal.setMenu(menuService.getMealById(mealId));
    	    			for (Map.Entry<String,String> ent : params.entrySet()){
    	    	    		
    	    				if(ent.getKey().equalsIgnoreCase("seasoning"+j)){
    	    					orderedMeal.setSeasoning(ent.getValue());
    	    				}
    	    				if(ent.getKey().equalsIgnoreCase("request"+j)){
    	    					orderedMeal.setRequest(ent.getValue());
    	    				}
    	    				
    	    			}
    	    			orderedMeals.add(orderedMeal);
    		}
    		i++;	
    		
				
    	}
    		
    	
    	String email;
		   Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		   if(principal instanceof UserDetails) {
			    email=((UserDetails) principal).getUsername();
			 
		   }
		   else {
			    email=principal.toString();
		   }
    	
		Users user = usersService.findByEmail(email);
    	Orders order = new Orders();
    	order.setOrderDate(new Date());
    	order.setUser(user);
    	order.setInformed(false);
    	order.setPickedUp(false);
    	menuService.saveOrder(order);
    	
    	
    	
    	for(MenuOrder meal: orderedMeals){
    	
    		meal.setOrder(order);
    		meal.setId(new MenuOrderKey(meal.getMenu().getMealId(), order.getOrderId()));	
    		menuService.saveOrderedMeal(meal);

    	}
    	
        	
        return "redirect:view-orders";
    }
    
    
    @GetMapping("inform-rider")
    @Secured(value = { "ROLE_PARTNER", "ROLE_VOLUNTEER", "ROLE_ADMIN"})
    public String informRider(@RequestParam("id") long id, @RequestParam("rideremail") String riderEmail) {
    	
    	System.out.println("Inform rider to pick up order");
        Orders order = menuService.getOrderById(id);
        Users user = usersService.findByEmail(riderEmail);
        RiderDetails riderDetails = user.getRider();
        riderDetails.setNumberOfOrders(riderDetails.getNumberOfOrders()+1);
        riderDetailsRepo.save(riderDetails); 
        order.setRiderName(user.getFullName());
        order.setRider(riderDetails);
        order.setInformed(true);
        menuService.saveOrder(order);
        
        return "redirect:view-orders";
    }
    
    @GetMapping("pick-up-order")
    @Secured(value = "ROLE_RIDER")
	public String pickUpOrder(@RequestParam long id) {
    	System.out.println("The rider picked up the order.");
    	
    	String uemail;
		   Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		   if(principal instanceof UserDetails) {
			    uemail=((UserDetails) principal).getUsername();
			 
		   }
		   else {
			    uemail=principal.toString();
		   }
		   
		RiderDetails riderDetails = usersService.findByEmail(uemail).getRider();   
    	Orders order = menuService.getOrderById(id);
    	riderDetails.setNumberOfOrders(riderDetails.getNumberOfOrders()-1);
    	riderDetailsRepo.save(riderDetails);
		order.setPickedUp(true);
		menuService.saveOrder(order);
		return "redirect:view-orders";
	}
    
    
    @GetMapping("edit")
    @Secured(value = { "ROLE_PARTNER", "ROLE_VOLUNTEER", "ROLE_ADMIN"})
	public String editMeal(@RequestParam long id, Model model) {
    	System.out.println("Update meal controller method");
		Menu meal = menuService.getMeal(id);
		model.addAttribute("meal", meal);
		return "new_meal";
	}
    
	
	@RequestMapping("delete")
	@Secured(value = { "ROLE_PARTNER", "ROLE_VOLUNTEER", "ROLE_ADMIN"})
	public String deleteMeal(@RequestParam long id) {
		menuService.deleteMeal(id);
		return "redirect:view-menu";		
	} 
    
	@GetMapping("search-meals")
	@Secured(value = { "ROLE_CAREGIVER", "ROLE_MEMBER", "ROLE_PARTNER", "ROLE_VOLUNTEER", "ROLE_ADMIN"})
	public String searchMeals(@RequestParam String keyword, Model model) {
    	System.out.println("Search meal controller method");
		List<Menu> searchResults = menuService.searchMeals(keyword);
		model.addAttribute("meals", searchResults);
		model.addAttribute("keyword", keyword);
		return "searched_meals";
	}
	
}
