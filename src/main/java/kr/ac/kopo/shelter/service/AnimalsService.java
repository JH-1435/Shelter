package kr.ac.kopo.shelter.service;

import java.util.List;

import kr.ac.kopo.shelter.model.AnimalsVo;
import kr.ac.kopo.shelter.util.Pager;

public interface AnimalsService {

	List<AnimalsVo> list(Pager pager);

	void add(AnimalsVo item);

	AnimalsVo item(int animalNum);

	void update(AnimalsVo item);

	void delete(int animalNum);

	void init();

	void dummy();

}
