package com.project.board;

import lombok.Data;

@Data
public class BoardVo {
	private int bno;
	private String btitle;
	private String account_id;
	private String bwrittendate;
	private String bcontent;
	private String bimgFile;
	private int breadcnt;
	private int blike;
	private int bref;
	private int bstep;
	private int breforder;
	
	private String ch1;
	private String ch2;
	private int pageno;
	private int pagePerRow;
	private int startRow;
	private int endRow;
}
