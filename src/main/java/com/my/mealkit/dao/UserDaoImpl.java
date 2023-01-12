package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.UserMap;
import com.my.mealkit.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;
		
	@Override
	public List<User> selectUsers() {
		return userMap.selectUsers();
	}

	@Override
	public List<User> selectSearchUsers(String keyword) {
		return userMap.selectSearchUsers(keyword);
	}

	@Override
	public User selectUser(User user) {
		return userMap.selectUser(user);
	}
	
	@Override
	public User selectUser(String userId) {
		User user = new User(userId, null, null, null, null, null, null, null);
		return userMap.selectUser(user);
	}

	@Override
	public String selectUserId(String userId) {
		return userMap.selectUserId(userId);
	}

	@Override
	public String findUserId(String email) {
		return userMap.findUserId(email);
	}
	
	@Override
	public String selectEmail(String email) {
		return userMap.selectEmail(email);
	}

	@Override
	public void insertUser(User user) {
		userMap.insertUser(user);
	}
	
	@Override
	public void updatePassword(String userId, String email, String password) {
		userMap.updatePassword(userId, email, password);
	}
	
	@Override
	public void updateUser(User user) {
		userMap.updateUser(user);
	}

	@Override
	public void deleteUser(String userId) {
		userMap.deleteUser(userId);
	}
}
