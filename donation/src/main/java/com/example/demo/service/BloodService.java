package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.RegistorDto;

import jakarta.servlet.http.HttpServletRequest;

public interface BloodService {

	String signupsave(String name, String pass);

	String loginValidation(String name, String pass);

	String savelogin(HttpServletRequest req);

	List<RegistorDto> getdata();

	String edit(HttpServletRequest request);

	String deleteByName(long id);

}
