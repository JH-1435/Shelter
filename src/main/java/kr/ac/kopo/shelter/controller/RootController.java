package kr.ac.kopo.shelter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.shelter.model.AdminVo;
import kr.ac.kopo.shelter.model.AnimalsVo;
import kr.ac.kopo.shelter.model.UserVo;
import kr.ac.kopo.shelter.service.UserService;
import kr.ac.kopo.shelter.util.Pager;
import kr.ac.kopo.shelter.service.AdminService;
import kr.ac.kopo.shelter.service.AnimalsService;


@Controller
public class RootController {
	@Autowired
	UserService service;
	
	@Autowired
	AdminService serviceAdmin;
	
	@Autowired
	AnimalsService serviceAnimals;
	
	@GetMapping("/")
	String index(Model model, Pager pager) {
		List<AnimalsVo> animals = serviceAnimals.list(pager);
		
		model.addAttribute("animals", animals);
		
		return "index";
	}
		
	
	// @ResponseBody를 하면 뷰리졸버가 jsp를 찾지않고, 후처리를 하지않고 그대로 클라이언트에게 보내주는 지시를 함
		@ResponseBody
		// id가 null 이면 OK, 아니면 FAIL => 중복검사를 했을때 아이디가 없으면 OK, 있으면 FAIL
		@GetMapping("/confirmId")
		String confirmId(String userId) {
			if(service.item(userId) == null) {
				return "OK";
			}
				
				return "FAIL";
		}
		
		@GetMapping("/signup")
		String signup() {
			return "signup";
		}
		
		@PostMapping("/signup")
		String signup(UserVo item) {
			service.add(item);
			
			return "redirect:.";
		}
		
		@GetMapping("/login")
		String login() {
			return "login";
		}
		
		@PostMapping("/login")
		String login(UserVo item, HttpSession session) {
			if(service.login(item)) {
				session.setAttribute("user", item);
				return "redirect:.";
			}
			
			return "login";
		}
		@GetMapping("/logout")
		String logout(HttpSession session) {
			//세션을 무효화(invalidate) 함
			session.invalidate();
			
			return "redirect:.";
		}
		
		
		//Admin 관련
		
		@RequestMapping("/indexAdmin")
		String indexAdmin() {
			return "indexAdmin";
		}
		
		@GetMapping("/loginAdmin")
		String loginAdmin() {
			return "loginAdmin";
		}
		
		@PostMapping("/loginAdmin")
		String loginAdmin(AdminVo item, HttpSession session) {
			if(serviceAdmin.loginAdmin(item)) {
				session.setAttribute("admin", item);
				return "redirect:indexAdmin";
			}
			
			return "loginAdmin";
		}
		@GetMapping("/logoutAdmin")
		String logoutAdmin(HttpSession session) {
			//세션을 무효화(invalidate) 함
			session.invalidate();
			
			return "redirect:.";
		}


		//그외 페이지

		@RequestMapping("/center")
		String center() {
			return "center";
		}
		
		@RequestMapping("/information")
		String information() {
			return "information";
		}
		
		@RequestMapping("/directions")
		String directions() {
			return "directions";
		}
}