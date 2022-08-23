package com.charan.javaproject.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "requests")
public class LFGRequest {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull(message="Must select a platform")
	private String platform;

	@Size(min = 1, message = "Activity field must be at least one character long")
	private String activity;

	@NotNull(message="Must indicate the maximum number of players for an activity")
	@Min(value=1, message = "The minimum number of players needed for an activity must be at least 1")
	@Max(value=6, message="No more than 6 players can join an activity")
	private Integer guardianLimit;
	
	@NotNull(message="Must indicate how many more players are needed")
	@Min(value=1, message="The minimum number of players needed must be at least 1")
	@Max(value=5, message="Cannot require more than 5 players as the player cap for activities is 6")
	private Integer guardiansNeeded;
	
	@Size(min = 5, max = 255, message = "Description must be between 5 and 255 characters long")
	private String description;
	
// RELATIONSHIPS
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User requestor;

//	CREATED AT AND UPDATED AT
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
// CONSTRUCTOR
	public LFGRequest() {
	}
	
// GETTERS AND SETTERS
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	public Integer getGuardianLimit() {
		return guardianLimit;
	}

	public void setGuardianLimit(Integer guardianLimit) {
		this.guardianLimit = guardianLimit;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getRequestor() {
		return requestor;
	}

	public void setRequestor(User requestor) {
		this.requestor = requestor;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Integer getGuardiansNeeded() {
		return guardiansNeeded;
	}

	public void setGuardiansNeeded(Integer guardiansNeeded) {
		this.guardiansNeeded = guardiansNeeded;
	}
}
