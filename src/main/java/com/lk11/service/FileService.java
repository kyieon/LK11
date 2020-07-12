package com.lk11.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.net.HttpHeaders;

@Service
public class FileService {

	private Logger log = LoggerFactory.getLogger(FileService.class);

	public void uploadFile(MultipartFile multipartFile, String path) throws IllegalStateException, IOException {
		File file = new File(path);
		file.mkdirs();

		if (file.exists()) {
			file.delete();
		}
		multipartFile.transferTo(file);
	}

	public ResponseEntity<?> downloadFile(byte[] bytes, String fileName) throws UnsupportedEncodingException {
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, 
						"attachment; filename=\"" + URLEncoder.encode(fileName, "utf-8") + "\"")
				.body(bytes);
	}

	public ResponseEntity<?> downloadFile(File file) throws UnsupportedEncodingException {
		FileSystemResource resource = new FileSystemResource(file);
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION,
						"attachment; filename=\"" + URLEncoder.encode(file.getName(), "utf-8") + "\"")
				.body(resource);
	}
	
	public ResponseEntity<?> downloadFile(File file, String fileName) throws UnsupportedEncodingException {
		FileSystemResource resource = new FileSystemResource(file);
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION,
						"attachment; filename=\"" + URLEncoder.encode(fileName, "utf-8") + "\"")
				.body(resource);
	}
}
