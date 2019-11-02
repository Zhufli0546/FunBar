package tw.FunBar.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.script.ScriptContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import tw.FunBar.model.ProductBean;
import tw.FunBar.service.OrderHandleService;
import tw.FunBar.service.ShoppingService;

@Controller
public class ShoppingController {
	@Autowired
	ShoppingService shoppingService;
	
	@Autowired
	OrderHandleService orderService;

	@Autowired
	ServletContext context;

	@RequestMapping("/shoppingCart")
	public String shoppingCart(Model model) {
		List<ProductBean> show = shoppingService.getAllProducts();
		model.addAttribute("all", show);
		return "shoppingCart";
	}
	
	
	
	//後臺顯示所有商品
	@RequestMapping("/showAllProduct")
	public String showAllProduct(Model model) {
		List<ProductBean> show = shoppingService.getAllProducts();
		model.addAttribute("all", show);
		return "showAllProduct";
	}

	
	@RequestMapping("/updateProduct")
	public String getProductsById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("product", orderService.getProductById(id));
		return "redirect:/showAllProduct";
	}
	
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		ProductBean pb = new ProductBean();
		model.addAttribute("productBean", pb);
		return "addProduct";
	}
	

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("productBean") ProductBean pb, BindingResult result) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (pb.getStock() == null) {
			pb.setStock(0);
		}
		MultipartFile productCover = pb.getProductCover();
		String originalFilename = productCover.getOriginalFilename();
		System.out.println("originalFilename:" + originalFilename);
		pb.setFileName(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (productCover != null && !productCover.isEmpty()) {
			try {
				byte[] b = productCover.getBytes();
				Blob blob = new SerialBlob(b);
				pb.setProductImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		orderService.addProduct(pb);
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, pb.getProductImage() + ext);
			productCover.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}

		return "addProduct";
	}
	
	@RequestMapping(value = "/getPicture/{productId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, 
			@PathVariable Integer productId) {
		String filePath = "/images/noImage.png";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ProductBean pb = orderService.getProductById(productId);
		if (pb != null) {
			Blob blob = (Blob) pb.getProductCover();
			filename = pb.getFileName();
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
