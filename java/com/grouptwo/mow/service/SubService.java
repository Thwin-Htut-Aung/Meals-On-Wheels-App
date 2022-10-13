package com.grouptwo.mow.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.grouptwo.mow.dao.Subscription;

@Service
@Transactional
public interface SubService {

	public void saveSub(Subscription sub);
	public void deleteSub(long id);
	public List<Subscription> viewSubs();
	
}
