package com.example.demo.serviceimpl;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.example.demo.dto.RegistorDto;
import com.example.demo.entity.BloodEntity;
import com.example.demo.entity.RegistorEntity;
import com.example.demo.repository.BloodRepository;
import com.example.demo.repository.RegistorRepo;
import com.example.demo.service.BloodService;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class BloodServiceImpl implements BloodService {

	@Autowired
	private BloodRepository reposit;

	@Autowired
	RegistorRepo regist;

	@Override
	public String signupsave(String name, String pass) {
		String str = null;

		try {
			if (!name.isEmpty() && !pass.isEmpty()) {

				BloodEntity entity = new BloodEntity();
				entity.setUsername(name);
				entity.setPassword(pass);
				reposit.save(entity);
				str = "saved successfully";
			} else {
				str = "not successful";

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return str;

	}

	@Override
	public String loginValidation(String name, String pass) {

		String result = "";

		if (name.equalsIgnoreCase(reposit.getUserName(name)) && pass.equalsIgnoreCase(reposit.getPassword(name))) {

			result = "login successful";
		} else {
			result = "login failed";
		}

		return result;
	}

	@Override
	public String savelogin(HttpServletRequest req) {

		

		RegistorEntity entity = new RegistorEntity();
		
		entity.setName(req.getParameter("name"));
		entity.setEmail(req.getParameter("email"));
		entity.setAge(req.getParameter("age"));
		entity.setMobile(req.getParameter("mobile"));
		entity.setLastdonate(req.getParameter("lastdonate"));
		entity.setCity(req.getParameter("city"));
		entity.setCountry(req.getParameter("country"));
		entity.setBloodgroup(req.getParameter("bloodgroup"));
		
		
		
		String img = req.getParameter("base64");
		String store = Base64.getEncoder().encodeToString(img.getBytes());
		
		entity.setBase64(store);
		
				String str= new String(Base64.getDecoder().decode(entity.getBase64().getBytes()));
				System.err.println(str +" "+"hi aravind");
		regist.save(entity);
		String  result = "saved success";

		return result;
	}

	@Override
	public List<RegistorDto> getdata() {
		
		List<RegistorEntity> list = regist.findAll();
		List<RegistorDto> dtoList = new ArrayList<>();
		try {
			
			for (RegistorEntity itr : list) {
				RegistorDto dto = new RegistorDto();

				dto.setId(itr.getId());
				dto.setName(itr.getName());
				dto.setEmail(itr.getEmail());
				dto.setBloodgroup(itr.getBloodgroup());
				dto.setAge(itr.getAge());
				dto.setMobile(itr.getMobile());
				dto.setCity(itr.getCity());
				dto.setCountry(itr.getCountry());
				dto.setLastdonate(itr.getLastdonate());
				dtoList.add(dto);}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dtoList;
		
		
	}

	@Override
	public String edit(HttpServletRequest request) {

		String result="";
//		RegistorDto re=new RegistorDto();

		try {		
			
			RegistorEntity entity=regist.getDataByName(request.getParameter("id"));
			
//			entity.setId(request.getParameter("id"));
			entity.setName(request.getParameter("name"));
			entity.setEmail(request.getParameter("email"));
			entity.setAge(request.getParameter("age"));
			
			entity.setMobile(request.getParameter("mobile"));
			entity.setBloodgroup(request.getParameter("bloodgroup"));
			entity.setLastdonate(request.getParameter("lastdonate"));
			entity.setCity(request.getParameter("city"));
			entity.setCountry(request.getParameter("country"));	
			regist.save(entity);
			result="Updated Successfully";
		} catch (Exception e) {
			e.printStackTrace();
			result="Exception occurred";
		}
		
		return result;
	}

	@Override
	public String deleteByName(long id) {
		
		regist.deleteById(id);
		
		String result  = "delete successfully";
		
		return result;
		
	}
	
	



}
