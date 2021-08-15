package kr.ac.kopo.shelter.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.shelter.model.UserVo;
import kr.ac.kopo.shelter.service.UserService;
import kr.ac.kopo.shelter.util.Pager;


@Controller
@RequestMapping("/user")
public class UserController {
	final String path = "user/";
	
	@Autowired
	UserService service;
	
	//Model에 list를 담아두면 jsp페이지에 전달할 수 있다.
	@GetMapping("/list")
	String list(Pager pager, Model model) {
		List<UserVo> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
		
	}
	
	@GetMapping("/add")
	String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	String add(UserVo item) {
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/{userId}/update")
	String update(@PathVariable String userId, Model model) {
		UserVo item = service.item(userId);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/{userId}/update")
	String update(@PathVariable String userId, UserVo item) {
		item.setUserId(userId);
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/{userId}/delete")
	String delete(@PathVariable String userId) {
		service.delete(userId);
		
		return "redirect:../list";
	}
}

