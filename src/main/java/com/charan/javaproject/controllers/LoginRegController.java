package com.charan.javaproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.charan.javaproject.models.LoginUser;
import com.charan.javaproject.models.User;
import com.charan.javaproject.services.UserService;

@Controller
public class LoginRegController {
	@Autowired
	UserService userServ;

	@GetMapping("/loginreg")
	public String loginRegPage(Model model, HttpSession session) {
		// clear session
		session.invalidate();

		model.addAttribute("newUser", new User());
		model.addAttribute("loginUser", new LoginUser());

		return "loginReg.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {

		User user = userServ.register(newUser, result);

		if (result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "loginReg.jsp";
		} else {
			session.setAttribute("session_user_id", user.getId());
			return "redirect:/";
		}
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		User user = userServ.login(newLogin, result);

		if (result.hasErrors() || user == null) {
			// re-render login/reg page if any errors
			model.addAttribute("newUser", new User());
			return "loginReg.jsp";
		} else {
			session.setAttribute("session_user_id", user.getId()); // add user to session
			return "redirect:/";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/account/info")
	public String accountIngoPage(HttpSession session, Model model) {
		// we don't want this page to render if there is no user in session
		if (session.getAttribute("session_user_id") == null) {
			return "redirect:/loginreg";
		}
		
		Long userID = (Long) session.getAttribute("session_user_id");
		User thisUser = userServ.findUser(userID);
		model.addAttribute("thisUser", thisUser);

		return "accountInfo.jsp";
	}
}
