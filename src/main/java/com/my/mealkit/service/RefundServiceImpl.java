package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.RefundDao;
import com.my.mealkit.domain.Refund;

@Service
public class RefundServiceImpl implements RefundService{
	@Autowired private RefundDao refundDao;
	
	@Override
	public List<Refund> getRefunds(String userId) {
		return refundDao.selectRefunds(userId);
	}
	
	@Override
	public List<Refund> getRefunds(int refundNum) {
		return refundDao.selectRefunds(refundNum);
	}
	
	@Override
	public List<Refund> getAdminRefunds() {
		return refundDao.selectAdminRefunds();
	}
	
	@Override
	public List<Refund> getMealkitNames(int refundNum) {
		return refundDao.selectMealkitNames(refundNum);
	}
	
	@Override
	public void addRefund(Refund refund) {
		refundDao.insertRefund(refund);
	}
	
	@Override
	public void fixRefund(int orderNum) {
		refundDao.updateRefund(orderNum);
	}
}
