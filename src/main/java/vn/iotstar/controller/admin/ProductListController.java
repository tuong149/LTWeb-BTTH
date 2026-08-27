package vn.iotstar.controller.admin;

import vn.iotstar.entity.Product;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/admin/product/list" })
public class ProductListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductService prodService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> list = prodService.findAll();
        req.setAttribute("prodList", list);
        req.getRequestDispatcher("/views/admin/list-product.jsp").forward(req, resp);
    }
}
