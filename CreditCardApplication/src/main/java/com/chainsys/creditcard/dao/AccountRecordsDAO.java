package com.chainsys.creditcard.dao;

import java.util.List;



import com.chainsys.creditcard.model.Account;
import com.chainsys.creditcard.model.User;



public interface AccountRecordsDAO {
	
	public void insert(User user, Account account);
	
	public  List<Account> read( Account account,int id);
	public List<Account> readProfile();
	
	public  void insertCibil(User user, Account account);
	
	public Integer readCibil(User user,Account account) ;
	
	public  boolean checkCibil(User user, Account account);

}
