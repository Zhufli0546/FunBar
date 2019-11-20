package tw.FunBar.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.FunBar.model.ProductBean;
import tw.FunBar.service.ShoppingService;

@Controller
public class IndexController {
	@Autowired
	ShoppingService shoppingService;
	
	
	@RequestMapping("/")
	public String index(Model model) {	
		List<ProductBean> show = shoppingService.showNewProducts();
		model.addAttribute("all", show);
		return "index" ;
	}
	

	
	
}
