package vn.iotstar.service;

import vn.iotstar.entity.Category;

import java.util.List;

public interface CategoryService {
    void insert(Category category);
    void edit(Category category);
    void delete(int id) throws Exception;
    Category get(int id);
    Category get(String name);
    List<Category> getAll();
    List<Category> search(String keyword);
}
