package com.example.dnd_web_app_test.Database.Repository;

import com.example.dnd_web_app_test.Database.Entity.Race;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RaceRepo extends JpaRepository<Race, Long> {
}
