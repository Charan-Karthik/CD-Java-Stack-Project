package com.charan.javaproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.charan.javaproject.models.Game;

@Repository
public interface GameRepository extends CrudRepository<Game, Long> {
	
	List<Game> findAll();
	
}
