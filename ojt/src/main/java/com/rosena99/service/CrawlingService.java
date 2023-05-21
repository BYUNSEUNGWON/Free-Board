package com.rosena99.service;

public interface CrawlingService {

	public void truncate();

	public void insert(String url);

	public void insertNews(String url);


}
