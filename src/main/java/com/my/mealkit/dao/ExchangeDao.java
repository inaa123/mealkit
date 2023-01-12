package com.my.mealkit.dao;

import java.util.List;

import com.my.mealkit.domain.Exchange;

public interface ExchangeDao {
	List<Exchange> selectExchanges(String userId);
	List<Exchange> selectExchanges(int exchangeNum);
	List<Exchange> selectAdminExchanges();
	List<Exchange> selectMealkitNames(int exchangeNum);
	void insertExchange(Exchange exchange);
	void updateExchange(int orderNum);
}
