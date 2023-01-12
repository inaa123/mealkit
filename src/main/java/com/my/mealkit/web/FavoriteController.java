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

import com.my.mealkit.domain.Favorite;
import com.my.mealkit.domain.Mealkit;
import com.my.mealkit.service.FavoriteService;
import com.my.mealkit.service.MealkitService;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
	@Autowired private FavoriteService favoriteService;
	@Autowired private MealkitService mealkitService;
	
	@Value("${attachPath") private String attachPath;
	
	@GetMapping("/listFavorite")
	public String listFavorite(Model model, HttpSession session) {
        if(session == null || session.getAttribute("userId") == null) {
            return null;
        }
        List<Favorite> favorites = favoriteService.getFavorites((String)session.getAttribute("userId"));
        List<Mealkit> mealkits = new ArrayList<>();
        for (Favorite favorite : favorites) {
        	 int mealkitNum = favorite.getMealkitNum();
        	 mealkits.add(mealkitService.getMealkit(mealkitNum).get(0));
		}
        model.addAttribute("mealkits", mealkits);
        model.addAttribute("favorites", favorites);
        return "favorite/listFavorite";
	} 
	
	@PostMapping("addFavorite")
	public void addFavorite(HttpSession session, @RequestBody Favorite favorite) {
		favorite.setUserId(session.getAttribute("userId").toString());
		favoriteService.addFavorite(favorite);
	}
	
	@DeleteMapping("delFavorite/{mealkitNum}")
	public void delFavorite(HttpSession session, @PathVariable int mealkitNum) {
		String userId = session.getAttribute("userId").toString();
		favoriteService.delFavorite(userId, mealkitNum);
	}
}
	