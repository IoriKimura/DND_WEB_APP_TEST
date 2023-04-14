package com.example.dnd_web_app_test.Services;

import com.example.dnd_web_app_test.Database.Repository.RaceRepo;
import com.example.dnd_web_app_test.Database.Repository.SubraceRepo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


//ToDo: Пофиксить отправку тега переноса на новую строку.
//Скорее всего это происходить из-за GSON, так что лучше отправлять в виде обычного листа на фронт
@Service
public class RaceAndSubraceSservice {
    @Autowired
    SubraceRepo subraceRepo;

    @Autowired
    RaceRepo raceRepo;

    public String raceInformation(){
        String raceInfo = new Gson().toJson(raceRepo.findAll());
        return raceInfo;
    }

    public String subRaceInfo(){
        String subRaceInfo = new Gson().toJson(subraceRepo.findAll());
        return subRaceInfo;
    }
}
