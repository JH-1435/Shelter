package kr.ac.kopo.shelter.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.shelter.model.BoardVo;
import kr.ac.kopo.shelter.util.Pager;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<BoardVo> list(Pager pager) {
		return sql.selectList("board.list", pager);
	}

	@Override
	public void add(BoardVo item) {
		sql.insert("board.add", item);
	}

	@Override
	public BoardVo item(int boardNum) {
		return sql.selectOne("board.item", boardNum);
	}
	
	@Override
	public void update(BoardVo item) {
		sql.update("board.update", item);
		
	}
		
	@Override
	public void delete(int boardNum) {
		sql.delete("board.delete", boardNum);
	}
	
	@Override
	public void okDate(BoardVo item) {
		sql.update("board.okDate", item);
	}
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("board.total", pager);
	}
	
	public void boardReadCount(int boardNum) {
		sql.update("board.boardReadCount", boardNum);
	}


	
}
