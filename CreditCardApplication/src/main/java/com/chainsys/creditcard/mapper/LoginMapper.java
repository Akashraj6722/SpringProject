package com.chainsys.creditcard.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.creditcard.model.UserDetails;

public class LoginMapper implements RowMapper<UserDetails>{

	@Override
	public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {

		UserDetails userDetails=new UserDetails();

		userDetails.setMail(rs.getString("email_id"));
		userDetails.setPassword(rs.getString("password"));

		
		return userDetails;
	}

}
