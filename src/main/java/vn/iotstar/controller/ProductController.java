package vn.iotstar.controller;

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

@WebServlet(urlPatterns = { "/product" })
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductService prodService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageStr = req.getParameter("page");
        int page = 1;
        if (pageStr != null && !pageStr.isEmpty()) {
            page = Integer.parseInt(pageStr);
        }
        int pageSize = 6;
        
        List<Product> list = prodService.findAll(page, pageSize);
        int totalProducts = prodService.count();
        int endPage = totalProducts / pageSize;
        if (totalProducts % pageSize != 0) {
            endPage++;
        }

        req.setAttribute("prodList", list);
        req.setAttribute("endPage", endPage);
        req.setAttribute("currentPage", page);
        
        req.getRequestDispatcher("/views/product-list.jsp").forward(req, resp);
    }
}
