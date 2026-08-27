package vn.iotstar.controller.admin;

import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.util.Constant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(urlPatterns = { "/admin/product/edit" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
                 maxFileSize = 1024 * 1024 * 10,
                 maxRequestSize = 1024 * 1024 * 50)
public class ProductEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductService prodService = new ProductServiceImpl();
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            Product product = prodService.findById(Integer.parseInt(idStr));
            req.setAttribute("product", product);
            List<Category> categories = cateService.getAll();
            req.setAttribute("categories", categories);
            req.getRequestDispatcher("/views/admin/edit-product.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String idStr = req.getParameter("productId");
        String name = req.getParameter("productName");
        String desc = req.getParameter("description");
        String priceStr = req.getParameter("price");
        String categoryIdStr = req.getParameter("categoryId");
        String oldImage = req.getParameter("oldImage");
        
        Product product = prodService.findById(Integer.parseInt(idStr));
        if(product == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
            return;
        }

        product.setProductName(name);
        product.setDescription(desc);
        try {
            product.setPrice(Double.parseDouble(priceStr));
        } catch (Exception e) {
            product.setPrice(0);
        }

        try {
            if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
                Category category = cateService.get(Integer.parseInt(categoryIdStr));
                product.setCategory(category);
            }
            
            Part part = req.getPart("image");
            if (part != null && part.getSize() > 0) {
                String originalFilename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                int index = originalFilename.lastIndexOf(".");
                String ext = index > 0 ? originalFilename.substring(index) : "";
                String filename = System.currentTimeMillis() + ext;

                File uploadDir = new File(Constant.DIR);
                if (!uploadDir.exists()) uploadDir.mkdir();

                part.write(Constant.DIR + "/" + filename);
                product.setImages(filename);
            } else {
                product.setImages(oldImage);
            }

            prodService.update(product);
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error updating product: " + e.getMessage());
            doGet(req, resp);
        }
    }
}
