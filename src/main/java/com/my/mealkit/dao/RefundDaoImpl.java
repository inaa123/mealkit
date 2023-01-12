package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.RefundMap;
import com.my.mealkit.domain.Refund;

@Repository
public class RefundDaoImpl implements RefundDao{
	@Autowired private RefundMap refundMap;
	
	@Override
	public List<Refund> selectRefunds(String userId){
		return refundMap.selectRefunds(userId);
	}
	
	@Override
	public List<Refund> selectRefunds(int refundNum) {
		return refundMap.selectRefunds(refundNum);
	}
	
	@Override
	public List<Refund> selectAdminRefunds(){
		return refundMap.selectAdminRefunds();
	}
	
	@Override
	public List<Refund> selectMealkitNames(int refundNum) {
		return refundMap.selectMealkitNames(refundNum);
	}
	
	@Override
	public void insertRefund(Refund refund) {
		refundMap.insertRefund(refund);
	}

	@Override
	public void updateRefund(int orderNum) {
		refundMap.updateRefund(orderNum);
	}
}