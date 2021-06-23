package com.helloworld.root.board.service;

import org.springframework.web.multipart.MultipartFile;

public interface BoardFileService {
	public static final String IMAGE_REPO = "c:\\spring\\image_repo";
	public String savePicture(MultipartFile file);
	public void deleteImage(String pictureName);
}
