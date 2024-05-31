package com.psvm.curation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CurationController {
	
	@RequestMapping(value="gotoCuration.cu")
	public String gotoCuration() {
		return "curation/curation" ; 
	}
	
}
