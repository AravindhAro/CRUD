package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.FaEntity;

@Repository
public interface FaRepository extends JpaRepository<FaEntity, Long>{

	

	@Query(value="select * from office.employee where name=?1",nativeQuery=true)
	List<FaEntity> findByName(String name);

}
