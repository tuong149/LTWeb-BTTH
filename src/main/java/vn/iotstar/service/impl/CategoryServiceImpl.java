package vn.iotstar.service.impl;

import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.model.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.util.Constant;

import java.io.File;
import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void edit(Category newCategory) {
        Category oldCategory = categoryDao.get(newCategory.getId());
        oldCategory.setName(newCategory.getName());
        
        if (newCategory.getIcon() != null) {
            // Delete old file if it exists
            String oldFileName = oldCategory.getIcon();
            if (oldFileName != null && !oldFileName.isEmpty()) {
                File file = new File(Constant.DIR + "/" + oldFileName);
                if (file.exists()) {
                    file.delete();
                }
            }
            // Set new icon
            oldCategory.setIcon(newCategory.getIcon());
        }
        categoryDao.edit(oldCategory);
    }

    @Override
    public void delete(int id) {
        // Option to delete the image file when category is deleted
        Category category = categoryDao.get(id);
        if (category != null && category.getIcon() != null && !category.getIcon().isEmpty()) {
            File file = new File(Constant.DIR + "/" + category.getIcon());
            if (file.exists()) {
                file.delete();
            }
        }
        categoryDao.delete(id);
    }

    @Override
    public Category get(int id) {
        return categoryDao.get(id);
    }

    @Override
    public Category get(String name) {
        return categoryDao.get(name);
    }

    @Override
    public List<Category> getAll() {
        return categoryDao.getAll();
    }

    @Override
    public List<Category> search(String keyword) {
        return categoryDao.search(keyword);
    }
}
