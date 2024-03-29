package com.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.account.AccountServiceImpl;
import com.project.account.AccountVo;
import com.project.account.BCrypt;
import com.project.board.BoardServiceImpl;
import com.project.board.BoardVo;
import com.project.mall.MallService;
import com.project.mall.MallVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MemberController {

	@Autowired
	private AccountServiceImpl service;
	@Autowired
	private BoardServiceImpl bservice;
	@Autowired
	private MallService mservice;
	@Autowired
	private HttpSession session;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/accountForm")
	public String accountForm() {
		return "/member/accountForm";
	}
	@GetMapping("/boardForm")
	public String boardForm() {
		return "/board/boardForm";
	}
	
	@GetMapping("/indexBoardList")
	@ResponseBody
	public List<BoardVo> indexBoardList() {
		List<BoardVo> bli=bservice.indexBoardlist();
		return bli;
	}
	
	
	@ResponseBody
	@GetMapping("/fotoramaList")
	public List<MallVo> fotoramaList() {
		List<MallVo> mli=mservice.fotoramalist();
		return mli;
	}
	
	@GetMapping("/boardList")
	public String boardList(Model model, BoardVo vo, HttpServletRequest req) {
		
		
		int pageno=1; // 페이지 번호
		int pagePerRow=10;
		if(req.getParameter("page") != null) {
			pageno=Integer.parseInt(req.getParameter("page")); // 넘겨온 페이지 번호
			System.out.println("pageno="+pageno);
		}
		int total=bservice.totalCount(vo); // 전체 페이지
//		System.out.println(total);
		int totalPage=total/pagePerRow;
		if(total%pagePerRow > 0) { // 남은 글이 있다면.. 페이지 1증가 시켜서 페이징수를 보정
			totalPage++; // 총 페이지수: 9
		}
		
		int block=10;
		int startPage=((pageno-1)/block)*block+1;
		int endPage=startPage+block-1;
		
		int startRow=(pageno-1)*pagePerRow+1;
		int endRow=startRow+pagePerRow-1;
		if(endPage>totalPage) {
			endPage=totalPage;
		}

		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		
//		System.out.println(vo);
		model.addAttribute("ch1", vo.getCh1());
		model.addAttribute("ch2", vo.getCh2());
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageno", pageno);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("board", bservice.boardList(vo));
		return "/board/boardList";
	}
	@GetMapping("/boardOne")
	public String boardOne(Model model,BoardVo vo) {
		bservice.views(vo);
		model.addAttribute("vo", bservice.boardOne(vo));
		return "/board/boardOne";
	}
	
	@GetMapping("boardModify.do")
	public String boardModify(Model model,BoardVo vo) {
		model.addAttribute("vo", bservice.boardOne(vo));
		return "/board/boardModify";
	}
	
	@PostMapping("boardModifyInsert.do")
	public String boardModifyInsert(BoardVo vo) {
		bservice.boardModify(vo);
		return "redirect:boardList";
	}
	
	@PostMapping("/boardInsert")
	public String boardInsert(BoardVo vo,HttpServletRequest req) {
//		String btitle=req.getParameter("btitle");
//		for(int i=1; i <= 5; i++) {
//			vo.setBtitle(btitle+""+i);
//			vo.setBcontent(""+i);
//			
//		}
		bservice.boardInsert(vo);

		return "redirect:boardList";
	}
	
	@GetMapping("/boardDelete")
	public String boardDelete(BoardVo vo) {
		bservice.boardDelete(vo);
		return "redirect:boardList";
	}
	
	
	@PostMapping("login.do")
	public String login(AccountVo vo) {
		AccountVo avo = service.login(vo);
		if (avo != null) {
			if (BCrypt.checkpw(vo.getAccount_pwd(), avo.getAccount_pwd())) {
//				System.out.println("avo=" + avo);
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
