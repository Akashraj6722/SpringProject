package com.chainsys.creditcard.controller;

import java.io.IOException;
import java.time.YearMonth;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chainsys.creditcard.dao.AccountRecordsDAO;
import com.chainsys.creditcard.dao.ApprovalRecordsDAO;
import com.chainsys.creditcard.dao.CardRecordsDAO;
import com.chainsys.creditcard.dao.EmploymentRecordsDAO;
import com.chainsys.creditcard.dao.MailImpl;
import com.chainsys.creditcard.dao.NumberGenerationDAO;
import com.chainsys.creditcard.dao.NumberGenerationImpl;
import com.chainsys.creditcard.dao.UserRecordsDAO;
import com.chainsys.creditcard.model.Account;
import com.chainsys.creditcard.model.CreditCard;
import com.chainsys.creditcard.model.Employment;
import com.chainsys.creditcard.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller

public class CreditCardController {

	@Autowired
	UserRecordsDAO userRecordsDAO;
	@Autowired
	AccountRecordsDAO accountRecordsDAO;
	@Autowired
	EmploymentRecordsDAO employmentRecordsDAO;
	@Autowired
	NumberGenerationDAO numberGenerationDAO;
	@Autowired
	CardRecordsDAO cardRecordsDAO;
	@Autowired
	ApprovalRecordsDAO approvalRecordsDAO;
	@Autowired
	User user;
	@Autowired
	Account account;
	@Autowired
	CreditCard creditCard;
	@Autowired
	Employment  employment;
	

	@RequestMapping("/home")
	public String mainPage() {

		return "mainPage.jsp";

	}

	
@PostMapping("/cardapproval")
	
	public String cardApproval(@RequestParam("action")String action ,@RequestParam("id")int id,@RequestParam("card")String cardNumber) throws MessagingException {
	
	switch(action) {
	
	case("accept"):
		
//		int id = Integer.parseInt(request.getParameter("id"));
//	String cardNumber=request.getParameter("card");
		
	creditCard.setId(id);
	approvalRecordsDAO.approve(creditCard);
	
	
    String mail=userRecordsDAO.readMail(id);
	String message="Your Credit Card:"+cardNumber+"has been Approved";
	
	MailImpl.setProperties();
	MailImpl.setMailBody(mail, message);
	
	System.out.println(" Accepted mail");
	
	return"creditCardApproval.jsp";
	
	
	
	

		
	case("reject"):
		
		creditCard.setId(id);
	approvalRecordsDAO.reject(creditCard);
	
    	 
    	 String retrivedmail=userRecordsDAO.readMail(id);
 	String mailMessage="Your Credit Card:"+cardNumber+"has been Rejected";
 	
 	MailImpl.setProperties();
	MailImpl.setMailBody(retrivedmail, mailMessage);
	
	System.out.println("Rejected Mail");
 	
 	
		
	return"creditCardApproval.jsp";
     
     
     
     default:
			
			break;
	
	
	}



		return"  ";
		
	}

	@PostMapping("/signup")
	public String signup(@RequestParam("fName") String fName, @RequestParam("lName") String lName,
			@RequestParam("DOB") String DOB, @RequestParam("aadhaar") String aadhaar,@RequestParam("aadhaarProof") MultipartFile aadhaarProof, @RequestParam("pan") String pan,
			@RequestParam("panProof") MultipartFile panProof,@RequestParam("mail") String mail, @RequestParam("ph") String ph, @RequestParam("pass") String pass) throws IOException {

		NumberGenerationImpl numberGeneration = new NumberGenerationImpl();

		user.setfName(fName);
		user.setlName(lName);
		user.setDob(DOB);
		user.setAadhaar(aadhaar);
		user.setPan(pan);
		user.setMail(mail);
		user.setPhone(ph);
		user.setPassword(pass);
		byte[] image=null;
		image=aadhaarProof.getBytes();
		user.setAadhaarProof(image);
		
		image=panProof.getBytes();
		user.setPanProof(image);
								
		userRecordsDAO.insert(user);

		user.setCustomerID(userRecordsDAO.readId(user));

		account.setAccountNumber(numberGeneration.accountNumber());
		account.setIfsc(numberGeneration.ifsc());
		accountRecordsDAO.insert(user, account);

		System.out.println(account.getAccountNumber());

		return "mainPage.jsp";

	}

