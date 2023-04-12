package com.example.dnd_web_app_test.Database.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "characters", schema = "public")
@Getter
@Setter
@NoArgsConstructor
public class Character {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "character_id")
    private Long characterID;

    @Column(name = "user_id")
    private Long userID;

    @Column(name = "class_id")
    private Long classID;

    @Column(name = "race_id")
    private Long raceID;

    @Column(name = "subrace_id")
    private Long subRaceID;

    @Column(name = "weapon_id")
    private Long weaponID;

    @Column(name = "armour_id")
    private Long armorID;

    @Column(name = "character_name")
    private String charName;

}
