package com.chainsys.creditcard.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.creditcard.model.UserDetails;

public class UserMapper implements RowMapper<UserDetails> {

	@Override
	public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		UserDetails userDetails=new UserDetails();
		
		userDetails.setfName(rs.getString("first_name"));
		userDetails.setlName(rs.getString("last_name"));
		userDetails.setDob(rs.getString("dob"));
		userDetails.setAadhaar(rs.getString("aadhaar_number"));
		userDetails.setPan(rs.getString("pan_number"));
		userDetails.setMail(rs.getString("email_id"));
		userDetails.setPhone(rs.getString("phone_number"));
		userDetails.setPassword(rs.getString("password"));

		
		

		
		return userDetails;
	}
	

}
