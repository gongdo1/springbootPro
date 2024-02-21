package com.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.lol.LolVo;
import com.project.lol.RiotApiService;
import com.project.lolvo.InfoVo;
import com.project.lolvo.MatchVo;
import com.project.lolvo.MetadataVo;
import com.project.lolvo.ParticipantVo;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class LolController {

	@Autowired
	private RiotApiService service;

	@GetMapping("/test1")
	public @ResponseBody ResponseEntity<String> handleRequest() {

		System.out.println("test");
		System.out.println("test222");
		return null;

	}

	@GetMapping("/lol")
	public String test(LolVo vo, Model model) {

//		System.out.println("puuid="+vo.getPuuid());
//		LolVo tvo=service.getSummonerInfo(vo.getSummonerName());
//		
//		model.addAttribute("tvo",service.getSummonerInfo(vo.getSummonerName()));
//		System.out.println("tvo"+tvo);
		return "lol";
	}

	@GetMapping("/sertest")
	public String sertest(LolVo vo, Model model) throws JsonMappingException, JsonProcessingException {
		
		LolVo summoner = service.getSummonerInfo(vo.getSummonerName());
		String match = service.puuidIn(summoner);

		ObjectMapper objectMapper = new ObjectMapper();
		String[] matchids = objectMapper.readValue(match, String[].class);
		model.addAttribute("matchids", matchids);
		Arrays.stream(matchids).forEach(ids -> {
			vo.setMachid(ids);
		});
		
//		List<ParticipantVo> allParticipants=new ArrayList<ParticipantVo>();
//		InfoVo infoVo=new InfoVo();
//		for (String matchId : matchids) {
//			vo.setMachid(matchId);
//			MatchVo mvo = service.machid(vo);
//			infoVo = mvo.getInfo();
//			List<ParticipantVo> pvo = infoVo.getParticipants();
//			System.out.println("matchId=" + matchId);
//			allParticipants.addAll(pvo);
//			System.out.println("vo="+vo);
//		}
//		
//		model.addAttribute("participant", allParticipants);
		
		MatchVo mvo = service.machid(vo);
		InfoVo infoVo = mvo.getInfo();

		

		model.addAttribute("info", infoVo);
		model.addAttribute("lvo", service.puuidIn(summoner));
		model.addAttribute("summoner", service.getSummonerInfo(vo.getSummonerName()));

		return "lol";
	}

	@GetMapping("/machid")
	public String machList(LolVo vo, Model model, @RequestParam String[] machid) {

		MatchVo mvo = service.machid(vo);
//		MetadataVo metadata=mvo.getMetadata();
		InfoVo infoVo = mvo.getInfo();
		List<ParticipantVo> pvo = infoVo.getParticipants();
//		List<String> pvo=metadata.getParticipants();
//		System.out.println(pvo);
		model.addAttribute("participant", pvo);
		model.addAttribute("info", infoVo);
		model.addAttribute("summoner", service.getSummonerInfo(vo.getSummonerName()));
//		System.out.println("mvo="+mvo);
		return "lol";
	}

	@GetMapping("/machidJson")
	@ResponseBody
	public List<ParticipantVo> machidJson(LolVo vo) throws JsonMappingException, JsonProcessingException {
		LolVo summoner = service.getSummonerInfo(vo.getSummonerName());
		String match = service.puuidIn(summoner);
		System.out.println("lolvo="+vo);
//		System.out.println(summoner);
		ObjectMapper objectMapper = new ObjectMapper();
		String[] matchids = objectMapper.readValue(match, String[].class);
		MatchVo mvo = new MatchVo();
//		for (String matchId : matchids) {
//	        vo.setMachid(matchId);
//	        MatchVo mvo = service.machid(vo);
//	        InfoVo infoVo = mvo.getInfo();
//	        List<ParticipantVo> pvo = infoVo.getParticipants();
//	        allParticipants.addAll(pvo); 
//	    }
		List<ParticipantVo> allParticipants=new ArrayList<ParticipantVo>();
		for(int i=0; i < matchids.length; i++) {
			vo.setMachid(matchids[i]);
			mvo = service.machid(vo);
			InfoVo infoVo = mvo.getInfo();
			List<ParticipantVo> pvo = infoVo.getParticipants();
			allParticipants.addAll(pvo);

		}
		return allParticipants;

	}

}
