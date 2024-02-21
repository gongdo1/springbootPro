package com.project.mall;

import lombok.Data;

@Data
public class MallOrderVo {
	private int orderidx;
	private int cartidx;
	private int mallId;
	private String mallName;
	private String account_id;
	private String user_name;
	private String user_phone;
	private int mallPrice;
	private int amount;
	private String payment;
	private String malladdr;
	private String memo;
	private String orderDate;
	
}
