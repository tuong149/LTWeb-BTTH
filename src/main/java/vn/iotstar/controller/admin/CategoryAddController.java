package vn.iotstar.controller.admin;

import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;
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

@WebServlet(urlPatterns = { "/admin/category/add" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CategoryAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        Category category = new Category();
        category.setCategoryname(name);
        category.setStatus(1); // Set default status to 1

        try {
            Part part = req.getPart("icon");
            if (part != null && part.getSize() > 0) {
                String originalFilename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                int index = originalFilename.lastIndexOf(".");
                String ext = "";
                if (index > 0) {
                    ext = originalFilename.substring(index);
                }
                String filename = System.currentTimeMillis() + ext;

                // Ensure upload directory exists
                File uploadDir = new File(Constant.DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                part.write(Constant.DIR + "/" + filename);
                category.setImages(filename);
            }

            cateService.insert(category);
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error adding category: " + e.getMessage());
            req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
        }
    }
}
