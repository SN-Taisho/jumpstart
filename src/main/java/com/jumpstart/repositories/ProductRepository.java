package com.jumpstart.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jumpstart.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

}
