package com.charan.javaproject.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.charan.javaproject.models.Game;
import com.charan.javaproject.models.GameRequest;

@Repository
public interface GameRequestRepository extends CrudRepository<GameRequest, Long> {

	List<GameRequest> findAll();

	List<GameRequest> findAllBySpecificGameOrderByCreatedAtDesc(Game game);
	
//	find older requests to get rid of
	@Query(value = "SELECT * FROM game_requests WHERE game_id = ?1 AND created_at < (NOW() - INTERVAL 4 HOUR)", nativeQuery = true)
	List<GameRequest> olderReqs(Game game);
}
