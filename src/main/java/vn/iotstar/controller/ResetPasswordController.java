package vn.iotstar.controller;

import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/reset-password")
public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String otp = req.getParameter("otp");
        String newPassword = req.getParameter("newPassword");
        
        UserService service = new UserServiceImpl();
        User user = service.getByEmail(email);

        if (user != null && user.getOtp() != null && user.getOtp().equals(otp)) {
            user.setPassword(newPassword);
            user.setOtp(null); // Clear OTP after success
            service.update(user);
            req.setAttribute("alert", "Cập nhật mật khẩu thành công. Vui lòng đăng nhập!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("alert", "Mã OTP không chính xác.");
            req.setAttribute("email", email);
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
        }
    }
}
