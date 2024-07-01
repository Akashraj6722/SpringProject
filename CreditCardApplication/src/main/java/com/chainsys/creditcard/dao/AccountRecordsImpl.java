package com.chainsys.creditcard.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.AccountDetails;
import com.chainsys.creditcard.model.UserDetails;

@Repository
public class AccountRecordsImpl implements AccountRecordsDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public void insert(UserDetails userDetails, AccountDetails accountDetails) {
		String query = "INSERT INTO account_details(customer_id,account_number,ifsc_code)VALUES(?,?,?)";

		Object[] parameter = { userDetails.getCustomerID(), accountDetails.getAccountNumber(),
				accountDetails.getIfsc() };
         
		int records = jdbcTemplate.update(query, parameter);

	}

	public List<AccountDetails> read(UserDetails userDetails, AccountDetails accountDetails) {
		ArrayList<AccountDetails> list = new ArrayList<>();

		return list;

	}

	public void insertCibil(UserDetails userDetails, AccountDetails accountDetails) {

	}

	public boolean check(UserDetails userDetails, AccountDetails accountDetails) {

		return false;
	}

	public AccountRecordsImpl() {
		super();
	}
}