package com.chainsys.creditcard.dao;

import java.util.List;



import com.chainsys.creditcard.model.AccountDetails;
import com.chainsys.creditcard.model.UserDetails;



public interface AccountRecordsDAO {
	
	public void insert(UserDetails details, AccountDetails bankDetails);
	
	public  List<AccountDetails> read(UserDetails details, AccountDetails bankDetails);
	
	public  void insertCibil(UserDetails details, AccountDetails bankDetails);
	
	public  boolean check(UserDetails details, AccountDetails bankDetails);

}
