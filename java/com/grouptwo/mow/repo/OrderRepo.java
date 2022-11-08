package com.grouptwo.mow.repo;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grouptwo.mow.dao.Orders;

@Repository
public interface OrderRepo extends JpaRepository<Orders, Long>{


}
