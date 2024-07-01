package com.chainsys.creditcard.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.AccountDetails;
import com.chainsys.creditcard.model.CreditCardDetails;
import com.chainsys.creditcard.model.UserDetails;
import com.chainsys.creditcard.model.Transactions;

@Repository
public interface CardRecordsDAO {

	public void insert(CreditCardDetails card, UserDetails details, AccountDetails bankDetails);

	public void update(CreditCardDetails card, UserDetails details);

	public List<CreditCardDetails> read();

	public boolean check(CreditCardDetails card);

	public boolean checkPayment(Transactions trans, int cvv);
	
	public  List<CreditCardDetails> display(CreditCardDetails card);

}
