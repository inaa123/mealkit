package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.CartDao;
import com.my.mealkit.domain.Cart;

@Service
public class CartServiceImpl implements CartService {
@Autowired private CartDao cartDao;
	
	@Override
	public List<Cart> getCarts(String userId) {
		return cartDao.selectCarts(userId);
	}

	@Override
	public Cart getCart(String userId) {
		return cartDao.selectCart(userId);
	}
	
	@Override
	public void addCart(Cart cart) {
		cartDao.insertCart(cart);
	}

	@Override
	public void delCart(String userId, int mealkitNum) {
		cartDao.deleteCart(userId, mealkitNum);
	}

	@Override
	public void emptyCart(String userId) {
		cartDao.emptyCart(userId);	
	}
}
