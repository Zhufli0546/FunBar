package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.ProductBean;

public interface ShoppingDAO {
	
	 List <ProductBean> getAllProducts();
	 
	 List <ProductBean> getProductById(int productId);
	 
	 List <String> getAllCategories();
	 
	 List <ProductBean> getProductByCategory(String category);
	 
	 
}
