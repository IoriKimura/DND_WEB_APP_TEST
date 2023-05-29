package com.example.dnd_web_app_test.Services;

import com.example.dnd_web_app_test.Database.Repository.ClassRepo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClassService {
    @Autowired
    ClassRepo classRepo;

    public String information(){
        String information = new Gson().toJson(classRepo.findAll());
        information = information.replace("\\n\\t", "");
        return information;
    }
}
