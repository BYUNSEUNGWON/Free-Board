package com.rosena99.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.rosena99.domain.BoardAttachVO;
import com.rosena99.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class FileCheckTask {

	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	private String getFolerYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
	
	@Scheduled(cron="* * 4 * * *")
	public void checkFiles() throws Exception {
		log.info("File Check task run......");
		System.out.println("File Check task run......");
		
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();
		
		List<Path> fileListPaths = fileList.stream()
				.map(vo->Paths.get("d:/upload", vo.getUploadPath(), vo.getUuid() + "_" +vo.getFileName()))
				.collect(Collectors.toList());
		

		fileList.stream().filter(vo -> vo.isFileType() == true)
				.map(vo->Paths.get("d:/upload", vo.getUploadPath(), "thum_" + vo.getUuid() + "_" +vo.getFileName()))
				.forEach(p -> fileListPaths.add(p));
		
		fileListPaths.forEach(p -> log.warn(p));
		
		File targetDir = Paths.get("d:/upload", getFolerYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		for(File file : removeFiles) {
			file.delete();
		}
	}
}

