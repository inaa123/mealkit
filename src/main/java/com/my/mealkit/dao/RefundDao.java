package com.my.mealkit.dao;

import java.util.List;

import com.my.mealkit.domain.Refund;

public interface RefundDao {
	List<Refund> selectRefunds(String userId);
	List<Refund> selectRefunds(int refundNum);
	List<Refund> selectAdminRefunds();
	List<Refund> selectMealkitNames(int refundNum);
	void insertRefund(Refund refund);
	void updateRefund(int orderNum);
}
