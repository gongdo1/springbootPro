package com.project.account;

import java.util.List;

public interface AccountService {

	public void accountInsert(AccountVo vo);
	public List<AccountVo> accountList();
	public AccountVo login(AccountVo vo);
	
}
