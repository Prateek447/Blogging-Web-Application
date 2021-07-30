package com.myCodeBook.entities;

import java.sql.Timestamp;

public class User {
	
	public User(String name, String email, String about, String password, String gender) {
		super();
		this.name = name;
		this.email = email;
		this.about = about;
		this.gender=gender;
		this.password = password;
		
	}

	public User(String email) {
		super();
		this.email = email;
	}

	public User(int id, String name, String email, String about, String password, String gender, Timestamp dateTime) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.about = about;
		this.password = password;
		this.gender = gender;
		this.dateTime = dateTime;
	}
	
	public User() {}
	
	private int id;
	private String name;
	private String email;
	private String about;
	private String password;
	private String gender;
	private Timestamp dateTime;
	private String profile;
	private String userType;
	
	
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

}
