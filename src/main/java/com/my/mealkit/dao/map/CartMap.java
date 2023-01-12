package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.Cart;

public interface CartMap {
	List<Cart> selectCarts(String userId);
	Cart selectCart(String userId);
	void insertCart(Cart cart);
	void deleteCart(@Param("userId") String userId, 
				@Param("mealkitNum") int mealkitNum);
	void emptyCart(String userId);
}
