package com.project.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.project.account.AccountServiceImpl;
import com.project.account.AccountVo;
import com.project.account.BCrypt;
import com.project.board.BoardServiceImpl;
import com.project.board.BoardVo;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MemberController {

	@Autowired
	private AccountServiceImpl service;
	@Autowired
	private BoardServiceImpl bservice;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("accountForm.do")
	public String accountForm() {
		return "/member/accountForm";
	}
	@GetMapping("boardForm.do")
	public String boardForm() {
		return "/board/boardForm";
	}
	@GetMapping("boardList.do")
	public String boardList(Model model) {
		model.addAttribute("board", bservice.boardList());
		return "/board/boardList";
	}
	@GetMapping("boardOne.do")
	public String boardOne(Model model,BoardVo vo) {
		model.addAttribute("vo", bservice.boardOne(vo));
		return "/board/boardOne";
	}
	@PostMapping("login.do")
	public String login(HttpSession session, AccountVo vo) {
		AccountVo avo = service.login(vo);

		if (avo != null) {
			if (BCrypt.checkpw(vo.getAccount_pwd(), avo.getAccount_pwd())) {
				System.out.println("avo=" + avo);
				session.setAttribute("avo", avo);
				return "index";
			}
		}
		return "index";
	}

	@GetMapping("logout.do")
	String sessionLogout(HttpSession session, AccountVo vo) {
		session.invalidate();
		return "index";
	}

	

	@PostMapping("accountInsert.do")
	public String accountInsert(@Valid AccountVo avo, Errors errors, Model model) {
		// 유효성검사 https://victorydntmd.tistory.com/332?category=764331
		if (errors.hasErrors()) {
			// 회원가입 실패시, 입력 데이터를 유지
			model.addAttribute("userDto", avo);
			// 유효성 통과 못한 필드와 메시지를 핸들링
			Map<String, String> validatorResult = service.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			return "/member/accountForm";
		}

		String bpwd = BCrypt.hashpw(avo.getAccount_pwd(), BCrypt.gensalt());
		avo.setAccount_pwd(bpwd);
		service.accountInsert(avo);
		System.out.println("bpwd=" + bpwd);

		return "index";
	}

	@GetMapping("accountList.do")
	public String accountList(Model model) {
		model.addAttribute("li", service.accountList());
		return "/member/accountList";
	}

}
