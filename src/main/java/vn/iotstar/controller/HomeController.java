package vn.iotstar.controller;

import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/home" })
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy danh sách các danh mục để hiển thị cho người dùng
        List<Category> cateList = cateService.getAll();
        req.setAttribute("cateList", cateList);

        vn.iotstar.service.ProductService prodService = new vn.iotstar.service.impl.ProductServiceImpl();
        java.util.List<vn.iotstar.entity.Product> topProducts = prodService.findTop10();
        req.setAttribute("topProducts", topProducts);
        
        // Điều hướng tới trang home.jsp
        req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
    }
}
