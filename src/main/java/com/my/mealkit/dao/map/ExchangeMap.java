package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.Exchange;

public interface ExchangeMap {
	List<Exchange> selectExchanges(@Param("userId") String userId);
	List<Exchange> selectExchanges(@Param("exchangeNum") int exchangeNum);
	List<Exchange> selectAdminExchanges();
	List<Exchange> selectMealkitNames(@Param("exchangeNum") int exchangeNum);
	void insertExchange(Exchange exchange);
	void updateExchange(int orderNum);
}
