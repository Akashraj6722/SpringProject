package com.chainsys.creditcard.dao;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.creditcard.mapper.CreditCardMapper;

import com.chainsys.creditcard.model.Account;
import com.chainsys.creditcard.model.CreditCard;
import com.chainsys.creditcard.model.User;
import com.chainsys.creditcard.model.Transactions;


@Repository

public class CardRecordsImpl implements CardRecordsDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
public  void insert(CreditCard creditCard, User user ,Account account)  {
		
		
		String query="INSERT INTO credit_card_details(customer_id,account_number,credit_card_number,credit_card_type,credit_card_cvv,credit_card_issue_date,credit_card_valid_till) "
				+ "VALUES(?,?,?,?,?,?,?)";
		
		jdbcTemplate.update(query, user.getCustomerID(),account.getAccountNumber(),creditCard.getCardNumber(),creditCard.getCardType(),creditCard.getCvvNumber(),creditCard.getCardAppliedDate(),creditCard.getValidity());
	
		
}

  public  void update(CreditCard CreditCard,User user)  {
		
		String query="UPDATE credit_card_details SET credit_card_pin=? WHERE customer_id=? AND credit_card_number=?";
		
  }
  
  public  List<CreditCard> read()  {
		
      new ArrayList<>();

		String query = "SELECT customer_id,account_number,credit_card_number,credit_card_type,credit_card_issue_date,credit_card_status,credit_card_approval FROM credit_card_details";
		 List<CreditCard> list =jdbcTemplate.query(query, new CreditCardMapper());
		
		return list;

  }
  
  public  boolean check(String cardNumber) {
	  
		String query = "SELECT credit_card_number FROM credit_card_details WHERE credit_card_number=? AND credit_card_approval='Approved' ";
		
		jdbcTemplate.query(query, new CreditCardMapper(), cardNumber);
		
		return false;
		
  }

 public  boolean checkPayment(Transactions transactions,int cvv)  {
	  
		String query = "SELECT credit_card_number,credit_card_cvv,credit_card_approval FROM credit_card_details WHERE credit_card_number=? AND credit_card_cvv=? AND credit_card_approval='Approved' ";
		return false;
	
  }
 
 public  List<CreditCard> display(CreditCard creditCard) {
		
		ArrayList<CreditCard> list=new ArrayList<CreditCard>();
		creditCard.getHolderName();
		creditCard.getCardNumber();
		creditCard.getCvvNumber();
		creditCard.getCardAppliedDate();
		creditCard.getValidity();
		
		
		list.add(creditCard);
		return list;
		
		
		
	}
  
 public CardRecordsImpl() {
	super();
}

@Override

}
  
}
