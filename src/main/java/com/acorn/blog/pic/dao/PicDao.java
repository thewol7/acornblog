package com.acorn.blog.pic.dao;

import java.util.List;

import com.acorn.blog.pic.dto.PicDto;

public interface PicDao {
	public void insertPics(PicDto dto);
	public List<PicDto> getList(PicDto dto);
	public PicDto getPicdetail(PicDto dto);
	public void increaseViewCount(int cont_id);
	public void deletePics(int cont_id);
	public void updatePics(PicDto dto);
	public int getCount();
}
