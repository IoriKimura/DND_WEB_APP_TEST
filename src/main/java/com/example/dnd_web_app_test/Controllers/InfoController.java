package com.example.dnd_web_app_test.Controllers;

import com.example.dnd_web_app_test.Services.ClassService;
import com.example.dnd_web_app_test.Services.RaceAndSubraceSservice;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@NoArgsConstructor
@AllArgsConstructor
public class InfoController {
    @Autowired
    ClassService classService;

    @Autowired
    RaceAndSubraceSservice rsService;

    @GetMapping(value = "api/classes")
    public String showInfoClass(){
        return classService.information();
    }

    @GetMapping(value = "api/races")
    public String showInfoRace(){
        return rsService.raceInformation();
    }

    @GetMapping(value = "api/subRaces")
    public String showSubRacesInfo(){
        return rsService.subRaceInfo();
    }


}
