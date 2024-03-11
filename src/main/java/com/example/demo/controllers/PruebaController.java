package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class PruebaController {

    @GetMapping("/about")
    public String test() {
    	return "forward:/";
    }
    
    @PostMapping("/api/data")
    public String postData(@RequestBody String data) {
    	System.out.println("Recieved data\n" + data);
    	return "Data recieved";
    }
	
}
