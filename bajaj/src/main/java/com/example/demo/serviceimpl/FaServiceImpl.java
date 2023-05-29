package com.example.demo.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.FaDto;
import com.example.demo.entity.FaEntity;
import com.example.demo.repository.FaRepository;
import com.example.demo.service.FaService;

@Service
public class FaServiceImpl implements FaService {

	@Autowired
	private FaRepository reposit;

	@Override
	public String savedata(FaDto fadto) {
		String result = null;

		if (fadto != null) {
			FaEntity entity = new FaEntity();
			entity.setEmail(fadto.getEmail());
			entity.setJob(fadto.getJob());
			entity.setCity(fadto.getCity());
			reposit.save(entity);
			result = "saved";
		} else {
			result = "not saved";
		}

		return result;
	}

	@Override
	public List<FaEntity> getusername(String name) {

		return reposit.findByName(name);
	}

}
