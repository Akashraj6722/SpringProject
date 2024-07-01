package com.chainsys.creditcard.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.CreditCardDetails;

@Repository
public interface ApprovalRecordsDAO {
	
	
	public  void approve(CreditCardDetails card);
	
	public  void reject(CreditCardDetails card) ;
	
	

}
