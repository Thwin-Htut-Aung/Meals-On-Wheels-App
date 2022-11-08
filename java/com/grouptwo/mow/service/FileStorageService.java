package com.grouptwo.mow.service;

import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.grouptwo.mow.dao.FileDB;
import com.grouptwo.mow.dao.Users;

@Service
public interface FileStorageService {
	
	FileDB storeFile(MultipartFile file, Users user) throws IOException;
	FileDB getFile(String id);

}
