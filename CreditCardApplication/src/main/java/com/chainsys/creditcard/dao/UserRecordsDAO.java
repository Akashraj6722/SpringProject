package com.chainsys.creditcard.dao;

import java.util.List;


import com.chainsys.creditcard.model.User;




public interface UserRecordsDAO {
	
	public void insert(User user);
	
	public  boolean check(User user);
	
	public List<User> read(String mail);
	
	public Integer readId(User user);
	
//	public void readSpecific(UserDetails details);
	
	public  String readMail(int id) ;

}
