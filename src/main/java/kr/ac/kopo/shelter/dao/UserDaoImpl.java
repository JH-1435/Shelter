package kr.ac.kopo.shelter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.shelter.model.UserVo;
import kr.ac.kopo.shelter.util.Pager;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<UserVo> list(Pager pager) {
		return sql.selectList("user.list", pager);
	}

	@Override
	public void add(UserVo item) {
		sql.insert("user.add", item);
	}

	@Override
	public void update(UserVo item) {
		sql.update("user.update", item);
	}

	@Override
	public void delete(String userId) {
		sql.delete("user.delete", userId);
	}

	@Override
	public UserVo login(UserVo item) {
		return sql.selectOne("user.login", item);
	}

	@Override
	public UserVo item(String userId) {
		return sql.selectOne("user.item", userId);
	}
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("user.total", pager);
	}
	
}
