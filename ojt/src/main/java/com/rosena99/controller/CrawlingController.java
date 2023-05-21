package com.rosena99.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rosena99.service.CrawlingService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/crawling")
public class CrawlingController {
	
	@Setter(onMethod_ = @Autowired)
	private CrawlingService service;
	
	@GetMapping("/puradak")
	public void puradakName() {
		
		service.truncate();
		
		String url[] = {
				"https://puradakchicken.com/menu/product.asp?page=1&sermode=&sermode2=&serdiv=",
				"https://puradakchicken.com/menu/product.asp?page=2&sermode=&sermode2=&serdiv=",
				"https://puradakchicken.com/menu/product.asp?page=3&sermode=&sermode2=&serdiv=",
				"https://puradakchicken.com/menu/product.asp?page=4&sermode=&sermode2=&serdiv=",
				"https://puradakchicken.com/menu/product.asp?page=5&sermode=&sermode2=&serdiv=",
				"https://puradakchicken.com/menu/product.asp?page=6&sermode=&sermode2=&serdiv=",
				"https://puradakchicken.com/menu/product.asp?page=7&sermode=&sermode2=&serdiv=",
				"https://puradakchicken.com/menu/product.asp?page=8&sermode=&sermode2=&serdiv=",
				"https://puradakchicken.com/menu/product.asp?page=9&sermode=&sermode2=&serdiv=",
				
					};
		
		for(int i = 0 ; i < url.length ; i++) {
			log.info("puradkaName url = " + url[i]);
			service.insert(url[i]);
		}
	}
	

		@GetMapping("/news")
		public void news() {
			
			service.truncate();
			
			String url[] = {
					
						"https://www.yna.co.kr/"					
			};
			
			for(int i = 0 ; i < url.length ; i++) {
				log.info("news url = " + url[i]);
				service.insertNews(url[i]);
			}
		
	}
		
	
}

