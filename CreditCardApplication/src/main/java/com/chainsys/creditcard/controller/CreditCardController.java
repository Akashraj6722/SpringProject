package com.chainsys.creditcard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.creditcard.dao.AccountRecordsDAO;
import com.chainsys.creditcard.dao.NumberGenerationImpl;
import com.chainsys.creditcard.dao.UserRecordsDAO;
import com.chainsys.creditcard.model.Account;
import com.chainsys.creditcard.model.User;

import jakarta.servlet.http.HttpSession;
@Controller

public class CreditCardController {
	
	@Autowired
	UserRecordsDAO userRecordsDAO;
	@Autowired
	AccountRecordsDAO accountRecordsDAO;
	@Autowired
    User user;

	
	@RequestMapping("/home")
	public String mainPage() {
		
		return "mainPage.jsp";
	
	}
	
	@PostMapping("/signup")
   public String signup(@RequestParam("fName")String fName,@RequestParam("lName")String lName,@RequestParam("DOB")String DOB
		   ,@RequestParam("aadhaar")String aadhaar,@RequestParam("pan")String pan,@RequestParam("mail")String mail,@RequestParam("ph")String ph
		   ,@RequestParam("pass")String pass) {
//		UserDetails userDetails = new UserDetails();
		Account account = new Account();
		NumberGenerationImpl numberGeneration=new NumberGenerationImpl(); 
		
		user.setfName(fName);
		user.setlName(lName);
		user.setDob(DOB);
		user.setAadhaar(aadhaar);
		user.setPan(pan);
		user.setMail(mail);
		user.setPhone(ph);
		user.setPassword(pass);
		userRecordsDAO.insert(user);
		
		
		System.out.println("---->" + userRecordsDAO.readId(user));
		user.setCustomerID(userRecordsDAO.readId(user)) ;
       System.out.println("customerID"+user.getCustomerID());
		
       account.setAccountNumber( numberGeneration.accountNumber());
       account.setIfsc(numberGeneration.ifsc());
		accountRecordsDAO.insert(user, account);

		
		
		
		System.out.println(account.getAccountNumber());
		
		
		
		
		
		
		return "mainPage.jsp";
	
	}
	
	
	@PostMapping("/Login")
	
	public String profile(@RequestParam("mail")String mail,@RequestParam("pass")String pass
			,HttpSession session,Model  model) {

		
		user.setMail(mail);
		user.setPassword(pass);
		
		System.out.println("123"+userRecordsDAO.check(user));
		
		if(userRecordsDAO.check(user)==true) {
			
			System.out.println("mail from contll --->" + user.getMail());
			session.setAttribute("userDetails", user);
			model.addAttribute("userDetails", user);

	
			return "customerDetails.jsp";

			
		}
		
		
		return "mainPage.jsp";
		
		
	}
	
@PostMapping("/accountDetails")
	
	public String account(Model  model) {
	
	
//	int id;
        List<User> list= userRecordsDAO.read(user.getMail());
        for(User values:list) {
     System.out.println("in account controller"+values.getCustomerID());   
        	
        }
        model.addAttribute("id", list);
        

	
				return "accountDetails.jsp";
	
	
	
}
	

}
