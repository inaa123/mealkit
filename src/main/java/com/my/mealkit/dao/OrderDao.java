package com.my.mealkit.dao;

import java.util.List;

import com.my.mealkit.domain.Order;
import com.my.mealkit.domain.OrderMealkitDto;

public interface OrderDao {
	List<Order> selectOrders(String userId);
	List<Order> selectAdminOrders();
	List<Order> selectMealkitNames(int orderNum);
	List<Order> selectOrders(int orderNum);
	List<Order> selectMealkitPrices(int orderNum);
	Order selectOrder(int orderNum);
	void insertOrder(Order order);
	void insertOrderMealkit(OrderMealkitDto orderMealkit);
	void updateOrder(Order order);
	int selectOrderNumSeq();
}