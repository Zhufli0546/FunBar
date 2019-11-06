package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.ProductBean;

public interface ShoppingService {

	List<ProductBean> getAllProducts();
	
	List <ProductBean> getProductById(int productId);

	List<String> getAllCategories();

	List<ProductBean> getProductByCategory(String category);


}
