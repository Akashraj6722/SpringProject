package com.chainsys.creditcard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chainsys.creditcard.model.AccountDetails;
import com.chainsys.creditcard.model.CreditCardDetails;
import com.chainsys.creditcard.model.UserDetails;
import com.chainsys.creditcard.model.Transactions;




public class CardRecordsImpl implements CardRecordsDAO {
	
	
public  void insert(CreditCardDetails cardDetails, UserDetails userDetails ,AccountDetails accountDetails)  {
		
		
		String query="INSERT INTO credit_card_details(customer_id,account_number,credit_card_number,credit_card_type,credit_card_cvv,credit_card_issue_date,credit_card_valid_till) VALUES(?,?,?,?,?,?,?)";
		
}

  public  void update(CreditCardDetails cardDetails,UserDetails userDetails)  {
		
		String query="UPDATE credit_card_details SET credit_card_pin=? WHERE customer_id=? AND credit_card_number=?";
		
  }
  
  public  List<CreditCardDetails> read()  {
		
      ArrayList<CreditCardDetails> list = new ArrayList<>();

		String query = "SELECT customer_id,account_number,credit_card_number,credit_card_type,credit_card_cvv,credit_card_pin,credit_card_issue_date,credit_card_valid_till,credit_card_status,credit_card_approval FROM credit_card_details ";
		return list;

  }
  
  public  boolean check(CreditCardDetails cardDetails) {
	  
		String query = "SELECT credit_card_number FROM credit_card_details WHERE credit_card_number=? AND credit_card_approval='Approved' ";
		return false;
		
  }

 public  boolean checkPayment(Transactions transactions,int cvv)  {
	  
		String query = "SELECT credit_card_number,credit_card_cvv,credit_card_approval FROM credit_card_details WHERE credit_card_number=? AND credit_card_cvv=? AND credit_card_approval='Approved' ";
		return false;
	
  }
 
 public  List<CreditCardDetails> display(CreditCardDetails cardDetails) {
		
		ArrayList<CreditCardDetails> list=new ArrayList<CreditCardDetails>();
		cardDetails.getHolderName();
		cardDetails.getCardNumber();
		cardDetails.getCvvNumber();
		cardDetails.getCardAppliedDate();
		cardDetails.getValidity();
		
		
		list.add(cardDetails);
		return list;
		
		
		
	}
  
private CardRecordsImpl() {
	super();
}
  
}
