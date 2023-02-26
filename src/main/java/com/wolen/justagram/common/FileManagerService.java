package com.wolen.justagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	public static final String FILE_UPLOAD_PATH ="C:\\Users\\wnwlt\\Desktop\\Justagram\\upload\\images";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, MultipartFile file) {
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		// 디렉토리(폴더)
		File directory = new File(directoryPath);
		
		if(directory.mkdir()==false) {
			//디렉토리 생성 실패
			//디렉토리 생성 실패 로그 추가
			logger.error("savfile : 디렉토리 생성 실패" + directoryPath);
			return null;
		}
		
		//파일 저장
		try {
			byte[] bytes = file.getBytes();
			
			String filePath = directoryPath + file.getOriginalFilename();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			return null;
		}
		
		return "/images" + directoryName + file.getOriginalFilename();
		
		
	}
	
	// 파일 삭제 메소드
		public static boolean removeFile(String filePath) {
			// 삭제 경로 /images 를 제거하고
			// 실제 파일 저장 경로에 이어 붙여 준다.
			// C:\\Users\\wnwlt\\Desktop\\justagram\\upload\\images/2_3143135\\adfa.png
			
			String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
			// 문자열의 경로를 path라는 객체로 만들어주는 과정
			Path path = Paths.get(realFilePath);
			
			// 파일이 존재하는지
			if(Files.exists(path)) {
				try {
					Files.delete(path);
				} catch (IOException e) {

					e.printStackTrace();
					
					return false;
				}
			}
			
			// C:\\Users\\wnwlt\\Desktop\\justagram\\upload\\images/2_3143135
			// 디렉토리 경로
			Path dirPath = path.getParent();
			// 디렉토리존재 여부
			if(Files.exists(dirPath)) {
				try {
					Files.delete(dirPath);
				} catch (IOException e) {

					e.printStackTrace();
					
					return false;
				}
			}
			
			return false;
			
		}
	
	
}
