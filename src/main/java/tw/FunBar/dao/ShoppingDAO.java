package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.ProductBean;

public interface ShoppingDAO {
	
	 List <ProductBean> showNewProducts(); //首頁最新商品
	
	 List <ProductBean> getAllProducts();
	 
	 List <ProductBean> getAllproducts1(); //後台管理顯示所有商品
	 
	 List <String> getAllCategories();
	 
	 List <ProductBean> getProductByCategory(String category);
	 
	 
}
