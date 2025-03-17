<%-- 
    Document   : searchByUser
    Created on : Mar 17, 2025, 1:49:06 PM
    Author     : ACER
--%>

<%@page import="model.Users"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="model.Books"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<div class="container mt-4">
    <% Users userForSearch = (Users) session.getAttribute("user");%>
    <h2 class="mb-4">
        <a href="index.jsp" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left"></i> Back
        </a>
        Search Book
    </h2>

    <!-- Form tìm kiếm -->
    <form action="SearchProductByUser" method="post" class="row g-3 bg-light p-4 rounded shadow-sm">
        <div class="col-md-4">
            <label for="title" class="form-label fw-bold">Search by Title</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Enter book title">
        </div>
        <div class="col-md-4">
            <label for="genre" class="form-label fw-bold">Search by Genre</label>
            <input type="text" class="form-control" id="genre" name="genre" placeholder="Enter book genre">
        </div>
        <div class="col-md-4">
            <label for="year" class="form-label fw-bold">Search by Year Published</label>
            <input type="number" class="form-control" id="year" name="year" placeholder="Enter year">
        </div>
        <div class="col-12 text-center">
            <button type="submit" class="btn btn-primary px-4">Search</button>
        </div>
    </form>

    <hr>

    <!-- Kết quả tìm kiếm -->
    <h2 class="text-center my-4">List of Books</h2>
    
    <c:choose>
        <c:when test="${not empty books}">
            <div class="container">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <c:forEach var="book" items="${books}">
                        <div class="col">
                            <div class="card h-100 shadow-sm">
                                <img src="<%=request.getContextPath()%>${book.imagePath}" alt="${book.title}" class="card-img-top img-fluid p-2"/>
                                <div class="card-body text-center">
                                    <h5 class="card-title fw-bold">${book.title}</h5>
                                    <p class="card-text"><strong>Genre:</strong> ${book.genre}</p>
                                    <p class="card-text"><strong>Price:</strong> ${book.price} USD</p>
                                    <p class="card-text"><strong>Language:</strong> ${book.language}</p>
                                </div>
                                <div class="card-footer text-center bg-white">
                                    <form action="GetDetailsServlet" method="POST">
                                        <input type="hidden" name="bookID" value="${book.bookID}">
                                        <input type="hidden" name="userID" value="${userForSearch.userID}">
                                        <button type="submit" class="btn btn-outline-primary w-100">View Details</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <p class="text-center text-danger fw-bold">No Books Found</p>
        </c:otherwise>
    </c:choose>
</div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

