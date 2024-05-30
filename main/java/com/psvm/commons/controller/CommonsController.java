package com.psvm.commons.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommonsController {
	@GetMapping("home.ma")
	public String home() {
		return "redirect:/";
	}

	
	@GetMapping("quration.ma")
	public String quration() {
		return "main/main";
	}
	
	@GetMapping("community.ma")
	public String community() {
		return "community/community";
	}
	
	@GetMapping("store.ma")
	public String store() {
		return "store/store";
	}

	
}
