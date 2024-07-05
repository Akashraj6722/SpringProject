package com.chainsys.creditcard.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.mapper.IdMapper;
import com.chainsys.creditcard.mapper.LoginMapper;
import com.chainsys.creditcard.mapper.UserMapper;
import com.chainsys.creditcard.mapper.MailMapper;

import com.chainsys.creditcard.model.User;


@Repository

public class UserRecordsImpl implements UserRecordsDAO{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	

	public void insert(User user) {
		String query = "INSERT INTO user_details(first_name,last_name,dob,aadhaar_number,aadhaar_proof,pan_number,pan_proof,email_id,phone_number,password) VALUES(?,?,?,?,?,?,?,?,?,?)";

		Object[] parameter = { user.getfName(), user.getlName(), user.getDob(),
				user.getAadhaar(),user.getAadhaarProof(), user.getPan(),user.getPanProof(),user.getMail(),user.getPhone()
				,user.getPassword()};
		int rows = jdbcTemplate.update(query, parameter);

		System.out.println("inserting....");
	}

	public  boolean check(User user) {

		String query = "SELECT email_id,password FROM user_details WHERE email_id=? AND password=? ";
		

		
			User record = jdbcTemplate.queryForObject(query, new LoginMapper(), user.getMail(),
            user.getPassword());
			System.out.println("checking....");
//			return record != null;
		 
			return true;
		

	}

	public Integer readId(User user) {


		String query = "SELECT id FROM user_details WHERE email_id=?  ";
		System.out.println("reading....");

		return jdbcTemplate.queryForObject(query, new IdMapper(),user.getMail()	);


	}
	public List<User> read(String mail) {

		String command = "SELECT id,first_name,last_name,dob,aadhaar_number,pan_number, email_id,phone_number FROM user_details WHERE email_id=?";
		
		System.out.println("in read details"+mail);


		List<User> list = jdbcTemplate.query(command, new UserMapper() , mail);
       
		System.out.println("reading details...");
		return  list;

	}

//	public void readSpecific(UserDetails userDetails) {
//
//		String query = "SELECT id,first_name,last_name,dob,aadhaar_number,pan_number,phone_number FROM user_details WHERE email_id=? AND password=? ";
//
//		
//	}

	public  String readMail(int id)  {

//		String mail = "";
		
		String query = "SELECT email_id FROM user_details WHERE id=? ";
		
		return jdbcTemplate.queryForObject(query, new MailMapper(), id);

	}

	public UserRecordsImpl() {
		super();
	}

}
