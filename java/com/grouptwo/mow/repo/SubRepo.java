package com.grouptwo.mow.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grouptwo.mow.dao.Subscription;


@Repository
public interface SubRepo extends JpaRepository<Subscription, Long>{

}
