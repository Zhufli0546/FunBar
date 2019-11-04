package tw.FunBar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import tw.FunBar.dao.ShoppingDAO;
import tw.FunBar.model.ProductBean;
import tw.FunBar.service.ShoppingService;

@Service
public class ShoppingServiceImpl implements ShoppingService{
	@Autowired
	ShoppingDAO dao;
	
	@Autowired
	public void setDao(ShoppingDAO dao) {
		this.dao = dao;
	}
		

	@Transactional
	@Override
	public List<ProductBean> getAllProducts() {
		return dao.getAllProducts();
	}

	@Transactional
	@Override
	public List<String> getAllCategories() {
		return dao.getAllCategories();
	}

	@Transactional
	@Override
	public List<ProductBean> getProductByCategory(String category) {
		return dao.getProductByCategory(category);
	}

}
