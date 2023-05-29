package com.example.demo.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.BloodEntity;

@Repository
public interface BloodRepository extends JpaRepository<BloodEntity, Long>{

	
	@Query(value="select username from client where username=?1",nativeQuery=true)
	String getUserName(String name);
	
	@Query(value="select password from client where username=?1",nativeQuery=true)
	String getPassword(String passs);
	

}
