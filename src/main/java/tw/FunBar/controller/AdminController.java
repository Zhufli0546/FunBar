package tw.FunBar.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import tw.FunBar.service.RoomService;

@Controller
public class AdminController {
 
 
 @Autowired
 RoomService roomService;
  
 @RequestMapping("/admin")
 public String admin(Model model) {
  
  return "admin";
 }
}