	@PostMapping("/Login")

	public String profile(@RequestParam("mail") String mail, @RequestParam("pass") String pass, HttpSession session,
			Model model) {

		user.setMail(mail);
		user.setPassword(pass);
		
		
		if (userRecordsDAO.check(user) == true) {
		
			if(mail.endsWith("@admin.com")) {
				
				return"adminPage.jsp";
			
			}else {

			List<User> list = userRecordsDAO.readProfile(user.getMail());
			for (User values : list) {

			}
			session.setAttribute("values", list);
			session.setAttribute("userDetails", user);
		model.addAttribute("userDetails", user);

			return "customerProfile.jsp";

		}
		}
		return "mainPage.jsp";

	}
	
	
	@PostMapping("/logout")
	
	
	public String logout(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		
		 session=request.getSession(false);
		
		if(session!=null) {
			session.invalidate();
		}
		
		
		return "mainPage.jsp";
		
	}

	@PostMapping("/accountDetails")

	public String account(HttpSession session, Model model) {

		List<User> list = userRecordsDAO.readProfile(user.getMail());
		for (User values : list) {

		}
		model.addAttribute("id", list);

		return "accountDetails.jsp";

	}

	@PostMapping("/cibil")

	public String cibil(HttpSession session, Model model,HttpServletRequest request, HttpServletResponse response) {
        
		 HttpSession sess = request.getSession();

		List<User> values = (List<User>) session.getAttribute("values");
		for (User display : values) {

			user.setCustomerID(display.getCustomerID());

		}
		Random random =new Random();

		System.out.println("boolen"+accountRecordsDAO.checkCibil(user, account));
		if (accountRecordsDAO.checkCibil(user, account) == false) {
			int cibilScore = random.nextInt(600, 900);
			account.setCibil(cibilScore);
			accountRecordsDAO.insertCibil(user, account);

			model.addAttribute("cibil", cibilScore);
			return "cibilScore.jsp";

		}

		else {
			System.out.println("old");

	       account.setCibil(accountRecordsDAO.readCibil(user, account)) ;
			model.addAttribute("cibil", account.getCibil());

			return "cibilScore.jsp";

		}
	}
	
	
	@PostMapping("/cardApplication")
	
	public String cardApplication(HttpSession session,HttpServletRequest request, HttpServletResponse response ) {
		
		HttpSession sess=request.getSession();
		List<User> values1 = (List<User>) sess.getAttribute("values");
		for (User display : values1) {
			
			user.setCustomerID( display.getCustomerID());

		}

			System.out.println(accountRecordsDAO.checkCibil(user, account));
			if(accountRecordsDAO.checkCibil(user, account)==true) {
				
				return "cardForms.jsp";

			}
			else {
                
				System.out.println("check cibil score first");
		
		
		return "customerDetails.jsp";
		
		
			}
	}
	
	@PostMapping("/occupation")
	
