package com.spring_test_app.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/whitebox")
    public String sayHello() {
        return "hello whitebox";
    }
}