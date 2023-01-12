package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.ExchangeMap;
import com.my.mealkit.domain.Exchange;

@Repository
public class ExchangeDaoImpl implements ExchangeDao {
	@Autowired private ExchangeMap exchangeMap;
	
	@Override
	public List<Exchange> selectExchanges(String userId) {
		return exchangeMap.selectExchanges(userId);
	}
	
	@Override
	public List<Exchange> selectExchanges(int exchangeNum) {
		return exchangeMap.selectExchanges(exchangeNum);
	}


	@Override
	public List<Exchange> selectAdminExchanges() {
		return exchangeMap.selectAdminExchanges();
	}
	
	@Override
	public List<Exchange> selectMealkitNames(int exchangeNum) {
		return exchangeMap.selectMealkitNames(exchangeNum);
	}
	
	@Override
	public void insertExchange(Exchange exchange) {
		exchangeMap.insertExchange(exchange);
	}
	
	@Override
	public void updateExchange(int orderNum) {
		exchangeMap.updateExchange(orderNum);
	}
}
