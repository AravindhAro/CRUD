package com.example.demo.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dto.RegistorDto;
import com.example.demo.service.BloodService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class BloodController {
	
	@Autowired
	private BloodService service;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest Req, HttpServletResponse Res) {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(HttpServletRequest Req, HttpServletResponse Res) {
		ModelAndView mv = new ModelAndView("search");
		return mv;
	}
	
	@RequestMapping(value = "/eligibility", method = RequestMethod.GET)
	public ModelAndView eligibility(HttpServletRequest Req, HttpServletResponse Res) {
		ModelAndView mv = new ModelAndView("eligibility");
		return mv;
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signUp(HttpServletRequest Req, HttpServletResponse Res) {
		ModelAndView mv = new ModelAndView("signup");
		return mv;
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ResponseEntity<String> save(@RequestParam(name = "username") String name,@RequestParam(name = "password") String pass) {
		String result = service.signupsave(name, pass);
		System.err.println(result);
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest Req, HttpServletResponse Res) {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	
	@RequestMapping(value = "/loginvalidation", method = RequestMethod.GET)
	public ResponseEntity<String> logincheck(@RequestParam(name = "username") String name,
			@RequestParam(name = "password") String pass) {

		String result = service.loginValidation(name, pass);
		System.err.println(result);
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/registor", method = RequestMethod.GET)
	public ModelAndView registor(HttpServletRequest Req, HttpServletResponse Res) {
		ModelAndView mv = new ModelAndView("registor");
		return mv;
	}
	
	@RequestMapping(value= {"/create"},method=RequestMethod.POST)
	public String  create(HttpServletRequest req, HttpServletResponse res) {
		String result=service.savelogin(req);
		//System.err.println(result);
		return result;
		
	}
	

	@RequestMapping(value ="/ajax",method = RequestMethod.GET)
	public ModelAndView ajax(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView ref=new ModelAndView("ajax");
		return ref;	
	}
	
	@RequestMapping(value ="/getalldata",method = RequestMethod.GET)
	public ResponseEntity<List<RegistorDto>> getDataTable() {
		List<RegistorDto> dtolist=service.getdata();
		return new ResponseEntity<List<RegistorDto>>(dtolist,HttpStatus.OK);	
	}
	
	 @RequestMapping(value="/update" ,method = RequestMethod.POST)
		public ModelAndView edit(HttpServletRequest request,HttpServletResponse response) {
			String result="";
			ModelAndView ref=null;
			result= service.edit(request);
			if (result.equals("Updated Successfully")) {
				ref=new ModelAndView("ajax");
			}
			return ref;	
		}
	 

		@RequestMapping(value ="/delete",method = RequestMethod.GET)
		public ResponseEntity<String> deleteByName(@RequestParam("id") long id) {
			String result="";
			 result=service.deleteByName(id);
			return new ResponseEntity<String>(result,HttpStatus.OK);	
		}
	

	
}
