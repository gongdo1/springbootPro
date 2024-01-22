package com.project.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardVo> boardList() {
		// TODO Auto-generated method stub
		return dao.boardList();
	}

	@Override
	public BoardVo boardOne(BoardVo vo) {
		// TODO Auto-generated method stub
		return dao.boardOne(vo);
	}
	
	
}
