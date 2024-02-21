package com.project.lolvo;

import java.util.List;

import lombok.Data;

@Data
public class PerksVo {
	private PerkStatsVo statPerks;
	private List<PerkStyleVo> styles;
}
