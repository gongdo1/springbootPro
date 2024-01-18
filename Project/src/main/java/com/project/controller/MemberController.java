package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	
	@GetMapping("index.do")
	String index() {
		System.out.println("맵핑TEST");
		return "index";
	}
}
