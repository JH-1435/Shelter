package kr.ac.kopo.shelter.dao;

import java.util.List;

import kr.ac.kopo.shelter.model.AnimalsVo;
import kr.ac.kopo.shelter.util.Pager;

public interface AnimalsDao {

	List<AnimalsVo> list(Pager pager);

	void add(AnimalsVo item);

	AnimalsVo item(int animalNum);

	void update(AnimalsVo item);

	void delete(int animalNum);

	int total(Pager pager);

}
