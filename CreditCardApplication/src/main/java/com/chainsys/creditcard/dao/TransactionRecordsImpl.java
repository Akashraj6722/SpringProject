package com.chainsys.creditcard.dao;


import java.util.ArrayList;
import java.util.List;

import com.chainsys.creditcard.model.Transactions;

public class TransactionRecordsImpl implements TransactionRecordsDAO  {
	Transactions trans = new Transactions();

	public void insert(Transactions transactions) {
		String query = "INSERT INTO transactions VALUES(?,?,?,?,?,?) ";

	}

	public List<Transactions> read(Transactions transactions) {

		ArrayList<Transactions> list = new ArrayList<>();

		String query = "SELECT card_number,transaction_id,date_time,amount,description FROM transactions WHERE card_number=? ";
		return list;

	}
}
