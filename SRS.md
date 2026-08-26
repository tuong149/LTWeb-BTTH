# System Requirement Specification (SRS)

## 1. Mục tiêu dự án
Xây dựng một ứng dụng web Java theo kiến trúc 3 tầng (3-tier architecture) và mô hình MVC (Model - View - Controller). Ứng dụng cung cấp các tính năng quản lý tài khoản người dùng (Login, Register, Phân quyền) và quản lý danh mục sản phẩm (CRUD Category có hỗ trợ upload hình ảnh).

## 2. Công nghệ sử dụng (Đã điều chỉnh theo Project)
Dựa trên cấu hình `pom.xml` của project `ShoppingServletServiceMVC`, công nghệ được sử dụng bao gồm:
- **Ngôn ngữ & Nền tảng:** Java 17.
- **Web Server:** Apache Tomcat 10+ (sử dụng `jakarta.servlet-api` thay vì `javax.servlet-api`).
- **Kiến trúc:** Mô hình MVC (Model - View - Controller) kết hợp kiến trúc 3 tầng (Presentation - Business Logic - Data Access).
- **Thư viện Web:** 
  - `jakarta.servlet-api` 6.0.0.
  - `jakarta.servlet.jsp-api` 3.1.1.
  - `jakarta.servlet.jsp.jstl-api` 3.0.0.
- **Cơ sở dữ liệu:** MySQL (thay cho SQL Server trong file PDF) sử dụng `mysql-connector-j` 8.3.0.
- **Xử lý File Upload:** Sử dụng API chuẩn của Jakarta EE (`@MultipartConfig` và `Part`) thay cho `commons-fileupload` như trong hướng dẫn (vì `commons-fileupload` cũ chỉ tương thích `javax`, sử dụng API chuẩn sẽ giúp dự án gọn nhẹ và hiện đại hơn).

## 3. Phân rã chức năng
### 3.1. Quản lý người dùng (User Management)
- **Đăng nhập (Login):**
  - Người dùng nhập username và password.
  - Hệ thống kiểm tra trong Database.
  - Phân quyền (Admin/User) sau khi đăng nhập thành công và chuyển hướng đến trang tương ứng.
  - Hỗ trợ cookie (Remember me) (nếu cần).
- **Đăng ký (Register):**
  - Nhập thông tin tài khoản mới.
  - Kiểm tra trùng lặp email, username.
  - Mã hóa password (tùy chọn) và lưu vào Database.

### 3.2. Quản lý danh mục (Category Management - CRUD)
- **Danh sách danh mục (Read):** Hiển thị danh sách các danh mục (ID, Name, Icon).
- **Thêm danh mục (Create):** 
  - Form nhập tên danh mục và upload hình ảnh (Icon).
  - Lưu hình ảnh vào thư mục máy chủ và lưu đường dẫn vào Database.
- **Sửa danh mục (Update):**
  - Cập nhật tên danh mục.
  - Có thể thay đổi hoặc giữ nguyên hình ảnh cũ. Nếu thay đổi, xóa hình cũ và lưu hình mới.
- **Xóa danh mục (Delete):**
  - Xóa record trong Database dựa trên ID.
  - (Tùy chọn) Xóa luôn hình ảnh tương ứng trên ổ cứng.
- **Tải ảnh (Download Image):** Controller chuyên dụng để đọc và hiển thị hình ảnh từ ổ cứng lên giao diện Web.

## 4. Cấu trúc mã nguồn
- `vn.iotstar.model`: Chứa các lớp Entity (User, Category).
- `vn.iotstar.dao`: Chứa các Interface DAO (UserDao, CategoryDao).
- `vn.iotstar.dao.impl`: Chứa các lớp thực thi truy vấn Database bằng JDBC (UserDaoImpl, CategoryDaoImpl).
- `vn.iotstar.service`: Chứa Interface Business Logic (UserService, CategoryService).
- `vn.iotstar.service.impl`: Chứa lớp thực thi Business Logic (UserServiceImpl, CategoryServiceImpl).
- `vn.iotstar.controller`: Chứa các Servlet đóng vai trò Controller.
- `vn.iotstar.connection`: Chứa lớp cấu hình kết nối Database (`DBConnection`).
- `vn.iotstar.util`: Các hằng số (Constants), đường dẫn lưu file...
- `src/main/webapp/views/`: Chứa các file JSP (login, register, danh sách category...).
