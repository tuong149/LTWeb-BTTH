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

@WebServlet(urlPatterns = { "/admin/category/edit" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
                 maxFileSize = 1024 * 1024 * 10,
                 maxRequestSize = 1024 * 1024 * 50)
public class CategoryEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                Category category = cateService.get(id);
                req.setAttribute("category", category);
                req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect(req.getContextPath() + "/admin/category/list");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String idStr = req.getParameter("id");
        String name = req.getParameter("name");

        try {
            int id = Integer.parseInt(idStr);
            Category oldCategory = cateService.get(id); // Lấy cũ để giữ lại status và icon nếu không đổi
            Category category = new Category();
            category.setCategoryId(id);
            category.setCategoryname(name);
            category.setStatus(oldCategory != null ? oldCategory.getStatus() : 1);

            Part part = req.getPart("icon");
            if (part != null && part.getSize() > 0) {
                String originalFilename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                int index = originalFilename.lastIndexOf(".");
                String ext = "";
                if (index > 0) {
                    ext = originalFilename.substring(index);
                }
                String filename = System.currentTimeMillis() + ext;

                File uploadDir = new File(Constant.DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                part.write(Constant.DIR + "/" + filename);
                category.setImages(filename);
            } else {
                // Keep the old icon if no new file uploaded
                if (oldCategory != null) {
                    category.setImages(oldCategory.getImages());
                }
            }

            cateService.edit(category);
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error editing category: " + e.getMessage());
            req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
        }
    }
}
