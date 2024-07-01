package com.chainsys.creditcard.dao;

import java.util.List;


import com.chainsys.creditcard.model.UserDetails;




public interface UserRecordsDAO {
	
	public void insert(UserDetails details);
	
	public  boolean check(UserDetails details);
	
	public Integer readId(UserDetails details);
	
	public void readSpecific(UserDetails details);
	
	public  String readMail(int id) ;

}
