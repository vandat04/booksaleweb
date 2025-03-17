<%-- 
    Document   : addProductByAdmin
    Created on : Mar 17, 2025, 1:16:24 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form action="AddNewBookServlet" method="post" class="container mt-4 p-4 border rounded shadow-lg bg-light">
    <h2 class="text-center mb-4">
        <a href="listProductByUser.jsp" class="btn btn-outline-secondary">
            <i class="fa-solid fa-arrow-left"></i> Back
        </a>
        Add New Book
    </h2>

    <div class="mb-3">
        <label for="title" class="form-label">Title:</label>
        <input type="text" class="form-control" id="title" name="title" required>
    </div>

    <div class="mb-3">
        <label for="author" class="form-label">Author:</label>
        <input type="text" class="form-control" id="author" name="author" required>
    </div>

    <div class="mb-3">
        <label for="genre" class="form-label">Genre:</label>
        <input type="text" class="form-control" id="genre" name="genre" required>
    </div>

    <div class="mb-3">
        <label for="publishedYear" class="form-label">Published Year:</label>
        <input type="number" class="form-control" id="publishedYear" name="publishedYear" min="1000" max="2100" required>
    </div>

    <div class="mb-3">
        <label for="publisher" class="form-label">Publisher:</label>
        <input type="text" class="form-control" id="publisher" name="publisher" required>
    </div>

    <div class="mb-3">
        <label for="description" class="form-label">Description:</label>
        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
    </div>

    <div class="mb-3">
        <label for="totalCopies" class="form-label">Total Copies:</label>
        <input type="number" class="form-control" id="totalCopies" name="totalCopies" min="0" required>
    </div>

    <div class="mb-3">
        <label for="availableCopies" class="form-label">Available Copies:</label>
        <input type="number" class="form-control" id="availableCopies" name="availableCopies" min="0" required>
    </div>

    <div class="mb-3">
        <label for="price" class="form-label">Price ($):</label>
        <input type="number" step="0.01" class="form-control" id="price" name="price" min="0" required>
    </div>

    <div class="mb-3">
        <label for="imagePath" class="form-label">Image Path:</label>
        <input type="text" class="form-control" id="imagePath" name="imagePath">
    </div>

    <div class="mb-3">
        <label for="pageCount" class="form-label">Page Count:</label>
        <input type="number" class="form-control" id="pageCount" name="pageCount" min="1" required>
    </div>

    <div class="mb-3">
        <label for="language" class="form-label">Language:</label>
        <input type="text" class="form-control" id="language" name="language" required>
    </div>


    <div class="d-flex justify-content-between"> 
        <button type="submit" class="btn btn-primary">Add New Book</button>
    </div>
</form>
