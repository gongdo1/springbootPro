package com.project.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardVo> boardList(BoardVo vo) {
		return dao.boardList(vo);
	}

	@Override
	public BoardVo boardOne(BoardVo vo) {
		return dao.boardOne(vo);
	}

	@Override
	public void boardModify(BoardVo vo) {
		dao.boardModify(vo);
	}

	@Override
	public void boardDelete(BoardVo vo) {
		dao.boardDelete(vo);
	}

	@Override
	public void boardInsert(BoardVo vo) {
		dao.boardInsert(vo);
	}

	@Override
	public void views(BoardVo vo) {
		dao.views(vo);
	}

	@Override
	public int totalCount(BoardVo vo) {
		return dao.totalCount(vo);
	}

	@Override
	public List<BoardVo> indexBoardlist() {
		return dao.indexBoardlist();
	}
	
	
}
