package vn.iotstar.service.impl;

import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {

    private CategoryDao cateDao = new CategoryDaoImpl();

    @Override
    public void insert(Category category) {
        Category cate = this.get(category.getCategoryname());
        if (cate == null) {
            cateDao.insert(category);
        }
    }

    @Override
    public void edit(Category category) {
        Category cate = this.get(category.getCategoryId());
        if (cate != null) {
            cateDao.edit(category);
        }
    }

    @Override
    public void delete(int id) throws Exception {
        cateDao.delete(id);
    }

    @Override
    public Category get(int id) {
        return cateDao.get(id);
    }

    @Override
    public Category get(String name) {
        return cateDao.get(name);
    }

    @Override
    public List<Category> getAll() {
        return cateDao.getAll();
    }

    @Override
    public List<Category> search(String keyword) {
        return cateDao.search(keyword);
    }
}
