package com.grouptwo.mow.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grouptwo.mow.dao.RiderDetails;

@Repository
public interface RiderDetailsRepo extends JpaRepository<RiderDetails, Long>{

}
