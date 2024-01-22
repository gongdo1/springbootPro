package com.project.account;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class AccountVo {
	
	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	private String account_id;
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	private String account_pwd;
	@NotBlank(message = "이메일은 필수 입력 값입니다.")
	private String user_email;
	@NotBlank(message = "이름은 필수 입력 값입니다.")
	private String user_name;
	@NotBlank(message = "생년월일은 필수 입력 값입니다.")
	private String user_birth;
	@NotBlank(message = "성별을 선택해주세요.")
	private String user_gender;
	@NotBlank(message = "핸드폰번호는 필수 입력 값입니다.")
	private String user_phone;
	private MultipartFile account_file; // 사진파일등록
	private String user_img;
	private String user_date;
	private String admin;
}
