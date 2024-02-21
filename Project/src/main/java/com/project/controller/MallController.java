package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.mall.MallAddrVo;
import com.project.mall.MallOrderVo;
import com.project.mall.MallService;
import com.project.mall.MallVo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MallController {

	@Autowired
	private MallService service;
	
	@GetMapping("/mallList")
	public String mallList(Model model) {
		model.addAttribute("mvo", service.mallList());
		return "/mall/mallList";
	}

	@GetMapping("/mallOne")
	public String mallOne(Model model, MallVo vo) {
		model.addAttribute("mOne",service.mallOne(vo));
		return "/mall/mallOne";
	}
	
	@GetMapping("/mallForm")
	public String 	mallForm(Model model) {
		model.addAttribute("mallId",service.mallId());
		return "/mall/mallForm";
	}
	
	@GetMapping("/mallDelete")
	public String 	mallDelete(MallVo vo) {
		service.mallDelete(vo);
		return "redirect:mallList";
	}
	
	@PostMapping("/mallInsert")
	public String 	mallInsert(MallVo vo,HttpServletRequest req) throws IllegalStateException, IOException {
		Random ran = new Random();
		String rani =  "_"+(ran.nextInt(99999) + 10001);
		String realPath = req.getSession().getServletContext().getRealPath("/img/");
		MultipartFile file = vo.getMallFile();
		String fileName = file.getOriginalFilename();

		File f = new File(realPath + fileName);
		if(!file.isEmpty()) {
			if (f.exists()) {
				String fname=fileName.substring(0,fileName.lastIndexOf("."));
				String lname=fileName.substring(fileName.lastIndexOf("."));
				fileName=fname+"_"+rani+lname;
			} 
			file.transferTo(new File(realPath + fileName));
		} else {
			fileName="main.png";
		}
	
		vo.setMallImg(fileName);

		System.out.println("realPath=" + realPath);
		System.out.println("file=" + file);
		System.out.println("fileName=" + fileName);
		
		service.mallInsert(vo);
//		System.out.println("vo=" + vo);
		return "redirect:mallList";
	}
	
	@GetMapping("/orderForm")
	public String orderForm(Model model, MallVo vo,MallAddrVo mvo) {
		model.addAttribute("mOne",service.mallOne(vo));
//		System.out.println(vo);
//		System.out.println(mvo);
		model.addAttribute("addr",service.mallAddrUserList(mvo));
		model.addAttribute("addrone",service.mallAddrUserone(mvo));
		
		return "/mall/orderForm";
	}
	
	@PostMapping("/orderInsert")
	public String orderInsert(MallOrderVo vo) {
		System.out.println("orderTest="+vo);
		return "redirect:mallList";
	}
	
	@GetMapping("/mallAddrInsert")
	public String mallAddr(Model model, MallAddrVo vo, MallVo mvo,HttpServletRequest req) {
		String sample6_postcode = req.getParameter("sample6_postcode");
		String sample6_address = req.getParameter("sample6_address");
		String sample6_detailAddress = req.getParameter("sample6_detailAddress");
		String sample6_extraAddress = req.getParameter("sample6_extraAddress");
		
		String user_addr = sample6_postcode + " " + sample6_address + " " + sample6_detailAddress+" "+sample6_extraAddress; //주소
		System.out.println(user_addr);
		vo.setUseraddr(user_addr);
		
		int count = service.firstaddrCount(vo);
		
//		System.out.println("Test="+vo);
		if(count >= 1) {
			service.mallAddrUserInsert(vo);
			vo.setMalladdr(vo.getUseraddr());
			service.mallAddrPick(vo);
//			System.out.println("1테스트");
		} else if(count == 0) {
			service.mallAddrUserInsert(vo);
			vo.setMalladdr(vo.getUseraddr());
			service.firstAddrInsert(vo);
//			System.out.println("0테스트");
		}
		
		
		model.addAttribute("mOne", service.mallOne(mvo));
		return "/mall/orderForm";
	}
	
	@GetMapping("/addrPick")
	public String  addrPick(Model model, MallAddrVo vo, MallVo mvo) {
//		System.out.println("Vo="+vo);
		vo.setMalladdr(vo.getUseraddr());
		service.mallAddrPick(vo);

		model.addAttribute("mOne", service.mallOne(mvo));
		return "/mall/orderForm";

	}
	
	@GetMapping("/addrListJson")
	@ResponseBody
	public List<MallAddrVo> addrListJson(MallAddrVo mvo) {
		List<MallAddrVo> vo=service.mallAddrUserList(mvo);
		return vo;
	}
	
	@GetMapping("/addrPickJson")
	@ResponseBody
	public MallAddrVo addrPickJson(MallAddrVo mvo, MallVo vo,HttpServletRequest req) {
		MallAddrVo mavo=service.mallAddrUserone(mvo);
		return mavo;

	}
	
}
