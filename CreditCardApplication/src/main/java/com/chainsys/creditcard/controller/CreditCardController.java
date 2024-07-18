package com.chainsys.creditcard.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
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
import com.chainsys.creditcard.dao.TransactionRecordsDAO;
import com.chainsys.creditcard.dao.UserRecordsDAO;
import com.chainsys.creditcard.model.Account;
import com.chainsys.creditcard.model.CreditCard;
import com.chainsys.creditcard.model.Employment;
import com.chainsys.creditcard.model.Transactions;
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
	TransactionRecordsDAO transactionRecordsDAO;
	@Autowired
	User user;
	@Autowired
	Account account;
	@Autowired
	CreditCard creditCard;
	@Autowired
	Employment employment;
	@Autowired
	Transactions transactions;

	@RequestMapping("/home")
	public String mainPage() {

		return "mainPage.jsp";

	}

	@PostMapping("/cardapproval")

	public String cardApproval(@RequestParam("action") String action, @RequestParam("id") int id,
			@RequestParam("card") String cardNumber) throws MessagingException {

		switch (action) {

		case ("accept"):

//		int id = Integer.parseInt(request.getParameter("id"));
//	String cardNumber=request.getParameter("card");

			creditCard.setId(id);
			approvalRecordsDAO.approve(creditCard);

			String mail = userRecordsDAO.readMail(id);
			String message = "Your Credit Card:" + cardNumber + "has been Approved";

			MailImpl.setProperties();
			MailImpl.setMailBody(mail, message);

			System.out.println(" Accepted mail");

			return "creditCardApproval.jsp";

		case ("reject"):

			creditCard.setId(id);
			approvalRecordsDAO.reject(creditCard);

			String retrivedmail = userRecordsDAO.readMail(id);
			String mailMessage = "Your Credit Card:" + cardNumber + "has been Rejected";

			MailImpl.setProperties();
			MailImpl.setMailBody(retrivedmail, mailMessage);

			System.out.println("Rejected Mail");

			return "creditCardApproval.jsp";

		default:

			break;

		}

		return "  ";

	}

	@PostMapping("/signup")
	public String signup(@RequestParam("fName") String fName, @RequestParam("lName") String lName,
			@RequestParam("DOB") String DOB, @RequestParam("aadhaar") String aadhaar,
			@RequestParam("aadhaarProof") MultipartFile aadhaarProof, @RequestParam("pan") String pan,
			@RequestParam("panProof") MultipartFile panProof, @RequestParam("mail") String mail,
			@RequestParam("ph") String ph, @RequestParam("pass") String pass) throws IOException {

		NumberGenerationImpl numberGeneration = new NumberGenerationImpl();

		user.setfName(fName);
		user.setlName(lName);
		user.setDob(DOB);
		user.setAadhaar(aadhaar);
		user.setPan(pan);
		user.setMail(mail);
		user.setPhone(ph);
		user.setPassword(pass);
		byte[] image = null;
		image = aadhaarProof.getBytes();
		user.setAadhaarProof(image);

		image = panProof.getBytes();
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

			if (mail.endsWith("@admin.com")) {

				return "adminPage.jsp";

			} else {

				List<User> list = userRecordsDAO.readProfile(user.getMail());
				for (User values : list) {

				}
				session.setAttribute("values", list);
//		model.addAttribute("userDetails", user);

				return "customerProfile.jsp";

			}
		} else {

			return "login.jsp";
		}

	}

	@PostMapping("/logout")

	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		session = request.getSession(false);

		if (session != null) {
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

	public String cibil(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession sess = request.getSession();

		List<User> values = (List<User>) session.getAttribute("values");
		for (User display : values) {

			user.setCustomerID(display.getCustomerID());

		}
		Random random = new Random();

		System.out.println("boolen" + accountRecordsDAO.checkCibil(user, account));
		if (accountRecordsDAO.checkCibil(user, account) == false) {
			int cibilScore = random.nextInt(600, 900);
			account.setCibil(cibilScore);
			accountRecordsDAO.insertCibil(user, account);

			model.addAttribute("cibil", cibilScore);
			return "cibilScore.jsp";

		}

		else {
			System.out.println("old");

			account.setCibil(accountRecordsDAO.readCibil(user, account));
			model.addAttribute("cibil", account.getCibil());

			return "cibilScore.jsp";

		}
	}

	@PostMapping("/cardApplication")

	public String cardApplication(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		HttpSession sess = request.getSession();
		List<User> values1 = (List<User>) sess.getAttribute("values");
		for (User display : values1) {

			user.setCustomerID(display.getCustomerID());

		}

		System.out.println(accountRecordsDAO.checkCibil(user, account));
		if (accountRecordsDAO.checkCibil(user, account) == true) {

			return "cardForms.jsp";

		} else {

			System.out.println("check cibil score first");

			return "customerDetails.jsp";

		}
	}

	@PostMapping("/occupation")

	public String occupation(@RequestParam("occupation") String occupation,
			@RequestParam("companyName") String companyName, @RequestParam("designation") String designation,
			@RequestParam("annualIncome") Long annualIncome, @RequestParam("incomeProof") MultipartFile incomeProof,
			HttpSession session, HttpServletRequest request, Model model) throws IOException {

		HttpSession sess = request.getSession();
		String fName = null;
		String lName = null;
		String accountNumber = null;
		List<User> values1 = (List<User>) sess.getAttribute("values");
		for (User display : values1) {

			fName = display.getfName();
			lName = display.getlName();

			user.setMail(display.getMail());
//			user.setPassword(display.getPassword());

		}

		System.out.println("Name in occupation" + user.getMail());
//		System.out.println("Pass in occupation"+user.getPassword());

		creditCard.setHolderName(fName + " " + lName);

		employment.setOccupation(occupation);

		employment.setCompanyname(companyName);
		employment.setDesignation(designation);
		employment.setIncome(annualIncome);

		byte[] image = null;
		image = incomeProof.getBytes();
		employment.setIncomeProof(image);

		int id = userRecordsDAO.readId(user); // to get customer id

		List<Account> list = accountRecordsDAO.read(account, id); // to get account number
		for (Account values : list) {

			accountNumber = values.getAccountNumber();
		}

		account.setAccountNumber(accountNumber);
		System.out.println("accountNumber in occupation" + accountNumber);
		System.out.println("accountNumber in occupation" + account.getAccountNumber());
		employmentRecordsDAO.insert(employment, user);
		int cibil = accountRecordsDAO.readCibil(user, account);// to get cibil score

//			int cibil=bankDetails.getCibil();

		if (annualIncome >= 200000 && annualIncome < 400000 && cibil >= 650) {
			// silver

			System.out.println("Silver card in controller");
			creditCard.setCardNumber(numberGenerationDAO.rupayCreditCardNumber());
			creditCard.setCvvNumber(numberGenerationDAO.ccvNumber());

			YearMonth ym = YearMonth.now();
			String date = ym.toString();
			creditCard.setCardAppliedDate(date);

			String valid = ym.plusYears(3).toString();
			creditCard.setValidity(valid);
			creditCard.setCardType("Silver");

			cardRecordsDAO.insert(creditCard, user, account);
			model.addAttribute("preview", creditCard);
			return "previewSilver.jsp";

		} else if (annualIncome >= 400000 && annualIncome < 600000 && cibil >= 700) {
			// gold card

			System.out.println("Gold card in controller");

			creditCard.setCardNumber(numberGenerationDAO.pulseCreditCardNumber());
			creditCard.setCvvNumber(numberGenerationDAO.ccvNumber());

			YearMonth ym = YearMonth.now();
			String date = ym.toString();
			creditCard.setCardAppliedDate(date);

			String valid = ym.plusYears(3).toString();
			creditCard.setValidity(valid);
			creditCard.setCardType("Gold");

			cardRecordsDAO.insert(creditCard, user, account);
			model.addAttribute("preview", creditCard);
			return "previewGold.jsp";
		} else if (annualIncome >= 600000 && annualIncome < 800000 && cibil >= 800) {
			// platinum card

			System.out.println("Platinum card in controller");

			creditCard.setCardNumber(numberGenerationDAO.visaCreditCardNumber());
			creditCard.setCvvNumber(numberGenerationDAO.ccvNumber());

			YearMonth ym = YearMonth.now();
			String date = ym.toString();
			creditCard.setCardAppliedDate(date);

			String valid = ym.plusYears(4).toString();
			creditCard.setValidity(valid);
			creditCard.setCardType("Platinum");

			cardRecordsDAO.insert(creditCard, user, account);
			model.addAttribute("preview", creditCard);
			return "previewSilver.jsp";

		} else if (annualIncome > 800000 && cibil >= 850) {
//				//elite

			System.out.println("Elite card in controller");

			creditCard.setCardNumber(numberGenerationDAO.masterCreditCardNumber());
			creditCard.setCvvNumber(numberGenerationDAO.ccvNumber());

			YearMonth ym = YearMonth.now();
			String date = ym.toString();
			creditCard.setCardAppliedDate(date);

			String valid = ym.plusYears(5).toString();
			creditCard.setValidity(valid);
			creditCard.setCardType("Elite");

			cardRecordsDAO.insert(creditCard, user, account);
			model.addAttribute("preview", creditCard);
			return "previewSilver.jsp";
		} else {
			// sorry U are not eligible
		}

		return "cardForms.jsp";
	}

	@PostMapping("/setPin")

	public String setPin(@RequestParam("cardNumber") String cardNumber, @RequestParam("pin") int pin,
			HttpSession session, Model model) {

		List<User> list = (List<User>) session.getAttribute("values");

		for (User values : list) {

			user.setCustomerID(values.getCustomerID());
			System.out.println("in setPin Controller" + user.getCustomerID());

		}
		creditCard.setCardNumber(cardNumber);
		creditCard.setPin(pin);
		System.out.println(cardRecordsDAO.checkCardApproval(cardNumber));
		if (cardRecordsDAO.checkCardApproval(cardNumber) == true) {

			System.out.println(cardRecordsDAO.checkCardPin(cardNumber));
			if (cardRecordsDAO.checkCardPin(cardNumber) == false) {

				cardRecordsDAO.update(creditCard, user);

				model.addAttribute("checkApproval", "Success");


				return "customerProfile.jsp";

			}
		} else {
			model.addAttribute("checkApproval", "Failed");

		}

		return "setPin.jsp";

	}

	@PostMapping("/shop")

	public String shop(@RequestParam("buy") int amount, HttpSession session, Model model) {

//	   model.addAttribute("amount", amount);
		session.setAttribute("amount", amount);

		return "payment.jsp";

	}

	@PostMapping("/payment")

	public String payment(@RequestParam("amount") int amount, @RequestParam("cardNumber") String cardNumber,
			@RequestParam("cvv") int cvv, @RequestParam("validity") String validity,
			@RequestParam("description") String description, HttpSession session, HttpServletRequest request,
			Model model) {
		HttpSession sess = request.getSession();

		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyMM");
		YearMonth yearMonth = YearMonth.parse(validity, inputFormatter);
		String formattedDate = yearMonth.toString();
		System.out.println("Formatted date: " + formattedDate);

		transactions.setCardNumber(cardNumber);
		System.out.println("checkPayment" + cardRecordsDAO.checkPayment(transactions, cvv, formattedDate));
		if (cardRecordsDAO.checkPayment(transactions, cvv, formattedDate) == true) {

			List<User> list = (List<User>) session.getAttribute("values");

			for (User values : list) {

				transactions.setId((values.getCustomerID()));
				System.out.println("in payment Controller" + transactions.getId());

			}
			if (amount < 1000) {

				creditCard.setCreditPoints(0);
			}

			else if (amount > 1000 && amount <= 1500) {
				creditCard.setCreditPoints(100);
			} else if (amount > 1500 && amount <= 2500) {
				creditCard.setCreditPoints(200);
			} else {
                  
				creditCard.setCreditPoints(500);
			}
          
			
			transactions.setCardNumber(cardNumber);
			cardRecordsDAO.updateCreditPoints(creditCard, transactions);

			transactions.setTranscationId(numberGenerationDAO.transactionID());

			LocalDateTime localDateTime = LocalDateTime.now();
			String dateTime = localDateTime.toString();
			transactions.setDateTime(dateTime);
			transactions.setAmount(amount);
			transactions.setDescription(description);

			transactionRecordsDAO.insert(transactions);
			model.addAttribute("CardDetails", "paymentSuccess");
			return "shop.jsp";

		} else {

			model.addAttribute("CardDetails", "incorrectCardDetails");

		}

		return "payment.jsp";

	}

	@PostMapping("/statement")

	public String statement(@RequestParam("id") int id, @RequestParam("cardNumber") String cardNumber, Model model) {

		System.out.println("statement in controller" + transactionRecordsDAO.checkCardNumber(cardNumber, id));

		if (transactionRecordsDAO.checkCardNumber(cardNumber, id) == true) {

			transactions.setId(id);
			transactions.setCardNumber(cardNumber);

			model.addAttribute("transactions", transactions);
		}

		return "statement.jsp";

	}
	
	@PostMapping("/creditPoints")       
	
	public String creditPoints(@RequestParam("id") int id, @RequestParam("cardNumber") String cardNumber, Model model) {
		
		System.out.println("Im in creditPoints controller");
		
		System.out.println("in creditPoints controller"+cardRecordsDAO.checkPoints(id, cardNumber));
		
		if (cardRecordsDAO.checkPoints(id, cardNumber)==true) {
			
			model.addAttribute("creditPoints", cardRecordsDAO.readCreditPoints(id, cardNumber));
			
			
			
			
		}
		
		
		return "creditPointsCheck.jsp";
		
		
		
		
		
	}

}
