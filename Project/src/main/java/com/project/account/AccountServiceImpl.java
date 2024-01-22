package com.project.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	private AccountDao dao;

	 // 회원가입 시, 유효성 체크
    public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
    }
	
	@Override
	public void accountInsert(AccountVo vo) {
		dao.accountInsert(vo);
	}

	@Override
	public List<AccountVo> accountList() {
		return dao.accountList();
	}

	@Override
	public AccountVo login(AccountVo vo) {
		return dao.login(vo);
	}
	
	
}
