package com.kosta136th.dealer;

//import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

//@Controller
public class DealerPhotoController {
	
//	@Resource(name = "uploadPath")
//	private String uploadPath;
//	
//	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
//	public void uploadForm() {
//		
//	}
//	
//	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
//	public void uploadForm(MultipartFile file, Model model) throws Exception {
//		
//		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
//		
//		model.addAttribute("savedName", savedName);
//		
//	}
//	
//	private String uploadFile(String originalName, byte[] fileData) throws Exception {
//		
//		UUID uid = UUID.randomUUID();
//		
//		String savedName = uid.toString() + "_" + originalName;
//		
//		File target = new File(uploadPath,savedName);
//		
//		FileCopyUtils.copy(fileData, target);
//		
//		return savedName;
//		
//	}
	
	
	
}