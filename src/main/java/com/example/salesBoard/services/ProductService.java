package com.example.salesBoard.services;

import com.example.salesBoard.models.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {

    private List<Product> products = new ArrayList<>();
    private long id = 0;

    {
        products.add(new Product(++id, "Nokia", "some", 2000, "Kostroma", "Denis"));
        products.add(new Product(++id, "Iphone 4", "description", 10000, "Moscow", "Nike"));
    }

    public List<Product> listProducts () {
        return products;
    }

    public void saveProduct (Product product) {
        product.setId(++id);
        products.add(product);
    }

    public void deleteProduct (Long id) {
        products.removeIf(product -> product.getId().equals(id));
    }

    public Product getProductDyId (Long id) {
        for (Product product : products) {
            if (product.getId().equals(id)) {
                return product;
            }
        }
        return null;
    }
}
