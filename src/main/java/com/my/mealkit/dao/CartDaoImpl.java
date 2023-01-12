package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.CartMap;
import com.my.mealkit.domain.Cart;

@Repository
public class CartDaoImpl implements CartDao {
	@Autowired private CartMap cartMap;
	
	@Override
	public List<Cart> selectCarts(String userId) {
		return cartMap.selectCarts(userId);
	}

	@Override
	public Cart selectCart(String userId) {
		return cartMap.selectCart(userId);
	}
	
	@Override
	public void insertCart(Cart cart) {
		cartMap.insertCart(cart);
	}

	@Override
	public void deleteCart(String userId, int mealkitNum) {
		cartMap.deleteCart(userId, mealkitNum);
	}

	@Override
	public void emptyCart(String userId) {
		cartMap.emptyCart(userId);	
	}
}
