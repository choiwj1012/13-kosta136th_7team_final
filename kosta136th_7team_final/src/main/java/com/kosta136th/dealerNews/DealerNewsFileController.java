package com.kosta136th.dealerNews;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class DealerNewsFileController {
	
	@Inject
	private DealerNewsFileService dealerNewsFileService;
	
	@ResponseBody
	@RequestMapping("displayFile")
	public byte[] displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		try{
			in = new FileInputStream("C:\\final_project\\github\\kosta136th_7team_final\\kosta136th_7team_final\\src\\main\\webapp"
					+ "\\resources\\imgUpload\\"+ fileName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return IOUtils.toByteArray(in);
	}
	
	@RequestMapping(value = "/writeImage/{dealer_news_num}")
	@ResponseBody
	public void writeImg(MultipartFile multipartFile, Model model,
			@PathVariable("dealer_news_num") int dealer_news_num){
		if (dealer_news_num == 0){
			dealer_news_num = dealerNewsFileService.getAutoIncrementOfDealerNews();
		}
		String directory = "C:\\final_project\\github\\kosta136th_7team_final\\kosta136th_7team_final\\src\\main\\webapp"
					+ "\\resources\\imgUpload\\" + dealer_news_num +"\\";
		File folder = new File(directory);
		if (!folder.exists()){
			folder.mkdir();
		}
		try{
			multipartToFile(multipartFile, directory);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/makeThumbnail")
	public void uploadForm(String nameSubmitFile, int dealer_news_num, Model model){
		try{
			System.out.println("이름 : " + nameSubmitFile);
			
			if (nameSubmitFile == null){
				return;
			}
			
			//글을 쓰는 상황임
			if (dealer_news_num == 0){
				dealer_news_num = dealerNewsFileService.getAutoIncrementOfDealerNews();
			}
			
			//만들 파일	
			String directory = "C:\\final_project\\github\\kosta136th_7team_final\\kosta136th_7team_final\\src\\main\\webapp"
					+ "\\resources\\imgUpload\\";
			File fromMultipartFile = new File(directory, nameSubmitFile);
			
			//'파일'로부터 '이름'의 썸네일 파일을 만들어 '경로'에 저장하고 반환하는 메소드
			getThumbnailFromFile(directory, "num" + dealer_news_num, fromMultipartFile);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//이미지 파일의 섬네일 파일을 만들어 가져오는 메소드
	//이름, 원본이미지 파일(file) 필요하겠지.
		public File getThumbnailFromFile(String path, String OutputImageFileName, File OriginalImageFile){
			
			int width = 300;
			int height = 167;
			
			File thumbnailFile = null;
			try {
				//이미지(BufferedImage) '원본' <- 파일 A (read)
				//이미지(BufferedImage) '섬네일' 준비 (new)
				//이미지 '섬네일'에 Graphics2D를 통하여 이미지 '원본'을 인수로 대입, 조작 (drawImage) 
				//파일 B <- 이미지 '섬네일' (write)
				thumbnailFile = new File(path, OutputImageFileName);

				BufferedImage originalImg = ImageIO.read(OriginalImageFile);
				BufferedImage thumbnailImg = new BufferedImage(
								width, height, BufferedImage.TYPE_3BYTE_BGR);
				Graphics2D graphic = thumbnailImg.createGraphics();
				graphic.drawImage(originalImg, 0, 0, width, height, null);
				ImageIO.write(thumbnailImg, "jpg", thumbnailFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return thumbnailFile;
		}
	
	public File multipartToFile(MultipartFile multipartFile, String directory){
		/*멀티파트파일을 파일로 변환한다 */
		/*멀티파트파일을 getBytes로 */
		/*파일을 아웃풋스트림으로 열고, Bytes[]들을 쓴다*/
		File fromMultipartFile = null;
		try {
			fromMultipartFile = new File(directory, multipartFile.getOriginalFilename());
			fromMultipartFile.createNewFile(); 
			FileOutputStream fos = new FileOutputStream(fromMultipartFile); 
			fos.write(multipartFile.getBytes());
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    /*멀티파트파일을 파일로 변환 끝*/
	    return fromMultipartFile;
	}
	
}
