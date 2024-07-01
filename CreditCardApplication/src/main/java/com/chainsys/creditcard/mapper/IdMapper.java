package com.chainsys.creditcard.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.creditcard.model.UserDetails;

public class IdMapper implements RowMapper<Integer> {

	@Override
	public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		UserDetails userDetails=new UserDetails();
		
		int id=Integer.parseInt(rs.getString("id"));
		
//		userDetails.setCustomerID(id);
//		System.out.println("in ID mapper"+userDetails.getCustomerID());
		return id;
	}

}
