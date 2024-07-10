package com.chainsys.creditcard.dao;


import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.CreditCard;
import com.chainsys.creditcard.model.Transactions;

@Repository

public class TransactionRecordsImpl implements TransactionRecordsDAO  {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void insert(Transactions transactions) {
		String query = "INSERT INTO transactions VALUES(?,?,?,?,?,?) ";
		
		Object[] parameters= {transactions.getId(),
				transactions.getCardNumber(),transactions.getTranscationId(),
				transactions.getDateTime(),transactions.getAmount(),transactions.getDescription()};
				
		jdbcTemplate.update(query, parameters);

	}

	public List<Transactions> read(Transactions transactions) {


		String query = "SELECT card_number,transaction_id,date_time,amount,description FROM transactions WHERE card_number=? AND id=? ";
		
		List<Transactions> list = jdbcTemplate.query(query, 
				(rs,rowNum)->new Transactions(rs.getString("card_number"),
						rs.getString("transaction_id"),rs.getString("date_time"),rs.getInt("amount"),
						rs.getString("description")), 
				transactions.getCardNumber(),transactions.getId());
		return list;

	}
}
