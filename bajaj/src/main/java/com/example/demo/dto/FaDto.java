package com.example.demo.dto;

import com.example.demo.entity.FaEntity;

public class FaDto {
	
	
	private Long id;
	private String name;
	private String email;
	private String job;
	private String city;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
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
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public void add(FaEntity entity) {
		// TODO Auto-generated method stub
		
	}

	
	
	
	

}
