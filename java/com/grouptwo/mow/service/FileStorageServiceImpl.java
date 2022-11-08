package com.grouptwo.mow.service;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.grouptwo.mow.dao.FileDB;
import com.grouptwo.mow.dao.Users;
import com.grouptwo.mow.repo.FileDBRepo;

@Service
@Transactional
public class FileStorageServiceImpl implements FileStorageService{
	
	@Autowired
	private FileDBRepo fileDBRepo;

	@Override
	public FileDB storeFile(MultipartFile file, Users user) throws IOException {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		FileDB fileDB = new FileDB(fileName, file.getContentType(), file.getBytes(), user);
		return fileDBRepo.save(fileDB);
	}

	@Override
	public FileDB getFile(String id) {
		return fileDBRepo.findFileDBById(id);
	}

	

}
