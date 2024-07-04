package com.chainsys.creditcard.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.CreditCard;

@Repository
public interface ApprovalRecordsDAO {
	
	
	public  void approve(CreditCard CreditCard);
	
	public  void reject(CreditCard CreditCard) ;
	
	

}
