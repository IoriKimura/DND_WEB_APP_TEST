package com.example.dnd_web_app_test.Controllers;

import com.example.dnd_web_app_test.Database.Repository.UserRepo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

//It is just a testing of Database
@RestController
public class SemeController {

    @Autowired
    UserRepo uRepo;

    @GetMapping(value = "api/user/all")
    public String findAllUsers(){
        return new Gson().toJson(uRepo.findAll());
    }
}
