<%-- 
    Document   : listProductByAdmin
    Created on : Mar 17, 2025, 11:52:55 AM
    Author     : ACER
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="model.Books"%>
<%@page import="model.BooksDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<div class="container mt-4">
    <h2 class="text-center mb-4">
        <a href="addProductByAdmin.jsp" class="btn btn-outline-secondary">
            <i class="fa-solid fa-arrow-left"></i> Add New Book
        </a>
        Book List
    </h2>

    <div class="table-container">
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr> 
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Genre</th>
                    <th>Year</th>
                    <th>Publisher</th>
                    <th>Description</th>
                    <th>Total Copies</th>
                    <th>Available Copies</th>
                    <th>Price</th>
                    <th>Page Count</th>
                    <th>Language</th>
                    <th>Added Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%  List<Books> bookList = BooksDB.getAllList();
                    for (Books book : bookList) {
                %>
                <tr>
                    <td><%= book.getBookID()%></td>
                    <td><%= book.getTitle()%></td>
                    <td><%= book.getAuthor()%></td>
                    <td><%= book.getGenre()%></td>
                    <td><%= book.getPublishedYear()%></td>
                    <td><%= book.getPublisher()%></td>
                    <td style="max-width: 200px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                        <%= book.getDescription()%>
                    </td>
                    <td><%= book.getTotalCopies()%></td>
                    <td><%= book.getAvailableCopies()%></td>
                    <td>$<%= book.getPrice()%></td>
                    <td><%= book.getPageCount()%></td>
                    <td><%= book.getLanguage()%></td>
                    <td><%= book.getAddedDate()%></td>
                    <td>
                        <!-- Edit Form -->
                        <form action="EditProductServlet" method="get" class="d-inline">
                            <input type="hidden" name="bookID" value="<%= book.getBookID()%>">
                            <button type="submit" class="btn btn-warning btn-sm">Edit</button>
                        </form>

                        <!-- Delete Form -->
                        <form action="DeleteProductServlet" method="get" class="d-inline" onsubmit="return confirmDelete();" >
                            <input type="hidden" name="bookID" value="<%= book.getBookID()%>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </div>
</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
                            function confirmDelete(bookID) {
                                return confirm("Are you sure you want to delete this book (ID: " + bookID + ")?");
                            }
</script>

<style>
    body {
        font-size: 16px;
    }
    .table-container {
        width: 100%;
        overflow-x: auto;
    }
    table {
        width: 100%;
        font-size: 14px; /* Điều chỉnh kích thước chữ */
        white-space: nowrap; /* Giữ văn bản không bị ngắt dòng */
    }
    th, td {
        text-align: center; /* Căn giữa nội dung */
        vertical-align: middle;
        padding: 10px;
    }
    .btn-sm {
        font-size: 12px;
    }
</style>

