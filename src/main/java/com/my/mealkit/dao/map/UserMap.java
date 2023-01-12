package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.User;

public interface UserMap {
	List<User> selectUsers();
	List<User> selectSearchUsers(@Param("keyword") String keyword);
	User selectUser(User user);
	String selectUserId(@Param("userId") String userId);
	String findUserId(@Param("email") String email);
	String selectEmail(@Param("email") String email);
	void insertUser(User user);
	void updatePassword(@Param("userId") String userId, @Param("email") String email, @Param("password") String password);
	void updateUser(User user);
	void deleteUser(String userId);
}