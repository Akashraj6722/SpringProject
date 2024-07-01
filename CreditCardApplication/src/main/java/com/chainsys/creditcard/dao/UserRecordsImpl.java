package com.chainsys.creditcard.dao;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.mapper.IdMapper;
import com.chainsys.creditcard.mapper.LoginMapper;
import com.chainsys.creditcard.mapper.UserMapper;
import com.chainsys.creditcard.model.UserDetails;


@Repository

public class UserRecordsImpl implements UserRecordsDAO{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	UserMapper userMapper;
	IdMapper idMapper;

	public void insert(UserDetails userDetails) {
		String query = "INSERT INTO user_details(first_name,last_name,dob,aadhaar_number,pan_number,email_id,phone_number,password) VALUES(?,?,?,?,?,?,?,?)";

		Object[] parameter = { userDetails.getfName(), userDetails.getlName(), userDetails.getDob(),
				userDetails.getAadhaar(), userDetails.getPan(),userDetails.getMail(),userDetails.getPhone()
				,userDetails.getPassword()};
		int rows = jdbcTemplate.update(query, parameter);

		System.out.println("inserting....");
	}

	public  boolean check(UserDetails userDetails) {

		String query = "SELECT email_id,password FROM user_details WHERE email_id=? AND password=? ";
		

		
			UserDetails record = jdbcTemplate.queryForObject(query, new LoginMapper(), userDetails.getMail(),
					userDetails.getPassword());
			System.out.println("checking....");
//			return record != null;
		 
			return true;
		

	}

	public Integer readId(UserDetails userDetails) {


		String query = "SELECT id FROM user_details WHERE email_id=? AND password=? ";
		System.out.println("reading....");

		return jdbcTemplate.queryForObject(query, new IdMapper(),userDetails.getMail(),userDetails.getPassword());


	}

	public void readSpecific(UserDetails userDetails) {

		String query = "SELECT id,first_name,last_name,dob,aadhaar_number,pan_number,phone_number FROM user_details WHERE email_id=? AND password=? ";

		
	}

	public  String readMail(int id)  {

		String mail = "";
		
		String query = "SELECT email_id FROM user_details WHERE id=? ";
		return query;

	}

	public UserRecordsImpl() {
		super();
	}

}
