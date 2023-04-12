package com.example.dnd_web_app_test.Database.Entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "classes", schema = "public")
@Getter
@Setter
@NoArgsConstructor
public class Class {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "class_id")
    private Long classID;

    @Column(name = "class_name")
    private String className;

    @Column(name = "class_hp")
    private Integer classHP;

    @Column(name = "class_mp")
    private Integer classMP;

    @Column(name = "class_attribute")
    private String classAttribute;

}
