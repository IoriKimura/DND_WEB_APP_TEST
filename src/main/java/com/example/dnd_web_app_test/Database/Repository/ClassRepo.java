package com.example.dnd_web_app_test.Database.Repository;

import com.example.dnd_web_app_test.Database.Entity.Class;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClassRepo extends JpaRepository<Class, Long> {
}
