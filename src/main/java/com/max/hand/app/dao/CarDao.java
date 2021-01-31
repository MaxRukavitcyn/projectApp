package com.max.hand.app.dao;

import com.max.hand.app.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarDao extends JpaRepository<Car, Long> {
}
