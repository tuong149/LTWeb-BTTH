package vn.iotstar.service;

import vn.iotstar.entity.Product;
import java.util.List;

public interface ProductService {
    void insert(Product product);
    void update(Product product);
    void delete(int productId) throws Exception;
    Product findById(int productId);
    List<Product> findAll();
    List<Product> findAll(int page, int pagesize);
    int count();
    List<Product> findTop10();
}
