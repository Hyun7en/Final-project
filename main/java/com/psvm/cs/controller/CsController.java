package com.psvm.cs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psvm.cs.service.CsService;


@Controller
public class CsController {
	
	@Autowired
	private CsService csService;
	
	//list.cs
	
	@RequestMapping("list.cs")
	public String selectListCs() {
		
		return "cs/CsList";
	}
	
}
