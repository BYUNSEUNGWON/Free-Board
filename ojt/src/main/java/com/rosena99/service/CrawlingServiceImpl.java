package com.rosena99.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rosena99.domain.MenuVO;
import com.rosena99.domain.NewsVO;
import com.rosena99.mapper.CrawlingMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CrawlingServiceImpl implements CrawlingService{
	
	@Setter(onMethod_ = @Autowired)
	private CrawlingMapper mapper;
	
	@Override
	public void truncate() {
		mapper.truncate();
	}
	
	
	@Override
	public void insert(String url) {
	
		Document doc = null;
		List<MenuVO> list = new ArrayList<MenuVO>();
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Elements elements = doc.select("ul.list");
		
		Iterator<Element> element = elements.select("p.title").iterator();
		
		while(element.hasNext()) {
			MenuVO menu = new MenuVO();
			String name = element.next().text();
			
			log.info("Menu name = " + name);
			System.out.println("Menu name = " + name);
			menu.setName(name);
			menu.setBrand(100);
			list.add(menu);
		}
		mapper.insertName(list);
	}


	@Override
	public void insertNews(String url) {
		
		Document doc = null;
		List<NewsVO> list = new ArrayList<NewsVO>();

		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Elements elements = doc.select("ul.list");
		Iterator<Element> element = elements.select(".tit-news").iterator();
		
		
		while(element.hasNext()) {
			NewsVO news = new NewsVO();
			String name = element.next().text();
			
			System.out.println("News name = " + name);
			
			news.setTitle(name);
			list.add(news);
		}
		
		
		mapper.insertNews(list);		
	}

	

	

}
