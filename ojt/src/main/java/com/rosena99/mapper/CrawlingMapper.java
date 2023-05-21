package com.rosena99.mapper;

import java.util.List;

import com.rosena99.domain.MenuVO;
import com.rosena99.domain.NewsVO;

public interface CrawlingMapper {
	
	public void truncate();

	public void insertName(List<MenuVO> list);

	public void insertNews(List<NewsVO> list);


}
