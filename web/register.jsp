<%-- 
    Document   : register
    Created on : Mar 15, 2025, 10:21:09 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Register JSP Page</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background-color: #f8f9fa;
                height: 100vh;
            }
            .form-container {
                width: 40%; /* Chiếm 40% màn hình */
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body class="d-flex align-items-center justify-content-center">
        <%
            String error = request.getParameter("error");
        %>

        <div class="form-container">
            <h3 class="text-center mb-4">Sign Up</h3>

            <form action="RegisterServlet" method="post">
                <%    if ("1".equals(error)) {
                %>
                <div class="alert alert-danger">
                    <span class="text-danger"><b>Sign up Fail!</b> Username or Email already exists.</span>
                </div>
                <%
                    }
                %>
                <!-- Nhập Username -->
                <div class="mb-3">
                    <label for="username" class="form-label">UserName: </label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>

                <!-- Nhập Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password: </label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>  

                <!-- Nhập Full Name -->
                <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name: </label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>

                <!-- Nhập Email -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email: </label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <!-- Nhập Số điện thoại -->
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone: </label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>

                <!-- Nhập Địa chỉ -->
                <div class="mb-3">
                    <label for="address" class="form-label">Address: </label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>

                <!-- Nhập Ngày sinh -->
                <div class="mb-3">
                    <label for="dateOfBirth" class="form-label">Birthday: </label>
                    <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
                </div>

                <!-- Nút Đăng ký -->
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success">Sign up</button>
                    <a href="login.jsp" class="btn btn-outline-secondary">Back</a>
                </div>
            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
