package com.chainsys.creditcard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.creditcard.dao.AccountRecordsDAO;
import com.chainsys.creditcard.dao.NumberGenerationImpl;
import com.chainsys.creditcard.dao.UserRecordsDAO;
import com.chainsys.creditcard.model.AccountDetails;
import com.chainsys.creditcard.model.UserDetails;
@Controller

public class CreditCardController {
	
	@Autowired
	UserRecordsDAO userRecordsDAO;
	@Autowired
	AccountRecordsDAO accountRecordsDAO;
	
	static UserDetails userDetails = new UserDetails();

	
	@RequestMapping("/home")
	public String mainPage() {
		
		return "mainPage.jsp";
	
	}
	
	@PostMapping("/signup")
   public String signup(@RequestParam("fName")String fName,@RequestParam("lName")String lName,@RequestParam("DOB")String DOB
		   ,@RequestParam("aadhaar")String aadhaar,@RequestParam("pan")String pan,@RequestParam("mail")String mail,@RequestParam("ph")String ph
		   ,@RequestParam("pass")String pass) {
//		UserDetails userDetails = new UserDetails();
		AccountDetails accountDetails = new AccountDetails();
		NumberGenerationImpl numberGeneration=new NumberGenerationImpl(); 
		
		userDetails.setfName(fName);
		userDetails.setlName(lName);
		userDetails.setDob(DOB);
		userDetails.setAadhaar(aadhaar);
		userDetails.setPan(pan);
		userDetails.setMail(mail);
		userDetails.setPhone(ph);
		userDetails.setPassword(pass);
		userRecordsDAO.insert(userDetails);
		
		
		System.out.println("---->" + userRecordsDAO.readId(userDetails));
       userDetails.setCustomerID(userRecordsDAO.readId(userDetails)) ;
       System.out.println("customerID"+userDetails.getCustomerID());
		
		accountDetails.setAccountNumber( numberGeneration.accountNumber());
		accountDetails.setIfsc(numberGeneration.ifsc());
		accountRecordsDAO.insert(userDetails, accountDetails);

		
		
		
		System.out.println(accountDetails.getAccountNumber());
		
		
		
		
		
		
		return "mainPage.jsp";
	
	}
	
	
	@PostMapping("/Login")
	
	public String accountDetails(@RequestParam("mail")String mail,@RequestParam("pass")String pass) {
		UserDetails userDetails = new UserDetails();

		
		userDetails.setMail(mail);
		userDetails.setPassword(pass);
		
		System.out.println("123"+userRecordsDAO.check(userDetails));
		
		if(userRecordsDAO.check(userDetails)==true) {
			return "accountDetails.jsp";

			
		}
		
		
		return "mainPage.jsp";
		
		
	}
	

}