	public String  occupation(@RequestParam("occupation") String occupation,@RequestParam("companyName") String companyName,
			@RequestParam("designation") String designation,@RequestParam("annualIncome") Long annualIncome,@RequestParam("incomeProof") MultipartFile incomeProof,
			HttpSession session,HttpServletRequest request, Model model) throws IOException {
		
		HttpSession sess = request.getSession();
		String fName = null;
		String lName = null;
		String accountNumber=null;
		List<User> values1 = (List<User>) sess.getAttribute("values");
		for (User display : values1) {

			fName = display.getfName();
			lName = display.getlName();

			user.setMail(display.getMail());
//			user.setPassword(display.getPassword());

			
		}
		
		System.out.println("Name in occupation"+user.getMail());
//		System.out.println("Pass in occupation"+user.getPassword());

			creditCard.setHolderName(fName + " " + lName);

			employment.setOccupation(occupation);

			employment.setCompanyname(companyName);
			employment.setDesignation(designation);
			employment.setIncome(annualIncome);
			
			byte[] image=null;
			image=incomeProof.getBytes();
			employment.setIncomeProof(image);
			
			

			   int id= userRecordsDAO.readId(user);         // to get customer id
				
				List<Account> list=accountRecordsDAO.read(account,id); // to get account number
				for(Account values:list) {
					
					accountNumber=values.getAccountNumber();
				}
				
				account.setAccountNumber(accountNumber);
				System.out.println("accountNumber in occupation"+accountNumber);
				System.out.println("accountNumber in occupation"+account.getAccountNumber());
				employmentRecordsDAO.insert(employment, user);
				int cibil=accountRecordsDAO.readCibil(user, account);//to get cibil score

//			int cibil=bankDetails.getCibil();

			if (annualIncome >= 200000 && annualIncome < 400000 && cibil>=650) {
				//silver

				creditCard.setCardNumber(numberGenerationDAO.rupayCreditCardNumber());
				creditCard.setCvvNumber(numberGenerationDAO.ccvNumber());

				YearMonth ym = YearMonth.now();
				String date = ym.toString();
				creditCard.setCardAppliedDate(date);

				String valid = ym.plusYears(3).toString();
				creditCard.setValidity(valid);
				creditCard.setCardType("silver");

			
					cardRecordsDAO.insert(creditCard, user, account);
				model.addAttribute("preview", creditCard);
					return "previewSilver.jsp";
					
			}
//					request.setAttribute("values", cardRecordsDAO.display(creditCard));
//					request.getRequestDispatcher("PreviewSilver.jsp").forward(request, response);
//
//
//				} catch (ClassNotFoundException | SQLException e) {
//					e.printStackTrace();
//				}
//
//				
//			} else if (income >= 400000 && income < 600000 && cibil>=700 ) {
//				//gold card
//				card.setCardNumber(NumberGeneration.pulseCreditCardNumber());
//				card.setCvvNumber(NumberGeneration.ccvNumber());
//
//				YearMonth ym = YearMonth.now();
//				String date = ym.toString();
//				card.setCardAppliedDate(date);
//
//				String valid = ym.plusYears(3).toString();
//				card.setValidity(valid);
//				card.setCardType("gold");
//
//				try {
//					CardRecords.insert(card, display, bankDetails);
//					request.setAttribute("values", PreviewDetails.display(card));
//					request.getRequestDispatcher("PreviewGold.jsp").forward(request, response);
//
//				} catch (ClassNotFoundException | SQLException e) {
//					e.printStackTrace();
//				}
//
//				
//			} else if (income >= 600000 && income < 800000 && cibil>=800) {
//				//platinum card
//
//				card.setCardNumber(NumberGeneration.visaCreditCardNumber());
//				card.setCvvNumber(NumberGeneration.ccvNumber());
//
//				YearMonth ym = YearMonth.now();
//				String date = ym.toString();
//				card.setCardAppliedDate(date);
//
//				String valid = ym.plusYears(4).toString();
//				card.setValidity(valid);
//				card.setCardType("platinum");
//
//				try {
//					CardRecords.insert(card, display, bankDetails);
//					request.setAttribute("values", PreviewDetails.display(card));
//					request.getRequestDispatcher("PreviewPlatinum.jsp").forward(request, response);
//
//
//				} catch (ClassNotFoundException | SQLException e) {
//					e.printStackTrace();
//				}
//
//				
//			} else if (income > 800000 && cibil>=850) {
//				//elite
//				card.setCardNumber(NumberGeneration.masterCreditCardNumber());
//				card.setCvvNumber(NumberGeneration.ccvNumber());
//
//				YearMonth ym = YearMonth.now();
//				String date = ym.toString();
//				card.setCardAppliedDate(date);
//
//				String valid = ym.plusYears(5).toString();
//				card.setValidity(valid);
//				card.setCardType("elite");
//
//				try {
//					CardRecords.insert(card, display, bankDetails);
//					request.setAttribute("values", PreviewDetails.display(card));
//					request.getRequestDispatcher("PreviewElite.jsp").forward(request, response);
//
//
//				} catch (ClassNotFoundException | SQLException e) {
//					e.printStackTrace();
//				}
//
//				
//			} else {
//                //sorry U are not eligible
//
//			}
//
//		}

	
		return designation;
}
	
	@PostMapping("/setPin")
	
	public String setPin(@RequestParam("cardNumber")String cardNumber,@RequestParam("pin")int pin) {
		
		
		
		
		
		
		return null;
		
		
		
	}
}

