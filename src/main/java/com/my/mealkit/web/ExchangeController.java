package com.my.mealkit.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Exchange;
import com.my.mealkit.domain.Order;
import com.my.mealkit.service.ExchangeService;
import com.my.mealkit.service.OrderService;

@RestController
@RequestMapping("exchange")
public class ExchangeController {
	@Autowired private ExchangeService exchangeService;
	@Autowired private OrderService orderService;
	
	@GetMapping("listExchange")
	public ModelAndView listExchange(ModelAndView mv) {
		mv.setViewName("exchange/listExchange");
		return mv;
	}
	
	@GetMapping("applyExchange")
	public ModelAndView applyExchange(@RequestParam("orderNum") int orderNum, ModelAndView mv) {
		List<Order> orders = orderService.getOrders(orderNum);
		mv.addObject("orders", orders);
		mv.setViewName("exchange/applyExchange");
		return mv;
	}
	
	@PostMapping("applyExchange")
	public void applyExchange(@RequestBody Exchange exchange) {
		exchangeService.addExchange(exchange);
	}

	@GetMapping("listExchanges")
	public List<Exchange> getExchanges(HttpSession session) {
		String userId = session.getAttribute("userId").toString();
		List<Exchange> exchanges = exchangeService.getExchanges(userId);
		return exchanges;
	}
	
	@GetMapping("selectMealkitNames/{exchangeNum}")
	public List<Exchange> getMealkitNames(@PathVariable int exchangeNum) {		
		List<Exchange> mealkitNameList = exchangeService.getMealkitNames(exchangeNum);
		return mealkitNameList;
	}
	
	@PutMapping("fixExchange")
	public void fixExchange(@RequestBody Exchange exchange) {
		exchangeService.fixExchange(exchange.getOrderNum());
	}	
}
