package com.example.rpms.constant;

import org.apache.commons.lang.RandomStringUtils;

public class Constant {

	public static final String patientRole = "ROLE_PATIENT";
	public static final String hcgRole = "ROLE_HCG";
	public static final String nurseRole = "ROLE_NURSE";
	public static final String docRole = "ROLE_DOC";
	

	public static String randomString(){
		return RandomStringUtils.random(5,"0123456789abcdefghijklmnopqrstuvwxyz");
	}

}
