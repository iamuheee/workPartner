package com.wp.workpartner.common.template;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
		// 전역메소드(static)으로 만들기
	public static String saveFile(MultipartFile upfile, HttpSession session, String folderPath) {
		// 업로드된 첨부파일이 있는 경우 : 파일명 수정 작업 후 서버에 업로드 & 원본명, 수정명을 Board 객체에 담기
			// 파일명 수정 후 서버에 업로드
			String originName = upfile.getOriginalFilename(); // 파일의 원본명 알아내 변수에 담음
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000); // 곱하는 수 : 발생시키는 랜덤값의 개수, 더하는 수 : 시작 숫자
			String ext = originName.substring( originName.lastIndexOf(".") ); // 확장자만 추출해 변수 ext 에 담음
			
			String changeName = currentTime + ranNum + ext;
			
			// 파일을 저장할 폴더의 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath(folderPath);
			System.out.println("저장폴더의 물리적 경로 : " + savePath);
			
			try {
				// transferTo() : 업로드된 첨부파일을 매개변수의 파일 형식으로 변환하여 저장하는 메소드
				// 					=> 여기서는 사용자의 첨부파일을 savePath경로에 changeName파일명으로 변환해 저장
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} 
		
		 // "resources/xxxx/" + "xxxxx.jpg"
		return folderPath + changeName;
	}
}
