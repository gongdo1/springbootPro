package com.project.mall;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MallVo {
	private int mallId;
	private String mallName;
	private String mallPrice;
	private String mallDesc;
	private String mallImg;
	private MultipartFile mallFile;
	private String account_id;
	private String mallDate;
	
	
	
}
