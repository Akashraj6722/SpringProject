package com.chainsys.creditcard.dao;


import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.User;
import com.chainsys.creditcard.model.CreditCard;
import com.chainsys.creditcard.model.Employment;
import com.chainsys.creditcard.mapper.IncomeProofMapper;



@Repository
public class EmploymentRecordsImpl implements EmploymentRecordsDAO  {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	public void insert(Employment employment, User user) {

		String query = "INSERT INTO employment_details(id_number,customer_occupation,customer_company_name,customer_designation,customer_annual_income,income_proof)"
				+ "  VALUES(?,?,?,?,?,?)";
		Object[] parameter= {user.getCustomerID(),employment.getOccupation(),employment.getCompanyname(),employment.getDesignation()
				,employment.getIncome(),employment.getIncomeProof()};		
        jdbcTemplate.update(query, parameter);
        
	}

	public  List<Employment> read(CreditCard creditCard) {

		String query="SELECT income_proof FROM employment_details WHERE id_number=?";
		
		System.out.println("reading bytes"+ creditCard.getId());
		
		List<Employment> list=(List<Employment>)jdbcTemplate.query(query, new IncomeProofMapper(), creditCard.getId());
		
		return list;
		
		

	}

public EmploymentRecordsImpl() {
		super();
	}



}
