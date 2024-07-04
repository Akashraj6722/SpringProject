package com.chainsys.creditcard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chainsys.creditcard.model.Account;
import com.chainsys.creditcard.model.CreditCard;
import com.chainsys.creditcard.model.User;
import com.chainsys.creditcard.model.Transactions;




public class CardRecordsImpl implements CardRecordsDAO {
	
	
public  void insert(CreditCard CreditCard, User user ,Account account)  {
		
		
		String query="INSERT INTO credit_card_details(customer_id,account_number,credit_card_number,credit_card_type,credit_card_cvv,credit_card_issue_date,credit_card_valid_till) VALUES(?,?,?,?,?,?,?)";
		
}

  public  void update(CreditCard CreditCard,User user)  {
		
		String query="UPDATE credit_card_details SET credit_card_pin=? WHERE customer_id=? AND credit_card_number=?";
		
  }
  
  public  List<CreditCard> read()  {
		
      ArrayList<CreditCard> list = new ArrayList<>();

		String query = "SELECT customer_id,account_number,credit_card_number,credit_card_type,credit_card_cvv,credit_card_pin,credit_card_issue_date,credit_card_valid_till,credit_card_status,credit_card_approval FROM credit_card_details ";
		return list;

  }
  
  public  boolean check(CreditCard CreditCard) {
	  
		String query = "SELECT credit_card_number FROM credit_card_details WHERE credit_card_number=? AND credit_card_approval='Approved' ";
		return false;
		
  }

 public  boolean checkPayment(Transactions transactions,int cvv)  {
	  
		String query = "SELECT credit_card_number,credit_card_cvv,credit_card_approval FROM credit_card_details WHERE credit_card_number=? AND credit_card_cvv=? AND credit_card_approval='Approved' ";
		return false;
	
  }
 
 public  List<CreditCard> display(CreditCard CreditCard) {
		
		ArrayList<CreditCard> list=new ArrayList<CreditCard>();
		CreditCard.getHolderName();
		CreditCard.getCardNumber();
		CreditCard.getCvvNumber();
		CreditCard.getCardAppliedDate();
		CreditCard.getValidity();
		
		
		list.add(CreditCard);
		return list;
		
		
		
	}
  
private CardRecordsImpl() {
	super();
}
  
}
