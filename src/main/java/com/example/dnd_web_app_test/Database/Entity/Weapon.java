package com.example.dnd_web_app_test.Database.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "weapons", schema = "public")
@Getter
@Setter
@NoArgsConstructor
public class Weapon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "weapon_id")
    private Long weaponID;

    @Column(name = "weapon_name")
    private String weaponName;

    @Column(name = "weapon_dmg")
    private Integer damage;

    @Column(name = "weapon_mana_cost")
    private Integer manaCost;

    @Column(name = "weapon_price")
    private Double weaponPrice;

    @Column(name = "weapon_class_id")
    private Long weaponClassID;
}
