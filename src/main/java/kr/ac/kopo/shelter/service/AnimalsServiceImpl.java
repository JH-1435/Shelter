package kr.ac.kopo.shelter.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.shelter.dao.AnimalsDao;
import kr.ac.kopo.shelter.model.AnimalsVo;
import kr.ac.kopo.shelter.util.Pager;

@Service
public class AnimalsServiceImpl implements AnimalsService {
	
	@Autowired
	AnimalsDao dao;
	
	@Override
	public List<AnimalsVo> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);

		return dao.list(pager);
	}

	@Override
	public void add(AnimalsVo item) {
		dao.add(item);
	}

	@Override
	public AnimalsVo item(int animalNum) {
		return dao.item(animalNum);
	}

	@Override
	public void update(AnimalsVo item) {
		dao.update(item);
	}

	@Override
	public void delete(int animalNum) {
		dao.delete(animalNum);
	}

	@Override
	public void dummy() {
			AnimalsVo item = new AnimalsVo();
			for(int index=1; index < 100; index++) {
				
				item.setAnimalName("품종" + index);
				item.setAnimalAge("나이" + index + "개월");
				item.setAnimalState("상태" + index);
				item.setAnimalSex("성별" + index);
				item.setAnimalLocation("발견장소" + index);
				item.setAnimalTitle("종류" + index);
				item.setAnimalImg("더미 텍스트");
				
				dao.add(item);
			}
	}

	@Override
	public void init() {
		Pager pager = new Pager();
		pager.setPage(1);
		
		while(dao.total(pager) > 0) {
			List<AnimalsVo> list = dao.list(pager);
			
			for(AnimalsVo item : list)
				dao.delete(item.getAnimalNum());
			
		}
	}


}
