package com.chainsys.creditcard.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.creditcard.mapper.AccountMapper;


import com.chainsys.creditcard.model.Account;
import com.chainsys.creditcard.model.User;

@Repository
public class AccountRecordsImpl implements AccountRecordsDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public void insert(User user, Account account) {
		String query = "INSERT INTO account_details(customer_id,account_number,ifsc_code)VALUES(?,?,?)";

		Object[] parameter = { user.getCustomerID(), account.getAccountNumber(),
				account.getIfsc() };
         
		int records = jdbcTemplate.update(query, parameter);

	}

	public List<Account> read(Account account,int id) {
		
		String query="SELECT account_type,account_number,ifsc_code,account_balance FROM account_details WHERE customer_id=?";
		
		List<Account> list =  jdbcTemplate.query(query, new AccountMapper(),id);
          System.out.println("Completed account read method");
		return list;

	}

	public void insertCibil(User user, Account account) {

	}

	public boolean check(User user, Account account) {

		return false;
	}

	public AccountRecordsImpl() {
		super();
	}
}