package com.charan.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.charan.javaproject.models.Game;
import com.charan.javaproject.models.GameRequest;
import com.charan.javaproject.repositories.GameRequestRepository;

@Service
public class GameRequestService {

	@Autowired
	GameRequestRepository gameReqRepo;

	// Read All
	public List<GameRequest> allGameRequests() {
		return gameReqRepo.findAll();
	}

	// Create
	public GameRequest createGameRequest(GameRequest request) {
		return gameReqRepo.save(request);
	}

	// Read One
	public GameRequest findGameRequest(Long id) {
		Optional<GameRequest> potentialRequest = gameReqRepo.findById(id);
		if (potentialRequest.isPresent()) {
			return potentialRequest.get();
		} else {
			return null;
		}
	}

	// Update
	public GameRequest updateGameRequest(GameRequest request) {
		return gameReqRepo.save(request);
	}

	// Delete
	public void deleteGameRequest(Long id) {
		gameReqRepo.deleteById(id);
	}
	
	// Find all by created at in descending order
	public List<GameRequest> orderedGameReqs(Game game) {
		return gameReqRepo.findAllBySpecificGameOrderByCreatedAtDesc(game);
	}
	
	// requests older than specified time period
	public List<GameRequest> oldReqsOnly(Game game) {
		return gameReqRepo.olderReqs(game);
	}

}
