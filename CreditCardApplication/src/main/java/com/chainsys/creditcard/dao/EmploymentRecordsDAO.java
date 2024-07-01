package com.chainsys.creditcard.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.creditcard.model.UserDetails;
import com.chainsys.creditcard.model.EmploymentDetails;


@Repository
public interface EmploymentRecordsDAO {
	
	public void insert(EmploymentDetails employment, UserDetails details);
	
	public  List<byte[]> read();

}
