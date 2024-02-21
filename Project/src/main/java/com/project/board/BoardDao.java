package com.project.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDao {
	public List<BoardVo> boardList(BoardVo vo);
	public BoardVo boardOne(BoardVo vo);
	public void boardModify(BoardVo vo);
	public void boardDelete(BoardVo vo);
	public void boardInsert(BoardVo vo);
	public void views(BoardVo vo);
	public int totalCount(BoardVo vo);
	public List<BoardVo> indexBoardlist();
}
