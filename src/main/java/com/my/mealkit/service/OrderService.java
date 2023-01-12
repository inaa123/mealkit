package com.my.mealkit.service;

import java.util.List;

import com.my.mealkit.domain.Order;
import com.my.mealkit.domain.OrderMealkitDto;

public interface OrderService {
	List<Order> getOrders(String userId);
	List<Order> getOrders(int orderNum);
	List<Order> getAdminOrders();
	List<Order> getMealkitNames(int orderNum);
	List<Order> getMealkitPrices(int orderNum);
	Order getOrder(int orderNum);
	void addOrder(Order order);
	void addOrderMealkit(OrderMealkitDto orderMealkit);
	void fixOrder(Order order);
	int getOrderNumSeq();
}