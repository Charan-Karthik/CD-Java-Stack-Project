package com.charan.javaproject.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.charan.javaproject.models.LFGRequest;

@Repository
public interface LFGRequestRepository extends CrudRepository<LFGRequest, Long> {

	List<LFGRequest> findAll();

	List<LFGRequest> findAllByOrderByCreatedAtDesc();

	List<LFGRequest> findByPlatformOrderByCreatedAtDesc(String platform);
	
	@Query(value = "SELECT * FROM requests WHERE created_at < (NOW() - INTERVAL 4 HOUR)", nativeQuery = true)
	List<LFGRequest> olderLFGs();
}
