package com.wp.workpartner.common.model.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class File {
	private int fileNo;
	private int refNo; // 참조하고있는 게시글 번호
	private String fileCategory;
	private String fileOriginName;
	private String fileChangeName;
	private String filePath; // 파일경로, 경로~확장자까지 다 있음 (/xxxx/xxxx/xxx.fileChangeName.확장자) 
	private Date fileUploadDate;
	private String fileLevel;
	private String fileStatus;
	
	public static File uploadFile(MultipartFile upfile, String saveFilePath) {
		// fileNo, fileCategory, fileUploadDate, fileLevel, fileStatus는 
		// SQL문에서 직접 작성하기때문에 여기서 추가하지 않음
		File file = new File();
		file.setFileOriginName( upfile.getOriginalFilename() );
		file.setFileChangeName( saveFilePath.substring(saveFilePath.lastIndexOf('/') + 1, saveFilePath.lastIndexOf('.')) );
		file.setFilePath( saveFilePath );
		
		return file;
	}
	
}
