package com.example.demo.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.FaDto;
import com.example.demo.entity.FaEntity;
import com.example.demo.service.FaService;

import jakarta.servlet.ServletException;

@RestController 
public class FaController  {
	
	@Autowired
	private FaService service;
	 @Autowired
	    private JdbcTemplate jdbcTemplate;

	 @GetMapping("/employees")  /////////////////////////////////////////////////sql exception////////////////////////
	 public ResponseEntity<List<FaEntity>> getEmployees() throws SQLException {
	     List<FaEntity> employees = new ArrayList<>();

	     try (Connection connection = jdbcTemplate.getDataSource().getConnection();
	          Statement statement = connection.createStatement();
	          ResultSet resultSet = statement.executeQuery("SELECT * FROM employee")) {  //...if change the  table name exception occur
	         while (resultSet.next()) {
	             FaEntity employee = new FaEntity();
	             employee.setId(resultSet.getLong("id"));
	             employee.setName(resultSet.getString("name"));
	             employees.add(employee);
	         }
	     } catch (SQLException e) {
	    	 e.printStackTrace();
	    	 System.err.println(e);
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	     }

	     return ResponseEntity.ok(employees);
	 }
	 
	 @GetMapping("/example")    //...............................servlet exception////////////////////////
	    public String example() throws ServletException {
	        try {
	            // some code that throws an exception
	            int result = 1/0;
	        } catch (ArithmeticException e) {
	            throw new ServletException("An arithmetic exception occurred", e);
	        }
	        return "example";
	    }


	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ResponseEntity<String> save  (@RequestBody FaDto fadto){
		String result = service.savedata(fadto);
		
		return new ResponseEntity<String>(result,HttpStatus.OK);
	}


	@RequestMapping(value ="/getdata",method = RequestMethod.GET)
	public List<FaEntity> getPersonByName(@RequestParam(name="name") String name) {
		List<FaEntity> ent=service.getusername(name);
		return ent;	
	}
}
