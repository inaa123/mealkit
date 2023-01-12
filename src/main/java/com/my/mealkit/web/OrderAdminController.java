package com.my.mealkit.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.mealkit.domain.Order;
import com.my.mealkit.service.OrderService;

@RestController
@RequestMapping("admin/order")
public class OrderAdminController {
	@Autowired OrderService orderService;
	
	@PostMapping("listOrder")
	public String listOrder() {
		return "admin/order/listOrder";
	}
	
	@GetMapping("listOrder")
	public ModelAndView listOrder(HttpSession session, ModelAndView mv) {	
		return mv;
	}
	
	@GetMapping("getAdminOrders")
	public List<Order> getAdminOrders() {
		return orderService.getAdminOrders();
	}
	
	@GetMapping("selectMealkitNames/{orderNum}")
	public List<Order> getMealkitNames(@PathVariable int orderNum) {		
		List<Order> mealkitNameList = orderService.getMealkitNames(orderNum);
		return mealkitNameList;
	}
	
	@GetMapping("selectMealkitPrices/{orderNum}")
	public List<Order> getMealkitPrices(@PathVariable int orderNum) {
		List<Order> mealkitPriceList = orderService.getMealkitPrices(orderNum);
		return mealkitPriceList;
	}
}