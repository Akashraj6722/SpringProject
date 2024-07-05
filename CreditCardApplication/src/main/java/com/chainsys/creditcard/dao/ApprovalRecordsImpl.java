package com.chainsys.creditcard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.CreditCard;

@Repository

public class ApprovalRecordsImpl implements ApprovalRecordsDAO {
	
	public  void approve(CreditCard CreditCard) {
		String query="UPDATE credit_card_details SET credit_card_approval='Approved',credit_card_status='Active' WHERE customer_id=? ";
		
	}
	public  void reject(CreditCard CreditCard)  {
		String query="UPDATE credit_card_details SET credit_card_approval='Rejected',credit_card_status='Not active' WHERE customer_id=? ";
		
		
		
		
	}
	

	public ApprovalRecordsImpl() {
		super();
	}
	
}
