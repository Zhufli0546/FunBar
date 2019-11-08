package tw.FunBar.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import tw.FunBar.model.Activity;
import tw.FunBar.model.Room;
import tw.FunBar.service.RoomService;

@Controller
public class BookingRoomController {
	
	@Autowired
	RoomService roomService;
	
	
	@RequestMapping("/booking_room")
	public String bookingRoom() {
		return "booking_room";
	}
	
	
	@RequestMapping("/chooseRoom")
	public String chooseRoom(@RequestParam String date,@RequestParam Integer stay,Integer rooms, Model model) throws ParseException {
		
		Set<Room> okroom = roomService.pullRoom(date, stay,rooms);
		
		model.addAttribute("okroom", okroom);
		model.addAttribute("date", date);
		model.addAttribute("stay", stay);
		model.addAttribute("rooms", rooms);
		
		return "chooseRoom";
	}
	
	
	@RequestMapping("/room_type")
	public String roomtype(Model model) {
		ArrayList<Room> room = roomService.allRoom();
		model.addAttribute("room",room);
		return "room_type";
	}
	
	@RequestMapping("/add_form")
	public String addform(Model model) {
		model.addAttribute("room",new Room());
		return "add_form";
	}
	
	@RequestMapping("/add_room")
	public String addRoom(@ModelAttribute("room") Room room) {
		roomService.addRoom(room);
		
		return "index";
	}
	
	@RequestMapping("/room/{room_id}")
	public ResponseEntity<byte[]> getImage(HttpServletResponse resp, @PathVariable Integer room_id){
		
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		Room room = roomService.getImage(room_id);
		if (room != null) {
			Blob blob = room.getRoom_image();
			filename = room.getRoom_image_filename();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media,HttpStatus.OK);
		return responseEntity;
	}
	
//	@RequestMapping("/add_order")
//	public String addOrder(@RequestParam String date,@RequestParam Integer stay,@RequestParam Integer rooms,Model model) {
//		
//		model.addAttribute("date",date);
//		model.addAttribute("stay",stay);
//		model.addAttribute("rooms", rooms);
//		
//		return "add_order";
//	}
	
	@RequestMapping("/confirm_order")
	public String confirmOrder(@RequestParam Integer room_id,@RequestParam String date,@RequestParam Integer stay,@RequestParam Integer rooms,Model model) {
		
		Room room = roomService.getRoomById(room_id);
		
		model.addAttribute("room",room);
		model.addAttribute("date",date);
		model.addAttribute("stay",stay);
		model.addAttribute("rooms", rooms);
		
		return "confirm_order";
	}
	
	@RequestMapping(value = "/pay")
	public String payByEcPay(@RequestParam Integer room_id, Model model,
			HttpServletRequest req, RedirectAttributes redirect) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Room r = roomService.getRoomById(room_id);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		Map<String, String> errMsg = new HashMap<>();
		model.addAttribute("errMsg", errMsg);
		
		String base = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
				+ req.getContextPath(); // http:localhost:XXXX/eeit108Theater
		// EcPay Begin
		// EcPay對各項method都有簡單註解說明，可以將滑鼠移動到方法上查看
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime(); // 指定付款方式為信用卡一次付清
		
		int sss=((int)((Math.random()*9+1)*12345));
		
		String str = String.valueOf(sss);
		
		obj.setMerchantTradeNo(str); // 設定訂單編號
		obj.setMerchantTradeDate(sdf.format(ts)); // 設定交易日期
		obj.setTotalAmount(String.valueOf(r.getRoom_price())); // 設定總付款金額
		obj.setTradeDesc("716 Theater Order");
		obj.setItemName(r.getRoom_type()); // 設定顯示在EcPay頁面的購物清單
		obj.setReturnURL("http:localhost:8080/FunBar/");// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// 可以在交易結束後觀察底下對應requestMapping的method -- receive
		// 的system.err.println並不會出現在console中，藉此得知該方法並沒有被呼叫 -> 沒收到請求
		obj.setOrderResultURL("http:localhost:8080/FunBar/"); // EcPay會在付款結束後，將USER redirect至此，並附帶交易結果相關資訊
		obj.setNeedExtraPaidInfo("N"); // Y/N = True/False
		obj.setRedeem("N"); // 紅利 Y/N = True/False
		String form = all.aioCheckOut(obj, null); // null for no invoice
		// all.aioCheckOut會根據前面設定好的參數產生一個html表格的字串，
		// 裡面的各種input都已經設定好了，並且會自動submit，
		// 只要將這個字串加為attribute並且顯示在回傳頁面上，便會自動執行，並跳轉到EcPay付款頁面。
		// EcPay End

		System.out.println("form =\n" + form);
		model.addAttribute("ecpayForm", form);
		return "ecpay";
	}
	
	
	@RequestMapping("/room_info/{id}")
	public String roomInfo(@PathVariable Integer id,Model model) {
		System.out.println("id = " + id);
		Room room = roomService.getRoomById(id);
		model.addAttribute("room",room);
		return "room_info";
	}

}
