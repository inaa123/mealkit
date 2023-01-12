package com.my.mealkit.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.mealkit.domain.Cart;
import com.my.mealkit.domain.Mealkit;
import com.my.mealkit.service.CartService;
import com.my.mealkit.service.MealkitService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired private CartService cartService;
	@Autowired private MealkitService mealkitService;
	
	@Value("${attachPath") private String attachPath;
	
	@GetMapping("/listCart")
	public String listCart(Model model, HttpSession session) {
        if(session == null || session.getAttribute("userId") == null) {
            return null;
        }
        List<Cart> carts = cartService.getCarts((String)session.getAttribute("userId"));
        List<Mealkit> mealkits = new ArrayList<>();
        for (Cart cart : carts) {
        	 int mealkitNum = cart.getMealkitNum();
        	 mealkits.add(mealkitService.getMealkit(mealkitNum).get(0));
		}
        model.addAttribute("mealkits", mealkits);
        model.addAttribute("carts", carts);
        return "cart/listCart";
	} 
	
	@PostMapping("addCart")
	public void addCart(HttpSession session, @RequestBody Cart cart) {
		cart.setUserId(session.getAttribute("userId").toString());
		cartService.addCart(cart);
	}
	
	@DeleteMapping("delCart/{mealkitNum}")
	public void delCart(HttpSession session, @PathVariable int mealkitNum) {
		String userId = session.getAttribute("userId").toString();
		cartService.delCart(userId, mealkitNum);
	}
}
