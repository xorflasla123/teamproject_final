package com.helloworld.root.board.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardFileServiceImpl implements BoardFileService {

	@Override
	public String savePicture(MultipartFile file) {
		SimpleDateFormat simpl = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar calendar = Calendar.getInstance();
		String fileName = simpl.format(calendar.getTime()) + file.getOriginalFilename();
		File saveFile = new File(IMAGE_REPO + "\\" + fileName);
		try {
			file.transferTo(saveFile);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}

	@Override
	public void deleteImage(String pictureName) {
		File file = new File(IMAGE_REPO + "/" + pictureName);
		file.delete();
	}

}
