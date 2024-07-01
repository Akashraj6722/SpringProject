package com.chainsys.creditcard.dao;

import java.util.Random;



public class NumberGenerationImpl implements NumberGenerationDAO {

	static Random random = new Random();

	public String accountNumber() {

		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < 4; i++) {

			sb.append(random.nextInt(10));

		}
		return "212300" + sb.toString();

	}

	public String ifsc() {

		StringBuilder sb = new StringBuilder();

		sb.append("MITB000");

		for (int i = 0; i < 1; i++) {
			char randomChar = (char) (65 + random.nextInt(25));
			sb.append(randomChar);
		}

		for (int i = 0; i < 3; i++) {
			sb.append(random.nextInt(10));
		}

		return sb.toString();
	}

	public  int ccvNumber() {

		return 100 + random.nextInt(1000);

	}

	public  String visaCreditCardNumber() {

		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < 15; i++) {

			sb.append(random.nextInt(10));

		}

		return "4" + sb.toString();

	}

	public  String masterCreditCardNumber() {

		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < 15; i++) {

			sb.append(random.nextInt(10));

		}

		return "5" + sb.toString();

	}

	public  String rupayCreditCardNumber() {

		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < 15; i++) {

			sb.append(random.nextInt(10));

		}

		return "6" + sb.toString();

	}

	public  String pulseCreditCardNumber() {

		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < 15; i++) {

			sb.append(random.nextInt(10));

		}

		return "3" + sb.toString();

	}
	
	
	public NumberGenerationImpl() {
		super();
	}

}
