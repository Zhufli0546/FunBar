package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.ProductBean;

public interface ShoppingService {
	
	 List<ProductBean> showNewProducts(); 
	
	 List<ProductBean> getProductByPage(int index);
	
	 List <ProductBean> getAllProducts();
	 
	 List <ProductBean> getAllProducts1(); //後台顯示所有商品
	 
	 List <String> getAllCategories();
	 
	 List <ProductBean> getProductByCategory(String category,Integer index);

	 int getIndex();
	 
	 int getCategoryIndex();

	 int getCategoryIndex(String category);
	
	 
	
	 
}
