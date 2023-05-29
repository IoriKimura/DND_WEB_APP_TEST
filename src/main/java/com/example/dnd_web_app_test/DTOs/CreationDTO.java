package com.example.dnd_web_app_test.DTOs;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreationDTO {

    private String charName;
    private Long raceID;
    private Long subRaceID;
    private Long classID;
    private Long weaponID;
    private Long armourID;
}
