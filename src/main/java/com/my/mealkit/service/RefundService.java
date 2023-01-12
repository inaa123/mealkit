package com.my.mealkit.service;

import java.util.List;

import com.my.mealkit.domain.Refund;

public interface RefundService {
	List<Refund> getRefunds(String userId);
	List<Refund> getRefunds(int refundNum);
	List<Refund> getAdminRefunds();
	List<Refund> getMealkitNames(int refundNum);
	void addRefund(Refund refund);
	void fixRefund(int orderNum);
}
