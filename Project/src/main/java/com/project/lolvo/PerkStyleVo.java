package com.project.lolvo;

import java.util.List;

import lombok.Data;

@Data
public class PerkStyleVo {
	private String description;
	private List<PerkStyleSelectionVo> selections;
	private int style;
}
