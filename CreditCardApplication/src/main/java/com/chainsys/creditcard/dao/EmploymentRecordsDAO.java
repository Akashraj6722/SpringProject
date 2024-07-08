package com.chainsys.creditcard.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.User;
import com.chainsys.creditcard.model.CreditCard;
import com.chainsys.creditcard.model.Employment;



public interface EmploymentRecordsDAO {
	
	public void insert(Employment employment, User user);
	
	public   byte[] read(CreditCard creditCard);

}
