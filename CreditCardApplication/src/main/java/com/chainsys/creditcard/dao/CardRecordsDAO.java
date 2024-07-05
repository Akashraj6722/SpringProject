package com.chainsys.creditcard.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.Account;
import com.chainsys.creditcard.model.CreditCard;
import com.chainsys.creditcard.model.User;
import com.chainsys.creditcard.model.Transactions;


public interface CardRecordsDAO {

	public void insert(CreditCard CreditCard, User user, Account account);

	public void update(CreditCard CreditCard, User user);

	public List<CreditCard> read();

	public boolean check(CreditCard CreditCard);

	public boolean checkPayment(Transactions transactions, int cvv);
	
	public  List<CreditCard> display(CreditCard CreditCard);

}
