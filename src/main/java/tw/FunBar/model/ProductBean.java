package tw.FunBar.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Products")
public class ProductBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer productId ;
	private String productNo ;
	private String productName;
	private String productDetail ;
	private String productImage;
	private String fileName;
	private String category;
	private Double unitPrice;
	@Transient
	private String priceStr;
	private Double discount ;
	@Transient
	private String discountStr;
	private Integer stock;
	private String payment;
	
	@Transient
	private MultipartFile productCover;
	public MultipartFile getProductCover() {
		return productCover;
	}
	public void setProductCover(MultipartFile productCover) {
		this.productCover = productCover;
	}
	
	public ProductBean(Integer productId,String productNo, String productName,
			String productDetail, String productImage, String fileName, String category,
			double unitPrice, double discount, Integer stock, String payment) {
			this.productId = productId;
			this.productNo = productNo;
			this.productName = productName;
			this.productDetail = productDetail;
			this.productImage = productImage;
			this.fileName = fileName;
			this.category = category;
			this.unitPrice = unitPrice;
			this.discount = discount;
			this.stock = stock;
			this.payment = payment;
	}
	
	public ProductBean() {
		
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
		if (priceStr == null) {
			priceStr = String.valueOf(unitPrice);
		}
	}
	public String getPriceStr() {
		return priceStr;
	}
	public void setPriceStr(String priceStr) {
		this.priceStr = priceStr;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
		if (discount == null) {
			this.discount = 1.0;
			discountStr = "";
			return;
		}
		this.discount = discount;
		if(discount == 1) {
			discountStr = "";
		}else {
			int dsc = (int)(discount * 100);
			if(dsc % 10 ==0) {
				discountStr = (dsc /10) + "折";			
			}else {
				discountStr = "" + dsc + "折";
			}
		}
		
	}
	public String getDiscountStr() {
		return discountStr;
	}
	public void setDiscountStr(String discountStr) {
		this.discountStr = discountStr;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	

}

