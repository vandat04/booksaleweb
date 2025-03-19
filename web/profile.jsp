<%-- 
    Document   : profile
    Created on : Mar 15, 2025, 4:24:06 PM
    Author     : ACER
--%>


<%@page import="java.util.List"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>

<div class="container mt-5">
    <h2 class="mb-4">
        <a href="index.jsp" class="btn btn-outline-secondary">
            <i class="fa-solid fa-arrow-left"></i> Back
        </a>
        User Profile
    </h2>
    <% Users profile = (Users) request.getSession().getAttribute("user");
                if (profile == null) { %>
    <p class="text-danger">User profile not found.</p>
    <% } else {
        boolean isAdmin = profile.isAdmin();
        if (isAdmin) { // Nếu là admin, hiển thị danh sách user %>
    <h3 class="mt-5">All Users</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Users> userList = (List<Users>) request.getAttribute("userList");
                if (userList != null) {
                    for (Users user : userList) {
            %>
            <tr>
                <td><%= user.getUserID()%></td>
                <td><%= user.getUsername()%></td>
                <td><%= user.getFullName()%></td>
                <td><%= user.getEmail()%></td>
                <td><%= user.getPhone()%></td>
                <td><%= user.getAddress()%></td>
                <td><%= user.isAdmin() ? "Admin" : "User"%></td>
                <td>
                    <div style="display: flex; gap: 3px;">
                        <!-- Edit Button (Green) -->
                        <a href="editProfileByAdmin.jsp?userID=<%= user.getUserID()%>&adminID=<%= profile.getUserID()%>" class="btn btn-success btn-sm" style="white-space: nowrap;">Edit</a>

                        <!-- Delete Button (Red) -->
                        <form action="ProfileEditByAdminServlet" method="post" style="white-space: nowrap;">
                            <input type="hidden" name="type" value="delete">
                            <input type="hidden" name="adminID" value="<%= profile.getUserID()%>">
                            <input type="hidden" name="userID" value="<%= user.getUserID()%>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>

                        <!-- Up Level Button (Green) -->
                        <form action="ProfileEditByAdminServlet" method="post" style="white-space: nowrap;">
                            <input type="hidden" name="type" value="isadmin">
                            <input type="hidden" name="adminID" value="<%= profile.getUserID()%>">
                            <input type="hidden" name="userID" value="<%= user.getUserID()%>">
                            <input type="hidden" name="adminAccept" value="true">
                            <button type="submit" class="btn btn-success btn-sm">Up Level</button>
                        </form>

                        <!-- Down Level Button (Red) -->
                        <form action="ProfileEditByAdminServlet" method="post" style="white-space: nowrap;">
                            <input type="hidden" name="type" value="isadmin">
                            <input type="hidden" name="adminID" value="<%= profile.getUserID()%>">
                            <input type="hidden" name="userID" value="<%= user.getUserID()%>">
                            <input type="hidden" name="adminAccept" value="false">
                            <button type="submit" class="btn btn-danger btn-sm">Down Level</button>
                        </form>
                    </div>

                </td>
            </tr>
            <%
                    }
                } %>
        </tbody>
    </table>
    <% } else {
            request.getRequestDispatcher("editProfileByUser.jsp").forward(request, response);
        } %> 
    <% }%> <!-- Kết thúc kiểm tra user -->
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
