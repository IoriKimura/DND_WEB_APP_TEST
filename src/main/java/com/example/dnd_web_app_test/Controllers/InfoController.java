package com.example.dnd_web_app_test.Controllers;

import com.example.dnd_web_app_test.Services.ClassService;
import com.example.dnd_web_app_test.Services.RaceAndSubraceSservice;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    public ResponseEntity<String> showInfoClass(){
        return ResponseEntity.status(HttpStatus.OK).body(classService.information());
    }

    @GetMapping(value = "api/races")
    public ResponseEntity<String> showInfoRace(){
        return ResponseEntity.status(HttpStatus.OK).body(rsService.raceInformation());
    }

    @GetMapping(value = "api/subRaces")
    public ResponseEntity<String> showSubRacesInfo(){
        return ResponseEntity.status(HttpStatus.OK).body(rsService.subRaceInfo());
    }


}
