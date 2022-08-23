package com.charan.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.charan.javaproject.models.LFGRequest;
import com.charan.javaproject.repositories.LFGRequestRepository;

@Service
public class LFGRequestService {

	@Autowired
	LFGRequestRepository requestRepo;

	// Read All
	public List<LFGRequest> allrequests() {
		return requestRepo.findAll();
	}

	// Create
	public LFGRequest createRequest(LFGRequest request) {
		return requestRepo.save(request);
	}

	// Read One
	public LFGRequest findRequest(Long id) {
		Optional<LFGRequest> potentialRequest = requestRepo.findById(id);
		if (potentialRequest.isPresent()) {
			return potentialRequest.get();
		} else {
			return null;
		}
	}

	// Update
	public LFGRequest updateRequest(LFGRequest request) {
		return requestRepo.save(request);
	}

	// Delete
	public void deleteRequest(Long id) {
		requestRepo.deleteById(id);
	}

}
