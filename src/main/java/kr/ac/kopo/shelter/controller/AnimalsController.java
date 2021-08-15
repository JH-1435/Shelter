package kr.ac.kopo.shelter.controller;

import java.io.File;
import java.io.IOException;import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.shelter.model.AnimalsVo;
import kr.ac.kopo.shelter.model.UserVo;
import kr.ac.kopo.shelter.service.AnimalsService;
import kr.ac.kopo.shelter.service.BoardService;
import kr.ac.kopo.shelter.util.Pager;


@Controller
@RequestMapping("/animals")
public class AnimalsController {
	final String path = "animals/";
	final String uploadPath = "//d:/ShelterUpload/";
	
	@Autowired
	AnimalsService service;
	
	@Autowired
	BoardService serviceBoard;
			
	// --------------Admin 관련------------ //
	
	@GetMapping("/{animalNum}/animalView")
	String view(@PathVariable int animalNum, Model model) {
		AnimalsVo item = service.item(animalNum);
		
		model.addAttribute("item", item);
		
		return path + "animalView";
	}

	// AnimalsServiceImpl 에서 dummy 와 init 에 대한 실제로 처리하는 역할을함
		@GetMapping("/dummy")
		String dummy() {
				service.dummy();
			return "redirect:list";
		}
		
		@GetMapping("/init")
		String init() {
			service.init();
			return "redirect:list";
		}
	
	//Date 형식을 스프링에게 어떤값으로 변환될지 알려줌
	@InitBinder
	private void dataBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		
		binder.registerCustomEditor(Date.class, editor);
	}
	
	/* order(주문)을 클릭하면,@RequestParam 로 submit한 name을 불러옴
	  UserVo에 있는 데이터를 user라는 세션에 값을 저장함, Map을 content에 주고 "content"라는 변수 로
	   값이 세션에 저장 content의 값이 없으면, content를 초기화 시킴. 여태 모든 값을 service에 전달하여 처리 한후
	   content(세션 값)를 다시 초기화 시킴	*/
	@GetMapping("/order")
	String order(@RequestParam String boardTitle,@RequestParam String boardContent,
			HttpSession session) {
		
		UserVo user = (UserVo) session.getAttribute("user");
		
		//동물 처리
		@SuppressWarnings("unchecked")
		Map<Integer, AnimalsVo> content = (Map<Integer, AnimalsVo>) session.getAttribute("content");
		if(content == null || content.isEmpty()) {
			return "redirect:/";
		}
		
		serviceBoard.order(user.getUserId(), boardTitle, boardContent, content);
			
		content.clear();
		
		return "redirect:/board/list";
	}
	
	//animal 선택 하여 content페이지로 오면 선택했던 동물정보를  Map 가상인터페이스 에 담음 => HashMap이 실행하여 동작
	// 인터페이스 와 클래스(Impl)같은 관계
	// Map은 inteferface로서 key, value 조합을 사용하는 데이터형의 껍데기
	// HashMap은 Hash key 기반의 map을 이미 구현한 클래스
		@GetMapping("/content")
		String content(int animalNum, Model model, HttpSession session) {
			if(animalNum != 0) {
				AnimalsVo item = service.item(animalNum);
				
				@SuppressWarnings("unchecked")
				Map<Integer, AnimalsVo> content = (Map<Integer, AnimalsVo>) session.getAttribute("content");
				if(content == null) {
					content = new HashMap<Integer, AnimalsVo>();
					
					session.setAttribute("content", content);
				}
				
				content.put(animalNum, item);
			}	
			
			return path + "content";
		}
		
		//content 라는 세션데이터만 삭제
		@GetMapping("/contentInit")
		String content(HttpSession session) {
			
			session.removeAttribute("content");
			
			return "redirect:/";
		}
		
					
	//Model에 list를 담아두면 jsp페이지에 전달할 수 있다.
		@GetMapping("/list")
		String list(Pager pager, Model model) {
			List<AnimalsVo> list = service.list(pager);
			
			model.addAttribute("list", list);
			
			return path + "list";
			
		}
		
		@GetMapping("/add")
		String add() {
			return path + "add";
		}
		
		// upload 처리, 사용자가 보내온 form에 있는 값을 아무런 값이 안들어있는 new AnimalsVo해서  만들어줌
		//그 객체 하나하나 를 set을 이용해서 넣어주면, MF가 작동하면서 try가 작동하면서 하나하나 값을 넣어줌
		//만약 도서번호(animalNum)를 입력하지 않거나 잘못입력(String을 입력해야하는데 숫자(int)를 입력한 경우
		//스프링이 값을 넣지 못하므로 400에러 가 뜸
		//add.jsp에있는 name == uploadFile을 가져옴
		@PostMapping("/add")
		String add(AnimalsVo item) {

			MultipartFile file = item.getUploadFile();
			
				try {
					if(!file.isEmpty()) {
						
						String filename = file.getOriginalFilename();
						
					file.transferTo(new File(uploadPath + filename) ); //파일 복사
					
					item.setAnimalImg(filename); //animalImg에 파일네임 저장
					}
					
					service.add(item); //add를 호출하여 item 저장
				} catch (IllegalStateException e) {
					
					e.printStackTrace();
					
				} catch (IOException e) {
					
					e.printStackTrace();
				}
				
				return "redirect:list";		
				
			}

		@GetMapping("/{animalNum}/update")
		String update(@PathVariable int animalNum, Model model) {
			AnimalsVo item = service.item(animalNum);
			
			model.addAttribute("item", item);
			
			return path + "update";
		}
		
		@PostMapping("/{animalNum}/update")
		String update(@PathVariable int animalNum, AnimalsVo item) {
			//첨부파일을 첨부했으면 표지를 바꾸고, 첨부하지 않았으면 안바꿈, 고로 기존에 표지가 있던없던 바꿀생각이 없음
			
			MultipartFile file = item.getUploadFile(); //MultipartFile을 item으로 읽어옴
				
				try {
					if(!file.isEmpty()) {
						String filename = file.getOriginalFilename();
						
						
					file.transferTo(new File(uploadPath + filename));
					
					if(item.getAnimalImg() != null) {
						File animalImg = new File(uploadPath + item.getAnimalImg()); //animalImg파일을 읽어옴(ShelterUpload폴더에있는 파일 이름)
						animalImg.delete();
					}
					
					item.setAnimalImg(filename);
					
				}
					
					item.setAnimalNum(animalNum);
					
					service.update(item);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				return "redirect:../list";
			
		}
		
		@GetMapping("/{animalNum}/delete")
		String delete(@PathVariable int animalNum) {
			service.delete(animalNum);
			
			return "redirect:../list";
		}
		
		// --------------User 관련------------ //
		
	}
