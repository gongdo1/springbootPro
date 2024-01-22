package com.project.board;

import java.util.List;

public interface BoardService {
	public List<BoardVo> boardList();
	public BoardVo boardOne(BoardVo vo);
}
