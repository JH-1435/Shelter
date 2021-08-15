package kr.ac.kopo.shelter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.shelter.model.AnimalsVo;
import kr.ac.kopo.shelter.util.Pager;

@Repository
public class AnimalsDaoImpl implements AnimalsDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<AnimalsVo> list(Pager pager) {
		return sql.selectList("animals.list", pager);
	}

	@Override
	public void add(AnimalsVo item) {
		sql.insert("animals.add",item);
	}

	@Override
	public AnimalsVo item(int animalNum) {
		return sql.selectOne("animals.item",animalNum);
	}

	@Override
	public void update(AnimalsVo item) {
		sql.update("animals.update", item);
	}

	@Override
	public void delete(int animalNum) {
		sql.delete("animals.delete", animalNum);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("animals.total", pager);
	}

}
