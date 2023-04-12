package com.example.dnd_web_app_test.Database.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "armour", schema = "public")
@Getter
@Setter
@NoArgsConstructor
public class Armor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "armour_id")
    private Long armorID;

    @Column(name = "armour_name")
    private String armorName;

    @Column(name = "armour_points")
    private Integer armorPoints;

    @Column(name = "armour_price")
    private Double armorPrice;

    @Column(name = "armour_class_id")
    private Long armorClassID;
}
