package com.chainsys.creditcard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.chainsys.creditcard.model.CreditCardDetails;


public class ApprovalRecordsImpl implements ApprovalRecordsDAO {
	
	public  void approve(CreditCardDetails cardDetails) {
		String query="UPDATE credit_card_details SET credit_card_approval='Approved',credit_card_status='Active' WHERE customer_id=? ";
		
	}
	public  void reject(CreditCardDetails cardDetails)  {
		String query="UPDATE credit_card_details SET credit_card_approval='Rejected',credit_card_status='Not active' WHERE customer_id=? ";
		
		
		
		
	}
	

	private ApprovalRecordsImpl() {
		super();
	}
	
}
