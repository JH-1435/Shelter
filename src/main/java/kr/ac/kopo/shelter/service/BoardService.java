package kr.ac.kopo.shelter.service;

import java.util.List;

import java.util.Map;

import kr.ac.kopo.shelter.model.AnimalsVo;
import kr.ac.kopo.shelter.model.BoardVo;
import kr.ac.kopo.shelter.util.Pager;

public interface BoardService {

	List<BoardVo> list(Pager pager);

	void add(BoardVo item);

	BoardVo item(int boardNum);

	void update(BoardVo item);

	void delete(int boardNum);

	void init();
	
	void order(String userId, String boardTitle, String boardContent, Map<Integer, AnimalsVo> content);

	void okDate(BoardVo item);
	
	void boardReadCount(int boardNum);
	
}
