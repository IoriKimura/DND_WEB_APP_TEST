package com.example.dnd_web_app_test.Database.Repository;

import com.example.dnd_web_app_test.Database.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
}
