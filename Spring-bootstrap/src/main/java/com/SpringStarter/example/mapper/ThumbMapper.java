package com.SpringStarter.example.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.SpringStarter.example.Domain.Thumbs_up;

@Mapper
public interface ThumbMapper {
	public void createthumb(Thumbs_up thumbs_up);
	public boolean isthumb(Thumbs_up thumbs_up);
	public void deletethumb(Thumbs_up thumbs_up);
	public void deleteboard(int idboard);
}
