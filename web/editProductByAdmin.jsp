<%-- 
    Document   : editBookByAdmin
    Created on : Mar 17, 2025, 12:33:01 PM
    Author     : ACER
--%>

<%@page import="model.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% Books bookForEdit = (Books) request.getAttribute("bookForEdit");%>

<form action="EditProductServlet" method="post" class="container mt-4 p-4 border rounded shadow-lg bg-light">
    <h2 class="text-center mb-4">
        <a href="listProductByUser.jsp" class="btn btn-outline-secondary">
            <i class="fa-solid fa-arrow-left"></i> Back
        </a>
        Edit Book
    </h2>

    <div class="mb-3">
        <label for="bookID" class="form-label">Book ID:</label>
        <input type="text" class="form-control" id="bookID" name="bookID" value="<%= bookForEdit.getBookID()%>" readonly>
    </div>

    <div class="mb-3">
        <label for="title" class="form-label">Title:</label>
        <input type="text" class="form-control" id="title" name="title" value="<%= bookForEdit.getTitle()%>" required>
    </div>

    <div class="mb-3">
        <label for="author" class="form-label">Author:</label>
        <input type="text" class="form-control" id="author" name="author" value="<%= bookForEdit.getAuthor()%>" required>
    </div>

    <div class="mb-3">
        <label for="genre" class="form-label">Genre:</label>
        <input type="text" class="form-control" id="genre" name="genre" value="<%= bookForEdit.getGenre()%>" required>
    </div>

    <div class="mb-3">
        <label for="publishedYear" class="form-label">Published Year:</label>
        <input type="number" class="form-control" id="publishedYear" name="publishedYear" value="<%= bookForEdit.getPublishedYear()%>" required>
    </div>

    <div class="mb-3">
        <label for="publisher" class="form-label">Publisher:</label>
        <input type="text" class="form-control" id="publisher" name="publisher" value="<%= bookForEdit.getPublisher()%>" required>
    </div>

    <div class="mb-3">
        <label for="description" class="form-label">Description:</label>
        <textarea class="form-control" id="description" name="description" rows="3" required><%= bookForEdit.getDescription()%></textarea>
    </div>

    <div class="mb-3">
        <label for="totalCopies" class="form-label">Total Copies:</label>
        <input type="number" class="form-control" id="totalCopies" name="totalCopies" value="<%= bookForEdit.getTotalCopies()%>" required>
    </div>

    <div class="mb-3">
        <label for="availableCopies" class="form-label">Available Copies:</label>
        <input type="number" class="form-control" id="availableCopies" name="availableCopies" value="<%= bookForEdit.getAvailableCopies()%>" required>
    </div>

    <div class="mb-3">
        <label for="price" class="form-label">Price ($):</label>
        <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= bookForEdit.getPrice()%>" required>
    </div>

    <div class="mb-3">
        <label for="imagePath" class="form-label">Image Path:</label>
        <input type="text" class="form-control" id="imagePath" name="imagePath" value="<%= bookForEdit.getImagePath()%>">
    </div>

    <div class="mb-3">
        <label for="pageCount" class="form-label">Page Count:</label>
        <input type="number" class="form-control" id="pageCount" name="pageCount" value="<%= bookForEdit.getPageCount()%>" required>
    </div>

    <div class="mb-3">
        <label for="language" class="form-label">Language:</label>
        <input type="text" class="form-control" id="language" name="language" value="<%= bookForEdit.getLanguage()%>" required>
    </div>

    <div class="mb-3">
        <label for="addedDate" class="form-label">Added Date:</label>
        <input type="text" class="form-control" id="addedDate" name="addedDate" value="<%= bookForEdit.getAddedDate()%>" readonly>
    </div>

    <div class="d-flex justify-content-between"> 
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </div>
</form>
