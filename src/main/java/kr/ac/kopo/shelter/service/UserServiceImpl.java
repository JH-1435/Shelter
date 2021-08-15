package kr.ac.kopo.shelter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.shelter.dao.UserDao;
import kr.ac.kopo.shelter.model.UserVo;
import kr.ac.kopo.shelter.util.Pager;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
		
	@Override
	public List<UserVo> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(UserVo item) {
		dao.add(item);
	}

	@Override
	public UserVo item(String userId) {
		return dao.item(userId);
	}

	@Override
	public void update(UserVo item) {
		dao.update(item);
	}

	@Override
	public void delete(String userId) {
		dao.delete(userId);
	}

	@Override
	public boolean login(UserVo item) {
		UserVo user = dao.login(item);
		if(user != null) {
			
			item.setUserPw(null);
			item.setUserName(user.getUserName() );
			item.setUserAddress(user.getUserAddress() );
			item.setUserTel(user.getUserTel());
			
			return true;
		}
		
		return false;
	}
}