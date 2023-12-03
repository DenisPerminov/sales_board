package com.example.salesBoard.repositories;

import com.example.salesBoard.models.Picture;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PictureRepository extends JpaRepository<Picture, Long> {
}
