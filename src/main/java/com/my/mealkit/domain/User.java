package com.my.mealkit.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor 
public class User {
	private String userId;
	private String password;
	private String userName;
	private String email;
	private String phoneNum;
	private String zipCode;
	private String basicAddress;
	private String detailAddress;
}