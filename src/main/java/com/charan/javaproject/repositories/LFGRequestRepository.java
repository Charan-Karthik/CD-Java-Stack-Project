package com.charan.javaproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.charan.javaproject.models.LFGRequest;

@Repository
public interface LFGRequestRepository extends CrudRepository<LFGRequest, Long> {

	List<LFGRequest> findAll();
	
	List<LFGRequest> findByPlatform(String platform);

}
