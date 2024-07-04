package com.chainsys.creditcard.dao;


import java.util.ArrayList;
import java.util.List;

import com.chainsys.creditcard.model.User;
import com.chainsys.creditcard.model.Employment;

public class EmploymentRecordsImpl implements EmploymentRecordsDAO  {

	public void insert(Employment employment, User user) {

		String query = "INSERT INTO employment_details(id_number,customer_occupation,customer_company_name,customer_designation,customer_annual_income,income_proof)  VALUES(?,?,?,?,?,?)";

	}

	public  List<byte[]> read() {

		ArrayList<byte[]> list = new ArrayList<byte[]>();
		byte[] incomeProof = null;
		return list;

	}

	private EmploymentRecordsImpl() {
		super();
	}

}
