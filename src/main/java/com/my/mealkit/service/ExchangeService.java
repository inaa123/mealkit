package com.my.mealkit.service;

import java.util.List;

import com.my.mealkit.domain.Exchange;

public interface ExchangeService {
	List<Exchange> getExchanges(String userId);
	List<Exchange> getExchanges(int exchangeNum);
	List<Exchange> getAdminExchanges();
	List<Exchange> getMealkitNames(int exchangeNum);
	void addExchange(Exchange exchange);
	void fixExchange(int orderNum);
}
