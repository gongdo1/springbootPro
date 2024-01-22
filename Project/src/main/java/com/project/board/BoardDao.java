package com.project.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDao {
	public List<BoardVo> boardList();
	public BoardVo boardOne(BoardVo vo);
}
