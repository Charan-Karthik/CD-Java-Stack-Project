package com.charan.javaproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.charan.javaproject.models.Game;
import com.charan.javaproject.models.GameRequest;
import com.charan.javaproject.models.User;
import com.charan.javaproject.services.GameRequestService;
import com.charan.javaproject.services.GameService;
import com.charan.javaproject.services.UserService;

@Controller
public class GameController {

	@Autowired
	UserService userServ;

	@Autowired
	GameService gameServ;

	@Autowired
	GameRequestService gameReqServ;

	@GetMapping("/all/games")
	public String allGames(HttpSession session, Model model) {

		if (session.getAttribute("session_user_id") != null) {

			Long userID = (Long) session.getAttribute("session_user_id");
			User loggedInUser = userServ.findUser(userID);

			model.addAttribute("username", loggedInUser.getUsername());
		}

		List<Game> allGames = gameServ.allGames();
		model.addAttribute("allGames", allGames);

		return "allGames.jsp";
	}

	@GetMapping("/new/game")
	public String createGamePage(@ModelAttribute("newGame") Game game, HttpSession session) {
		// we don't want this page to render if there is no user in session
		if (session.getAttribute("session_user_id") == null) {
			return "redirect:/loginreg";
		}

		return "createGame.jsp";
	}

	@PostMapping("/create/game")
	public String createGame(@Valid @ModelAttribute("newGame") Game game, BindingResult result, HttpSession session) {
		// we don't want this page to render if there is no user in session
		if (session.getAttribute("session_user_id") == null) {
			return "redirect:/loginreg";
		}

		if (result.hasErrors()) {
			return "createGame.jsp";
		}

		Long userID = (Long) session.getAttribute("session_user_id");
		User user = userServ.findUser(userID);

		game.setPoster(user);
		gameServ.createGame(game);

		return "redirect:/all/games";
	}

	@GetMapping("/game/{id}")
	public String oneGamePage(@PathVariable("id") Long gameID, HttpSession session, Model model) {
		if (session.getAttribute("session_user_id") != null) {

			Long userID = (Long) session.getAttribute("session_user_id");
			User loggedInUser = userServ.findUser(userID);

			model.addAttribute("username", loggedInUser.getUsername());
		}

		Game thisGame = gameServ.findGame(gameID);
		model.addAttribute("thisGame", thisGame);

		return "oneGame.jsp";
	}

	@GetMapping("/game/{id}/new/request")
	public String gameSpecificRequest(@ModelAttribute("newGameReq") GameRequest gameReq,
			@PathVariable("id") Long gameID, HttpSession session, Model model) {
		// we don't want this page to render if there is no user in session
		if (session.getAttribute("session_user_id") == null) {
			return "redirect:/loginreg";
		}

		Game thisGame = gameServ.findGame(gameID);
		model.addAttribute("thisGame", thisGame);

		return "gameRequest.jsp";
	}

	@PostMapping("/game/{id}/create/request")
	public String createGameSpecificRequest(@Valid @ModelAttribute("newGameReq") GameRequest gameReq,
			BindingResult result, HttpSession session, @PathVariable("id") Long gameID, Model model) {
		// we don't want this page to render if there is no user in session
		if (session.getAttribute("session_user_id") == null) {
			return "redirect:/loginreg";
		}
		if (result.hasErrors()) {

			Game thisGame = gameServ.findGame(gameID);
			model.addAttribute("thisGame", thisGame);

			System.out.println(result);

			return "gameRequest.jsp";
		}

		Long userID = (Long) session.getAttribute("session_user_id");
		User loggedInUser = userServ.findUser(userID);
		gameReq.setGameRequestor(loggedInUser);

		Game thisGame = gameServ.findGame(gameID);
		gameReq.setSpecificGame(thisGame);

		gameReqServ.createGameRequest(gameReq);

		return "redirect:/game/" + thisGame.getId();
	}

	@GetMapping("/game/{gameID}/request/{reqID}")
	public String oneSpecificGameReq(@PathVariable("gameID") Long gameID, @PathVariable("reqID") Long requestID,
			HttpSession session, Model model) {
		if (session.getAttribute("session_user_id") != null) {

			Long userID = (Long) session.getAttribute("session_user_id");
			User loggedInUser = userServ.findUser(userID);

			model.addAttribute("username", loggedInUser.getUsername());
		}

		Game thisGame = gameServ.findGame(gameID);
		GameRequest thisRequest = gameReqServ.findGameRequest(requestID);
		model.addAttribute("thisGame", thisGame);
		model.addAttribute("thisRequest", thisRequest);

		return "oneReq.jsp";
	}

	@GetMapping("/edit/game/request/{id}")
	public String editGameRequestPage(@PathVariable("id") Long gameRequestID, Model model, HttpSession session) {
		// we don't want this page to render if there is no user in session
		if (session.getAttribute("session_user_id") == null) {
			return "redirect:/loginreg";
		}

		GameRequest oneRequest = gameReqServ.findGameRequest(gameRequestID);
		model.addAttribute("oneRequest", oneRequest);
		
		Long userID = (Long) session.getAttribute("session_user_id");
		
		System.out.println(oneRequest.getGameRequestor().getId());
		System.out.println(userID);
		
		if (userID != oneRequest.getGameRequestor().getId()) {
			return "redirect:/logout";
		}

		return "editGameRequest.jsp";
	}

	@PostMapping("/edit/game/request/submit")
	public String submitEdits(@Valid @ModelAttribute("oneRequest") GameRequest editedReq, BindingResult result,
			HttpSession session, Model model) {
		// we don't want this page to render if there is no user in session
		if (session.getAttribute("session_user_id") == null) {
			return "redirect:/loginreg";
		}

		if (result.hasErrors()) {
			return "editGameRequest.jsp";
		} else {
			gameReqServ.updateGameRequest(editedReq);

			Long gameID = editedReq.getSpecificGame().getId();

			return "redirect:/game/" + gameID;
		}

	}

	@DeleteMapping("/delete/game/request/{id}")
	public String deleteGameReq(@PathVariable("id") Long reqID, HttpSession session) {
		// we don't want this page to render if there is no user in session
		if (session.getAttribute("session_user_id") == null) {
			return "redirect:/loginreg";
		}

		GameRequest oneReq = gameReqServ.findGameRequest(reqID);
		Long gameID = oneReq.getSpecificGame().getId();

		gameReqServ.deleteGameRequest(reqID);

		return "redirect:/game/" + gameID;
	}

}
