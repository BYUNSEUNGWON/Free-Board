package com.rosena99.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rosena99.domain.AttachFileDTO;
import com.rosena99.domain.MultipartFileVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFileVO vo, Model model) {
		
		String uploadFolder = "d:/upload";
		
		System.out.println("-----------------"+vo.getImg1().getOriginalFilename());
		System.out.println("이력서 :" + vo.getImg1().getOriginalFilename());
		System.out.println("Upload File Size:" + vo.getImg1().getSize());
		
		File saveFile = new File(uploadFolder, vo.getImg1().getOriginalFilename());
		
		try {
			vo.getImg1().transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("-----------------");
		System.out.println("자기소개서 :" + vo.getImg2().getOriginalFilename());
		System.out.println("Upload File Size:" + vo.getImg2().getSize());
		
		saveFile = new File(uploadFolder, vo.getImg2().getOriginalFilename());
		
		try {
			vo.getImg2().transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	@PostMapping("/uploadFormAction")
//	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
//		
//		String uploadFolder = "d:/upload";
//		
//		for(MultipartFile multipartFile : uploadFile) {
//			System.out.println("-----------------");
//			System.out.println("Upload File Name:" + multipartFile.getOriginalFilename());
//			System.out.println("Upload File Size:" + multipartFile.getSize());
//			
//			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
//			
//			try {
//				multipartFile.transferTo(saveFile);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile [] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		String uploadFolder = "d:/upload";
		
		String uploadFolderPath = getFolder();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+uploadFileName;

			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			/* 썸네일 파일만들기 */
			if(checkImageType(saveFile)) {
				
				attachDTO.setImage(true);
				
				try {

//					Thumbnails.of(saveFile)
//			        .size(100, 100)
//			        .toFile(new File(uploadPath, "thum_"+uploadFileName));
					
					FileOutputStream thumbnail 
						= new FileOutputStream(new File(uploadPath, "thum_"+uploadFileName));
								        
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100,100);
					thumbnail.close();
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			/* 썸네일 파일만들기 끝 */

			list.add(attachDTO);
			
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String str = sdf.format(new Date());
		
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType( File file) {
		
		try {
			String contextType = Files.probeContentType(file.toPath());
			return contextType.startsWith("image");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		File file = new File("d:/upload/" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		
		try {
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), 
											header, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GetMapping("/download")
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, 
									String fileName){
		
		FileSystemResource resource = new FileSystemResource("d:/upload/" + fileName);
		//d:/upload/파일명 파일이 없으면
		if(resource.exists() == false) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		
		
		String resourceName = resource.getFilename();
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			
			if(userAgent.contains("Edge")) {
				downloadName = URLEncoder.encode(resourceName, "UTF-8");
			} else {
				downloadName = new String(resourceName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			headers.add("Content-Type", "application/octet-stream");
			headers.add("Content-Disposition", "attachment; filename="+downloadName);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		try {
			File file = new File("d:/upload/" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if("image".equals(type)) {
				String largeFileName = file.getAbsolutePath().replace("thum_", "");
				
				file = new File(largeFileName);
				
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}






