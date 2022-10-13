package com.grouptwo.mow.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grouptwo.mow.dao.FileDB;

@Repository
public interface FileDBRepo extends JpaRepository<FileDB, Long>{
	
	FileDB findFileDBById(String id);

}
