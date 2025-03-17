<%-- 
    Document   : listproduct
    Created on : Mar 16, 2025, 7:26:28 PM
    Author     : ACER
--%>

<%@page import="model.BooksDB"%>
<%@page import="model.Books"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // Lấy danh sách sách nếu user đã đăng nhập
    Users userListProductByUser = (Users) session.getAttribute("user");
    ArrayList<Books> bookListForUser = (ArrayList) BooksDB.getAllList();
    request.setAttribute("bookListForUser", bookListForUser);
    if (userListProductByUser == null || !userListProductByUser.isAdmin()) {
        request.setAttribute("userListProductByUser", userListProductByUser);
%>
<div class="container">
    <hr/>
    <h2 class="text-center my-4">List Book</h2>
    <c:choose>
        <c:when test="${not empty bookListForUser}">
            <div class="row">
                <c:forEach var="book" items="${bookListForUser}" varStatus="status">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body">
                                <img src="<%=request.getContextPath()%>${book.imagePath}" alt="${book.title}" class="img-fluid"/>
                                <h5 class="card-title">Title: ${book.title}</h5>
                                <p class="card-text">Genre: ${book.genre}</p>
                                <p class="card-text">Price: ${book.price}</p>
                                <p class="card-text">Language: ${book.language}</p>
                            </div>
                            <div class="card-footer text-center">  
                                <form action="GetDetailsServlet" method="POST">
                                    <input type="hidden" name="userID" value="${userListProductByUser.userID}">
                                    <input type="hidden" name="bookID" value="${book.bookID}">
                                    <button type="submit" class="btn btn-primary">View Details</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Xuống hàng sau mỗi 3 sản phẩm -->
                    <c:if test="${(status.index + 1) % 3 == 0}">
                    </div><div class="row">
                    </c:if>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <p class="text-center">No Books Found</p>
        </c:otherwise>
    </c:choose>
</div>
<%} else {
        request.getRequestDispatcher("listProductByAdmin.jsp").forward(request, response);
    }
%>

