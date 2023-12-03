package com.example.salesBoard.controllers;

import com.example.salesBoard.models.Picture;
import com.example.salesBoard.repositories.PictureRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;

@RestController
@RequiredArgsConstructor
public class PictureController {

    private final PictureRepository pictureRepository;

    @GetMapping("/pictures/{id}")
    private ResponseEntity<?> getPictureById (@PathVariable Long id) {
        Picture picture = pictureRepository.findById(id).orElse(null);
        return ResponseEntity.ok()
                .header("fileName", picture.getOriginalFileName())
                .contentType(MediaType.valueOf(picture.getContentType()))
                .contentLength(picture.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(picture.getBytes())));
    }
}
