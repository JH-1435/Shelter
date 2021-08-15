package kr.ac.kopo.shelter.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.shelter.model.AdminVo;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	//리팩터링 => 기존의 코드를 불러와서 바꾸는것
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		AdminVo admin = (AdminVo) session.getAttribute("admin");
		
		if(admin == null)
			response.sendRedirect("/loginAdmin");
		else if(!"admin".equals(admin.getAdminId())) //관리자(admin)가 아니면(!) loginAdmin으로 되돌아감
			response.sendRedirect("/loginAdmin");
		else
			return true;
		
		return false;
	}

}
