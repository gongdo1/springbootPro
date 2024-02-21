package com.project.mall;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MallDao {
	public List<MallVo> mallList();
	public int mallId();
	public void mallInsert(MallVo vo);
	public MallVo mallOne(MallVo vo);
	public void mallDelete(MallVo vo);
	public List<MallVo> fotoramalist();
	
	
	public void mallAddrUserInsert(MallAddrVo vo);
	public List<MallAddrVo> mallAddrUserList(MallAddrVo vo);
	public MallAddrVo mallAddrUserone(MallAddrVo vo);
	public void firstAddrInsert(MallAddrVo vo);
	public int firstaddrCount(MallAddrVo vo);
	public void mallAddrPick(MallAddrVo vo);
}
