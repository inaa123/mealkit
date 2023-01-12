package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.ExchangeDao;
import com.my.mealkit.domain.Exchange;

@Service
public class ExchangeServiceImpl implements ExchangeService {
	@Autowired private ExchangeDao exchangeDao;
	
	@Override
	public List<Exchange> getExchanges(String userId) {
		return exchangeDao.selectExchanges(userId);
	}
	
	@Override
	public	List<Exchange> getExchanges(int exchangeNum) {
		return exchangeDao.selectExchanges(exchangeNum);
	}

	
	@Override
	public List<Exchange> getAdminExchanges() {
		return exchangeDao.selectAdminExchanges();
	}

	@Override
	public List<Exchange> getMealkitNames(int exchangeNum) {
		return exchangeDao.selectMealkitNames(exchangeNum);
	}

	@Override
	public void addExchange(Exchange exchange) {
		exchangeDao.insertExchange(exchange);
	}
	
	@Override
	public void fixExchange(int orderNum) {
		exchangeDao.updateExchange(orderNum);
	}
}
