package com.project.mall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MallServiceImpl implements MallService{

	@Autowired
	private MallDao dao;
	
	@Override
	public List<MallVo> mallList() {
		return dao.mallList();
	}

	@Override
	public int mallId() {
		// TODO Auto-generated method stub
		return dao.mallId();
	}

	@Override
	public void mallInsert(MallVo vo) {
		dao.mallInsert(vo);
		
	}

	@Override
	public MallVo mallOne(MallVo vo) {
		return dao.mallOne(vo);
	}

	@Override
	public void mallDelete(MallVo vo) {
		dao.mallDelete(vo);
		
	}

	@Override
	public void mallAddrUserInsert(MallAddrVo vo) {
		dao.mallAddrUserInsert(vo);

		
	}

	@Override
	public List<MallAddrVo> mallAddrUserList(MallAddrVo vo) {
		return dao.mallAddrUserList(vo);
	}

	@Override
	public MallAddrVo mallAddrUserone(MallAddrVo vo) {

		return dao.mallAddrUserone(vo);
	}

	@Override
	public void firstAddrInsert(MallAddrVo vo) {
		dao.firstAddrInsert(vo);
		
	}

	@Override
	public List<MallVo> fotoramalist() {
		return dao.fotoramalist();
	}

	@Override
	public int firstaddrCount(MallAddrVo vo) {
		
		return dao.firstaddrCount(vo);
	}

	@Override
	public void mallAddrPick(MallAddrVo vo) {
		dao.mallAddrPick(vo);
		
	}

}
