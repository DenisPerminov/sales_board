package com.example.salesBoard.services;

import com.example.salesBoard.models.Picture;
import com.example.salesBoard.models.Product;
import com.example.salesBoard.models.User;
import com.example.salesBoard.repositories.ProductRepository;
import com.example.salesBoard.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {

   private final ProductRepository productRepository;
   private final UserRepository userRepository;

    public List<Product> listProducts (String title) {
        if (title != null && !title.isEmpty()) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }

    public void saveProduct (Principal principal,
                             Product product,
                             MultipartFile file1,
                             MultipartFile file2,
                             MultipartFile file3) throws IOException {

        product.setUser(getUserByPrincipal(principal));
        Picture picture1, picture2, picture3;

        if (file1.getSize() != 0) {
            picture1 = toPictureEntity(file1);
            picture1.setPreviewPicture(true);
            product.addPictureToProduct(picture1);
        }
        if (file2.getSize() != 0) {
            picture2 = toPictureEntity(file2);
            product.addPictureToProduct(picture2);
        }
        if (file3.getSize() != 0) {
            picture3 = toPictureEntity(file3);
            product.addPictureToProduct(picture3);
        }

        log.info("Saving new product. Title: {}; Author email: {};", product.getTitle(), product.getUser().getEmail());

        Product productFromDB = productRepository.save(product);
        productFromDB.setPreviewPictureId(productFromDB.getPictures().get(0).getId());
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) {
            return new User();
        }
        return userRepository.findByEmail(principal.getName());
    }
    private Picture toPictureEntity(MultipartFile file) throws IOException {
        Picture picture = new Picture();
        picture.setName(file.getName());
        picture.setOriginalFileName(file.getOriginalFilename());
        picture.setContentType(file.getContentType());
        picture.setSize(file.getSize());
        picture.setBytes(file.getBytes());
        return picture;
    }

    public void deleteProduct (Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductDyId (Long id) {
        return productRepository.findById(id).orElse(null);
    }
}
