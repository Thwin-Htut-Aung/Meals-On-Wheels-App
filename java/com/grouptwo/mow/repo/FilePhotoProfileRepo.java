package com.grouptwo.mow.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grouptwo.mow.dao.FilePhotoProfile;

@Repository
public interface FilePhotoProfileRepo extends JpaRepository<FilePhotoProfile, Long>{

}
