package com.project.lolvo;

import java.util.List;

import lombok.Data;

@Data
public class TeamVo {
	private List<BanVo> bans;
	private ObjectivesVo objectives;
	private int teamId;
	private boolean win;
}
