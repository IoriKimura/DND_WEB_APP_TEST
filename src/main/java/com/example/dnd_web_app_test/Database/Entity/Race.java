package com.example.dnd_web_app_test.Database.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "races", schema = "public")
@Getter
@Setter
@NoArgsConstructor
public class Race {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "race_id")
    private Long raceID;

    @Column(name = "race_name")
    private String raceName;

    @Column(name = "race_description")
    private String description;

    @Column(name = "race_attribute")
    private String raceAttribute;

    @Column(name = "race_hp")
    private Integer raceHP;

    @Column(name = "race_mp")
    private Integer raceMP;
}
