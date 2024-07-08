package com.chainsys.creditcard.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.creditcard.model.CreditCard;

public class CardMapper implements RowMapper<CreditCard>{

	@Override
	public CreditCard mapRow(ResultSet rs, int rowNum) throws SQLException {

		
		
		return null;
	}
	
	
	
	

}
