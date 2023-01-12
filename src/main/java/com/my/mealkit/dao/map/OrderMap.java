package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.Order;
import com.my.mealkit.domain.OrderMealkitDto;

public interface OrderMap {
	List<Order> selectOrders(@Param("userId") String userId);
	List<Order> selectOrders2(@Param("orderNum") int orderNum);
	List<Order> selectAdminOrders();
	List<Order> selectMealkitNames(@Param("orderNum") int orderNum);
	List<Order> selectMealkitPrices(@Param("orderNum") int orderNum);
	Order selectOrder(@Param("orderNum") int orderNum);
	void insertOrder(Order order);
	void insertOrderMealkit(OrderMealkitDto orderMealkit);
	void updateOrder(Order order);
	int selectOrderNumSeq();
}