package vn.iotstar.dao.impl;

import vn.iotstar.config.JpaConfig;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.entity.Category;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public void insert(Category category) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(category); // insert vào bảng
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public void edit(Category category) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(category); // update vào bảng
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Category category = enma.find(Category.class, id);
            if (category != null) {
                enma.remove(category);
            } else {
                throw new Exception("Không tìm thấy Category để xóa");
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public Category get(int id) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            return enma.find(Category.class, id);
        } finally {
            enma.close();
        }
    }

    @Override
    public Category get(String name) {
        EntityManager enma = JpaConfig.getEntityManager();
        String jpql = "SELECT c FROM Category c WHERE c.categoryname = :catname";
        try {
            TypedQuery<Category> query = enma.createQuery(jpql, Category.class);
            query.setParameter("catname", name);
            List<Category> results = query.getResultList();
            if (results.isEmpty()) {
                return null;
            }
            return results.get(0);
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Category> getAll() {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            TypedQuery<Category> query = enma.createNamedQuery("Category.findAll", Category.class);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Category> search(String keyword) {
        EntityManager enma = JpaConfig.getEntityManager();
        String jpql = "SELECT c FROM Category c WHERE c.categoryname like :catname";
        try {
            TypedQuery<Category> query = enma.createQuery(jpql, Category.class);
            query.setParameter("catname", "%" + keyword + "%");
            return query.getResultList();
        } finally {
            enma.close();
        }
    }
}
