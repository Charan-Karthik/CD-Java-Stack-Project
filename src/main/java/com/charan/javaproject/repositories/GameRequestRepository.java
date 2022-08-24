package com.charan.javaproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.charan.javaproject.models.GameRequest;

@Repository
public interface GameRequestRepository extends CrudRepository<GameRequest, Long> {

	List<GameRequest> findAll();
	
}
