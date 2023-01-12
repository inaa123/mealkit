package com.my.mealkit.service;

import java.util.List;

import com.my.mealkit.domain.User;

public interface UserService {
	boolean loginVerify(User user);
	boolean idDoubleCheck(String userId);
	boolean emailDoubleCheck(String email);
	String findUserId(String email);
	List<User> getUsers();
	List<User> getSearchUsers(String keyword);
	User getUser(String userId);
	void addUser(User user);
	void resetPassword(String userId, String email, String password);
	void fixUser(User user);
	void delUser(String userId);
}