package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.account.AccountServiceImpl;
import com.project.account.AccountVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	private AccountServiceImpl service;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("accountForm.do")
	public String accountForm() {
		return "/member/accountForm";
	}
	
	@PostMapping("accountInsert.do")
	public String accountInsert(AccountVo vo) {
		System.out.println("vo= "+vo);
		return "index";
	}
	
	@GetMapping("accountList.do")
	public String accountList(Model model, HttpServletRequest req, HttpSession session) {
		System.out.println("TEST");

		session.setAttribute("se", service.login(null));

		model.addAttribute("li", service.accountList());
		return "/member/accountList";
	}
	
	
}
