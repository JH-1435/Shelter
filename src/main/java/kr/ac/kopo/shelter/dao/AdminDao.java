package kr.ac.kopo.shelter.dao;

import java.util.List;

import kr.ac.kopo.shelter.model.AdminVo;
import kr.ac.kopo.shelter.util.Pager;

//인터페이스를 만드는 이유는 느슨한 결합을 맞추기 위해, 공동작업시 충돌을 방지 하기 위해서 이다.
public interface AdminDao {

	List<AdminVo> list(Pager pager);

	void add(AdminVo item);

	AdminVo item(String adminId);

	void update(AdminVo item);

	void delete(String adminId);

	AdminVo loginAdmin(AdminVo item);

	int total(Pager pager);

}
