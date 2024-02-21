package com.project.lol;


import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.project.lolvo.InfoVo;
import com.project.lolvo.MatchVo;
import com.project.lolvo.ParticipantVo;

@Configuration
@Service
public class RiotApiService {
	private final RestTemplate restTemplate;
	private final String api_key="RGAPI-fbc36348-503a-4789-99ab-0d31c51d9f69";
	public RiotApiService(RestTemplateBuilder restTemplateBuilder) {
		this.restTemplate = restTemplateBuilder.build();
	}

	public LolVo getSummonerInfo(String summonerName) {
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + summonerName
				+ "?api_key="+api_key;
		LolVo summoner = restTemplate.getForObject(url, LolVo.class);

//		System.out.println(url);
//		System.out.println(summoner);
//		if (summoner != null) {
//			System.out.println("Summoner ID: " + summoner.getId());
//			System.out.println("Summoner Name: " + summoner.getName());
//			System.out.println("Summoner Level: " + summoner.getSummonerLevel());
//			// 필요한 정보를 출력
//		} else {
//			System.out.println("Summoner 정보를 가져올 수 없습니다.");
//		}
		
		return summoner;
	}

	public String puuidIn(LolVo vo) {
		String puuid=vo.getPuuid();
		String url =
				"https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/"+puuid
				+"/ids?start=0&count=20&api_key="+api_key;

	 ResponseEntity<String> summoner = restTemplate.getForEntity(url, String.class);

//		if (summoner != null) {
//			System.out.println("Summoner ID: " + summoner.getBody());
//		} else {
//			System.out.println("Summoner 정보를 가져올 수 없습니다.");
//		}
		return summoner.getBody();
	}
	
	public MatchVo machid(LolVo vo) {
		String machid=vo.getMachid();
		String url =
				"https://asia.api.riotgames.com/lol/match/v5/matches/"+machid
				+"?api_key="+api_key;
		MatchVo mactvo =  restTemplate.getForObject(url, MatchVo.class);
		
//		ParticipantVo summoner =  restTemplate.getForObject(url, ParticipantVo.class);
//		InfoVo info =  restTemplate.getForObject(url, InfoVo.class);
//		System.out.println("info="+info);
		
//		System.out.println("mactvo="+mactvo);
//		if (mactvo != null) {
//			System.out.println("Summoner ID: " + mactvo);
//			// 필요한 정보를 출력
//		} else {
//			System.out.println("Summoner 정보를 가져올 수 없습니다.");
//		}
		return mactvo;
	}
	
	@Bean
	public RestTemplate restTemplate(RestTemplateBuilder builder) {
		return builder.build();
	}

//	@Bean
//	public CommandLineRunner run(RiotApiService riotApiService) {
//		return args -> {
//			// 여기에 라이엇 API로부터 정보를 가져오고 콘솔에 출력하는 코드를 넣습니다.
//			riotApiService.getSummonerInfo("닭모래집");
//		};
//	}

}
