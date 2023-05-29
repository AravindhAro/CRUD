package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.FaDto;
import com.example.demo.entity.FaEntity;

public interface FaService {

	String savedata(FaDto fadto);

//	FaDto getdata(String uname);

//	List<FaEntity> getEntitiesByName(String uname);

	List<FaEntity> getusername(String name);


	
	

}
