package com.my.mealkit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Exchange;
import com.my.mealkit.service.ExchangeService;

@RestController
@RequestMapping("admin/exchange")
public class ExchangeAdminController {
	@Autowired private ExchangeService exchangeService;
	
	@GetMapping("listExchange")
	public ModelAndView listExchange(ModelAndView mv) {	
		return mv;
	}
	
	@GetMapping("getAdminExchanges")
	public List<Exchange> getAdminExchanges() {
		return exchangeService.getAdminExchanges();
	}
	
	@GetMapping("selectMealkitNames/{exchangeNum}")
	public List<Exchange> getMealkitNames(@PathVariable int exchangeNum) {		
		List<Exchange> mealkitNameList = exchangeService.getMealkitNames(exchangeNum);
		return mealkitNameList;
	}
}
