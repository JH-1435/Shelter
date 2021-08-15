package kr.ac.kopo.shelter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.shelter.model.AdminVo;
import kr.ac.kopo.shelter.service.AdminService;
import kr.ac.kopo.shelter.util.Pager;

@Controller
@RequestMapping("/admin")
public class AdminController {
	final String path = "admin/";
	
	@Autowired
	AdminService service;
		
	//Model에 list를 담아두면 jsp페이지에 전달할 수 있다.
	@GetMapping("/list")
	String list(Pager pager, Model model) {
		List<AdminVo> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
		
	}
	
	@GetMapping("/add")
	String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	String add(AdminVo item) {
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/{adminId}/update")
	String update(@PathVariable String adminId, Model model) {
		AdminVo item = service.item(adminId);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/{adminId}/update")
	String update(@PathVariable String adminId, AdminVo item) {
		item.setAdminId(adminId);
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/{adminId}/delete")
	String delete(@PathVariable String adminId) {
		service.delete(adminId);
		
		return "redirect:../list";
	}
}

