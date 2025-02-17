package com.project.servlets;
import java.sql.*;
public class User {
	private int id ;
	private String name;
	private String email;
	private String password;
	private String gender;
	private Timestamp registration_date;
	private String profile;
	public User(int id, String name, String email, String password, String gender, Timestamp registration_date) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.registration_date = registration_date;
	}
	public User() {
		super();
	}
	public User(String name, String email, String password, String gender) {
		super();
		this.name = name;
		this.email = email; 
		this.password = password;
		this.gender = gender;
		this.registration_date = registration_date;
		this.profile=profile;
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
	public Timestamp getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(Timestamp registration_date) {
		this.registration_date = registration_date;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	

}
