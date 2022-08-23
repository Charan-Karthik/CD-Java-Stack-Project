package com.charan.javaproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.charan.javaproject.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	List<User> findAll();

	// Check if an email is in database
	Optional<User> findByEmail(String email);

}