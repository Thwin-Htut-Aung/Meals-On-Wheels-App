package com.grouptwo.mow.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grouptwo.mow.dao.Subscription;
import com.grouptwo.mow.repo.SubRepo;

@Service
@Transactional
public class SubServiceImpl implements SubService{

	@Autowired
	private SubRepo subRepo;
	
	@Override
	public void saveSub(Subscription sub) {
		subRepo.save(sub);
		
	}

	@Override
	public void deleteSub(long id) {
		subRepo.deleteById(id);
		
	}

	@Override
	public List<Subscription> viewSubs() {
		return subRepo.findAll();
	}

}
