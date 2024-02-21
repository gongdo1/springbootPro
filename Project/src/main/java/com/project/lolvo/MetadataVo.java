package com.project.lolvo;

import java.util.List;

import lombok.Data;

@Data
public class MetadataVo {
	private String dataVersion;
	private String matchId;
	private List<String> participants;
}
