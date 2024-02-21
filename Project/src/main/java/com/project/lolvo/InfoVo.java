package com.project.lolvo;

import java.util.List;

import lombok.Data;

@Data
public class InfoVo {
	private long gameCreation;
	private long gameDuration;
	private long gameEndTimestamp;
	private long gameId;
	private String gameMode;
	private String gameName;
	private long gameStartTimestamp;
	private String gameType;
	private String gameVersion;
	private int mapId;
	private List<ParticipantVo> participants;
	private String platformId	;
	private int queueId;
	private List<TeamVo> teams;
	private String tournamentCode;
}
