package com.charan.javaproject.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class LoginUser {
	@NotEmpty(message = "Email field is required")
	@Email(message = "Please enter a valid email")
	private String email;

	@NotEmpty(message = "Password field is required")
	private String password;

// CONSTRUCTOR
	public LoginUser() {
	}

// GETTERS AND SETTERS
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
