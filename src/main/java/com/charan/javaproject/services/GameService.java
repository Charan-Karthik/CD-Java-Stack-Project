package com.charan.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.charan.javaproject.models.Game;
import com.charan.javaproject.repositories.GameRepository;

@Service
public class GameService {

	@Autowired
	GameRepository gameRepo;

	// Read All
	public List<Game> allGames() {
		return gameRepo.findAll();
	}

	// Create
	public Game createGame(Game game) {
		return gameRepo.save(game);
	}

	// Read One
	public Game findGame(Long id) {
		Optional<Game> potentialGame = gameRepo.findById(id);
		if (potentialGame.isPresent()) {
			return potentialGame.get();
		} else {
			return null;
		}
	}

	// Update
	public Game updaetGame(Game game) {
		return gameRepo.save(game);
	}

	// Delete
	public void deleteGame(Long id) {
		gameRepo.deleteById(id);
	}
}
