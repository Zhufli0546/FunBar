package tw.FunBar.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.FunBar.model.ProductBean;
import tw.FunBar.service.ShoppingService;

@Controller
public class ShoppingController {
	@Autowired
	ShoppingService shoppingService;
	
	
	@RequestMapping("/shoppingCart")
	public String shoppingCart(Model model) {
		 List<ProductBean> show = shoppingService.getAllProducts();
		
		
		
		model.addAttribute("all",show);
		return "shoppingCart";
		
	}
}
