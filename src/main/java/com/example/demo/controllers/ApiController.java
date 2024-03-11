package com.example.demo.controllers;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.database.Employee;
import com.example.demo.database.EmployeeRepository;

@RestController
@RequestMapping("/api")
public class ApiController {
	
	private EmployeeRepository repository;

	@GetMapping("/data")
	public List<Employee> postData() {
		repository = EmployeeRepository.getInstance();
		ArrayList<Employee> employeeList = new ArrayList<>();
        employeeList = repository.readData();
        return employeeList;
    }
	
	@PostMapping("/adddata")
	public int addData(@RequestBody String data) {
		repository = EmployeeRepository.getInstance();
		JSONObject res = new JSONObject(data);
		String name = res.getString("name");
		double salario = res.getDouble("salario");
		int resultCode = repository.writeData(name, salario);
		return resultCode;
	}
	
}
