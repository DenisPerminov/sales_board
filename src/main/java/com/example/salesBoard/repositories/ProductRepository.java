package com.example.salesBoard.repositories;

import com.example.salesBoard.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByTitle (String tittle);
}
