package com.charan.javaproject.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BetaController {
	
	@GetMapping("/all/games")
	public String allGames() {
		return "allGames.jsp";
	}
	
}
