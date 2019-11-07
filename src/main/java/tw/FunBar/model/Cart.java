package tw.FunBar.model;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
	private Map<String, CartItem> map = new LinkedHashMap<String, CartItem>();

	public double getTotal() {
		BigDecimal total = new BigDecimal("0");
		for (CartItem cartItem : map.values()) {
			BigDecimal subtotal = new BigDecimal("" + cartItem.getSubtatal());
			total = total.add(subtotal);
		}
		return total.doubleValue();
	}

	public void add(CartItem cartItem) {
		if (map.containsKey(cartItem.getProduct().getProductId())) {// 判斷原來車中是否含有項目
			CartItem _cartItem = map.get(cartItem.getProduct().getProductId().toString());// 返回原項目
			_cartItem.setCount(_cartItem.getCount() + cartItem.getCount());// 設置項目新數量
			map.put(cartItem.getProduct().getProductId().toString(), _cartItem);
		} else {
			map.put(cartItem.getProduct().getProductId().toString(), cartItem);
		}
	}

	public void clear() {
		map.clear();
	}

	public void delete(String productId) {
		map.remove(productId);
	}

	public Collection<CartItem> getCartItems() {
		return map.values();
	}
}
