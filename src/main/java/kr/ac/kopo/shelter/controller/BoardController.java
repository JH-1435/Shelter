package kr.ac.kopo.shelter.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.shelter.model.BoardVo;
import kr.ac.kopo.shelter.model.UserVo;
import kr.ac.kopo.shelter.service.BoardService;
import kr.ac.kopo.shelter.util.Pager;

@Controller
@RequestMapping("/board")
public class BoardController {
	final String path = "board/";
	
	@Autowired
	BoardService service;
	
	
	//Date 형식을 스프링에게 어떤값으로 변환될지 알려줌
		@InitBinder
		private void dataBinder(WebDataBinder binder) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
			
			binder.registerCustomEditor(Date.class, editor);
		}
						
		@GetMapping("/init")
		String init() {
			service.init();
			return "redirect:list";
		}
	
	// view와 조회수
	@GetMapping("/{boardNum}/view")
	String view(@PathVariable int boardNum, Model model) {
		BoardVo item = service.item(boardNum);
		
		model.addAttribute("item", item);
		
		service.boardReadCount(boardNum);
		
		return path + "view";
	}

	//Model에 list를 담아두면 jsp페이지에 전달할 수 있다.
		@GetMapping("/list")
		String list(Pager pager, Model model) {
			List<BoardVo> list = service.list(pager);
			
			model.addAttribute("list", list);

			return path + "list";
			
		}
		
		@GetMapping("/add")
		String add() {
			
			return path + "add";
		}
		
		/* index에서 세션으로 가져왔으므로, session으로 형변환을 시켜서 내가 갖고오고싶은 것들(userId와 userName)에 
		 	세션에서 get해서(가져와서) item에 넣어줌 , service.add(item) 에서 형변환시킨 userId와 userName도 같이 item으로 들어감
		 */
		@PostMapping("/add")
		String add(BoardVo item, HttpSession session) {
			UserVo user = (UserVo) session.getAttribute("user");
			
			item.setUserId(user.getUserId());
			item.setUserName(user.getUserName());
			
			service.add(item);
			
			return "redirect:list";
		}
				
		@GetMapping("/{boardNum}/update")
		String update(@PathVariable int boardNum, Model model) {
			BoardVo item = service.item(boardNum);
			
			model.addAttribute("item", item);
			
			return path + "update";
		}
		
		@PostMapping("/{boardNum}/update")
		String update(@PathVariable int boardNum, BoardVo item) {
			item.setBoardNum(boardNum);
			
			service.update(item);
			
			return "redirect:../list";
		}
		
		@GetMapping("/{boardNum}/delete")
		String delete(@PathVariable int boardNum) {
			service.delete(boardNum);
			
			return "redirect:../list";
		}
		
		//입양예정일
		@GetMapping("/{boardNum}/okDate")
		String okDate(@PathVariable int boardNum, Model model) {
			BoardVo item = service.item(boardNum);
			
			model.addAttribute("item", item);
			
			return path + "okDate";
		}
		
		@PostMapping("/{boardNum}/okDate")
		String okDate(@PathVariable int boardNum, BoardVo item) {
			item.setBoardNum(boardNum);
			
			service.okDate(item);
			
			return "redirect:../list";
		}
	}
