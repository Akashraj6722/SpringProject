package com.chainsys.creditcard.dao;


public interface NumberGenerationDAO {
	
	public String accountNumber();
	
	public String ifsc();
	
	public  int ccvNumber();
	
	public  String visaCreditCardNumber();
	
	public  String masterCreditCardNumber();
	
	public  String rupayCreditCardNumber();
	
	public  String pulseCreditCardNumber() ;

}
