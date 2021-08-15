package kr.ac.kopo.shelter.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.shelter.dao.BoardDao;
import kr.ac.kopo.shelter.dao.OrdersDao;
import kr.ac.kopo.shelter.model.AnimalsVo;
import kr.ac.kopo.shelter.model.BoardVo;
import kr.ac.kopo.shelter.model.OrdersVo;
import kr.ac.kopo.shelter.util.Pager;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao dao;
	
	@Autowired
	OrdersDao daoOrders;
	
	@Override
	public List<BoardVo> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(BoardVo item) {
		dao.add(item);
	}

	@Override
	public BoardVo item(int boardNum) {
		return dao.item(boardNum);
	}

	@Override
	public void update(BoardVo item) {
		dao.update(item);
	}

	@Override
	public void delete(int boardNum) {
		dao.delete(boardNum);
	}
	
	@Override
	public void okDate(BoardVo item) {
		dao.okDate(item);
		
	}
	
	//조회수 증가
	@Override
	public void boardReadCount(int boardNum) {
		dao.boardReadCount(boardNum);
	}

	@Override
	@Transactional
	//신청게시판에 값 넣기(item), 게시판 내용 호출(orders) 
	public void order(String userId, String boardTitle, String boardContent, 
			Map<Integer, AnimalsVo> content) {
		BoardVo item = new BoardVo();
		item.setUserId(userId);

		item.setBoardTitle(boardTitle);
		item.setBoardContent(boardContent);
		
		dao.add(item);
		
		//keySet()은 Map이 담겨있는 cotent의 key값만 사용
		for(int animalNum : content.keySet()) {			
			OrdersVo orders = new OrdersVo();
			
			orders.setBoardNum(item.getBoardNum());
			orders.setAnimalNum(animalNum);
			
			daoOrders.add(orders);
		}
	}	
	
	@Override
	public void init() {
		Pager pager = new Pager();
		pager.setPage(1);
		
		while(dao.total(pager) > 0) {
			List<BoardVo> list = dao.list(pager);
			
			for(BoardVo item : list)
				dao.delete(item.getBoardNum());
			
		}
	}
}
