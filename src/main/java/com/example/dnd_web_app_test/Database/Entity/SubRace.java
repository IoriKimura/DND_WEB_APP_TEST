package com.example.dnd_web_app_test.Database.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "subraces", schema = "public")
@Getter
@Setter
@NoArgsConstructor
public class SubRace {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "subrace_id")
    private Long subRaceID;

    @Column(name = "race_id")
    private Long raceID;

    @Column(name = "subrace_name")
    private String subRaceName;

    @Column(name = "subrace_attribute")
    private String subRaceAttribute;
}
