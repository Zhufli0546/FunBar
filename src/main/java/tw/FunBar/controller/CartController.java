package tw.FunBar.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.model.Cart;
import tw.FunBar.model.CartItem;
import tw.FunBar.model.ProductBean;
import tw.FunBar.service.OrderHandleService;

@Controller
public class CartController {
	@Autowired
	OrderHandleService orderHandleService;
	
	@Autowired
	ServletContext context;
	
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String addCart(HttpServletRequest request, 
						  HttpSession session, 
						  HttpServletRequest response,
						  @RequestParam Integer productId,
						  @RequestParam Integer count) throws IOException {
		session = request.getSession(false);

		// 未來整合 login 才能產生購物車

		Cart cart = (Cart) session.getAttribute("Cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("Cart", cart);
		}

		ProductBean product = orderHandleService.getProductById(productId);

		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setCount(count);
		cart.add(cartItem);

		Collection<CartItem> item = cart.getCartItems();
//		for (CartItem c : item) {
//			System.out.println("購買產品id:" + c.getProduct().getProductId());
//			System.out.println("購買產品名稱:" + c.getProduct().getProductName());
//			System.out.println("購買產品數量:" + c.getCount());
//		}

		return "redirect:/shoppingCart";
	}

	
	@RequestMapping(value = "/showCart")
	public String showCart(HttpServletRequest request, 
						   HttpSession session,
						   Model model) throws IOException {
		session = request.getSession(false);
		Cart cart = (Cart) session.getAttribute("Cart");

		Collection<CartItem> cartItems = cart.getCartItems();
		for (CartItem c : cartItems) {
			System.out.println("購買產品id:" + c.getProduct().getProductId());
			System.out.println("購買產品名稱:" + c.getProduct().getProductName());
			System.out.println("購買產品數量:" + c.getCount());
		}

		model.addAttribute("cart", cart);

		return "showCart";
	}
	
	@RequestMapping(value="/removeCartItem")
	public String rvemoveCartItem(HttpServletRequest request,
						 		 HttpSession session,
								 @RequestParam Integer productId) {
		session = request.getSession(false);
		Cart cart = (Cart)session.getAttribute("cart");
		int id = Integer.parseInt(request.getParameter("productId"));
		cart.delete(id);
		
		return "redirect:/showCart";
	}
	
	@RequestMapping(value="/deleteCartItem")
	public String deleteCartItem(HttpServletRequest request,
						 		 HttpSession session,
								 @RequestParam Integer productId) {
		session = request.getSession(false);
		Cart cart = (Cart)session.getAttribute("cart");
		cart.clear();
		
		return "redirect:/showCart";
	}
	
	
	@RequestMapping(value = "/ProductPictures/{productId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, 
			@PathVariable Integer productId) {
		String filePath = "/WEB-INF/views/ProductImages/noImage.png";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ProductBean pb = orderHandleService.getProductById(productId);
		if (pb != null) {
			Blob blob = pb.getProductImage();
			filename = pb.getFileName();
			System.out.println("filename"+filename);
			System.out.println("blob"+blob);
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ShoppingController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
}
