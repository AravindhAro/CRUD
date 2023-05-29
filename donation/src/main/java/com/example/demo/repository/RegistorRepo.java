package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.RegistorEntity;

@Repository
public interface RegistorRepo extends JpaRepository<RegistorEntity, Long>{

	

	

	
	@Query(value="select * from bloodbank.registorform where id=?1",nativeQuery=true)
	RegistorEntity getDataByName(String parameter);
	
	
	
	@Query(value="select id from bloodbank.registorform where name=?1",nativeQuery=true)
	long getIdByName(String name);

	

	

	
	
}
