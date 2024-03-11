package com.example.demo.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PruebaController {

    @GetMapping("/insertar")
    public String test() {
    	return "forward:/";
    }
	
}
