package com.example.demo.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "registorform")
public class RegistorEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	//@Column(name = "name")
	private String name;

	@Column(name = "email")
	private String email;

	@Column(name = "age")
	private String age;

	@Column(name = "mobile")
	private String mobile;

	@Column(name = "bloodgroup")
	private String bloodgroup;

	@Column(name = "lastdonate")
	private String lastdonate;

	@Column(name = "city")
	private String city;

	@Column(name = "country")
	private String country;

	@Column(name="base64")
	private String base64;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
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

	

	


	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getLastdonate() {
		return lastdonate;
	}

	public void setLastdonate(String lastdonate) {
		this.lastdonate = lastdonate;
	}
	
	
	
	public String getBase64() {
		return base64;
	}

	public void setBase64(String base64) {
		this.base64 = base64;
	}

	public void setId(String parameter) {
		String myString = Long.toString(id);
		
	}
	

}
