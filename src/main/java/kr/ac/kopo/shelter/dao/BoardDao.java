package kr.ac.kopo.shelter.dao;

import java.util.List;

import kr.ac.kopo.shelter.model.BoardVo;
import kr.ac.kopo.shelter.util.Pager;

public interface BoardDao {

	List<BoardVo> list(Pager pager);

	void add(BoardVo item);

	BoardVo item(int boardNum);

	void update(BoardVo item);

	void delete(int boardNum);
	
	int total(Pager pager);

	void okDate(BoardVo item);
	
	void boardReadCount(int boardNum);
}
