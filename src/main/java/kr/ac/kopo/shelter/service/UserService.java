package kr.ac.kopo.shelter.service;

import java.util.List;

import kr.ac.kopo.shelter.model.UserVo;
import kr.ac.kopo.shelter.util.Pager;

//인터페이스를 만드는 이유는 느슨한 결합을 맞추기 위해, 공동작업시 충돌을 방지 하기 위해서 이다.
public interface UserService {

	List<UserVo> list(Pager pager);

	void add(UserVo item);

	UserVo item(String userId);

	void update(UserVo item);

	void delete(String userId);

	boolean login(UserVo item);

}