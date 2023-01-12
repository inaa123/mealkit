package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.OrderMap;
import com.my.mealkit.domain.Order;
import com.my.mealkit.domain.OrderMealkitDto;


@Repository
public class OrderDaoImpl implements OrderDao {
	@Autowired private OrderMap orderMap;
	
	@Override
	public List<Order> selectOrders(String userId) {
		return orderMap.selectOrders(userId);
	}
	
	@Override
	public List<Order> selectOrders(int orderNum) {
		return orderMap.selectOrders2(orderNum);
	}
	
	@Override
	public List<Order> selectAdminOrders() {
		return orderMap.selectAdminOrders();
	}
	
	@Override
	public List<Order> selectMealkitNames(int orderNum) {
		return orderMap.selectMealkitNames(orderNum);
	}
	
	
	@Override
	public List<Order> selectMealkitPrices(int orderNum) {
		return orderMap.selectMealkitPrices(orderNum);
	}

	@Override
	public Order selectOrder(int orderNum) {
		return orderMap.selectOrder(orderNum);
	}

	@Override
	public void insertOrder(Order order) {
		orderMap.insertOrder(order);
	}
	
	@Override
	public void insertOrderMealkit(OrderMealkitDto orderMealkit) {
		orderMap.insertOrderMealkit(orderMealkit);
	}
	
	@Override
	public void updateOrder(Order order) {
		orderMap.updateOrder(order);
	}
	
	@Override
	public int selectOrderNumSeq() {
		return orderMap.selectOrderNumSeq();
	}
}