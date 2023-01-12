package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.OrderDao;
import com.my.mealkit.domain.Order;
import com.my.mealkit.domain.OrderMealkitDto;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired private OrderDao orderDao;
	
	@Override
	public List<Order> getOrders(String userId) {
		return orderDao.selectOrders(userId);
	}
	
	@Override
	public List<Order> getOrders(int orderNum) {
		return orderDao.selectOrders(orderNum);
	}
	
	@Override
	public List<Order> getAdminOrders() {
		return orderDao.selectAdminOrders();
	}
	
	@Override
	public List<Order> getMealkitNames(int orderNum) {
		return orderDao.selectMealkitNames(orderNum);
	}	
	
	@Override
	public List<Order> getMealkitPrices(int orderNum) {
		return orderDao.selectMealkitPrices(orderNum);
	}

	@Override
	public Order getOrder(int orderNum) {
		return orderDao.selectOrder(orderNum);
	}

	@Override
	public void addOrder(Order order) {
		orderDao.insertOrder(order);
	}

	@Override
	public void addOrderMealkit(OrderMealkitDto orderMealkit) {
		orderDao.insertOrderMealkit(orderMealkit);
	}
	
	@Override
	public void fixOrder(Order order) {
		orderDao.updateOrder(order);
	}
	
	@Override
	public int getOrderNumSeq() {
		return orderDao.selectOrderNumSeq();
	}
}