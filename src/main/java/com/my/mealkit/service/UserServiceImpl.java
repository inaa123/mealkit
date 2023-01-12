package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.UserDao;
import com.my.mealkit.domain.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	@Override
	public boolean loginVerify(User user) {
		boolean isGood = false;
		User targetUser = userDao.selectUser(user);
		if(targetUser != null) {
			if(user.getUserId().equals(targetUser.getUserId()) && user.getPassword().equals(targetUser.getPassword())) isGood = true;
		}
		return isGood;
	}

	@Override
	public boolean idDoubleCheck(String userId) {
		boolean isGood = false;
		if(userDao.selectUserId(userId) == null) isGood = true;
		return isGood;
	}

	@Override
	public boolean emailDoubleCheck(String email) {
		boolean isGood = false;
		if(userDao.selectEmail(email) == null) isGood = true;
		return isGood;
	}
	
	@Override
	public String findUserId(String email) {
		return userDao.findUserId(email);
	}
	
	@Override
	public List<User> getUsers() {
		return userDao.selectUsers();
	}

	@Override
	public List<User> getSearchUsers(String keyword) {
		return userDao.selectSearchUsers(keyword);
	}

	@Override
	public User getUser(String userId) {
		return userDao.selectUser(userId);
	}
	
	@Override
	public void addUser(User user) {
		userDao.insertUser(user);
	}
	
	@Override
	public void resetPassword(String userId, String email, String password) {
		userDao.updatePassword(userId, email, password);
	}
	
	@Override
	public void fixUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public void delUser(String userId) {
		userDao.deleteUser(userId);
	}
}

