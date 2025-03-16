<%-- 
    Document   : detailProduct
    Created on : Mar 16, 2025, 8:01:31 PM
    Author     : ACER
--%>

<%@page import="model.Feedbacks"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Books"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .book-detail {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 50px;
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .image-section img {
        width: 100%;
        border-radius: 10px;
    }
    .info-section {
        padding-left: 30px;
    }
    .btn-primary {
        width: 100%;
    }
    .in-stock {
        color: green;
        font-weight: bold;
    }
    .out-of-stock {
        color: red;
        font-weight: bold;
    }
    .description {
        margin-top: 50px;
        padding: 20px;
        background: #f8f9fa;
        border-radius: 10px;
    }
    .feedback-section {
        margin-top: 50px;
    }
    .feedback-item {
        border-bottom: 1px solid #ddd;
        padding: 10px 0;
    }
    .date {
        font-size: 0.9em;
        color: gray;
    }
    .feedback-form {
        display: flex;
        gap: 10px;
        align-items: center;
    }
    .feedback-form .form-control {
        flex: 8;
        height: 180px;
    }
    .feedback-form .btn-submit {
        flex: 2;
        height: 50px;
        white-space: nowrap;
    }
    .back-btn {
        margin-top: 20px;
    }
    .rating {
        display: flex;
        flex-direction: row-reverse;
        justify-content: flex-start;
        font-size: 30px;
    }
    .rating input {
        display: none;
    }
    .rating label {
        cursor: pointer;
        color: gray;
        transition: color 0.2s;
    }
    .rating input:checked ~ label {
        color: gold;
    }
</style>
<%  String err = request.getParameter("err");
    int error;
    try {
        error = Integer.parseInt(err);
    } catch (Exception e) {
    }
    Users userForDetail = (Users) session.getAttribute("user");
    Books bookDetails = (Books) session.getAttribute("bookDetailForUser");
    ArrayList<Feedbacks> feedback = (ArrayList) session.getAttribute("feedback");
    request.setAttribute("userForDetail", userForDetail);
    request.setAttribute("bookDetails", bookDetails);
    request.setAttribute("feedback", feedback);
%>
<div class="container">
    <a href="index.jsp" class="btn btn-secondary back-btn">Back to Home</a>
    <div class="row book-detail">
        <div class="col-md-4 image-section">
            <img src="<%=request.getContextPath()%>/images/QR1.png" alt="${bookDetails.title}" class="book-image">
        </div>
        <div class="col-md-8 info-section">
            <h1>${bookDetails.title}</h1>
            <p><strong>Author: </strong> ${bookDetails.author}</p>
            <p><strong>Genre: </strong> ${bookDetails.genre}</p>
            <p><strong>Published Year: </strong> ${bookDetails.publishedYear}</p>
            <p><strong>Publisher: </strong> ${bookDetails.publisher}</p>
            <p><strong>Page Count: </strong> ${bookDetails.pageCount}</p>
            <p><strong>Language: </strong> ${bookDetails.language}</p>
            <p><strong>Price: </strong> ${bookDetails.price} vnđ</p>
            <p><strong>Status: </strong> 
                <span class="${bookDetails.availableCopies > 0 ? 'in-stock' : 'out-of-stock'}">
                    ${bookDetails.availableCopies > 0 ? "In Stock" : "Out Of Stock"} 
                </span>
            </p>
            <p><strong>Available Copies: </strong> ${bookDetails.availableCopies} / ${bookDetails.totalCopies} </p>

            <c:choose>
                <c:when test="${err == 1}">
                    <div class="alert alert-danger">
                        <span class="text-danger"><b>We Don't Have Enough Books</b></span>
                    </div>
                </c:when>
                <c:when test="${err == 0}">
                    <div class="alert alert-success">
                        <span class="text-success"><b>Add Successful</b></span>
                    </div>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${not empty userForDetail}"> 
                    <form action="AddToCardServlet" method="POST">
                        <input type="hidden" name="userID" value="${userForDetail.userID}">
                        <input type="hidden" name="bookID" value="${bookDetails.bookID}">
                        <input type="text"  name="numberOfBook">
                        <button type="submit" class="btn btn-primary">Add To Card</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="btn btn-primary">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="description">
        <h2>Description: </h2>
        <p>${bookDetails.description}</p>
    </div>

    <div class="feedback-section">
        <h2>User Reviews: </h2>
        <div class="feedback-list">
            <c:forEach var="fb" items="${feedback}">
                <div class="feedback-item">
                    <p><strong>UserID: ${fb.userID}:</strong> ${fb.comment}</p>
                    <p class="date">${fb.feedbackDate}</p>
                </div>
            </c:forEach>
        </div>

        <!-- Form nhập feedback -->
        <c:if test="${not empty userForDetail}">
            <h3>Submit Your Review: </h3>
            <form action="SubmitFeedbackServlet" method="post" class="feedback-form">
                <input type="hidden" name="userID" value="${userForDetail.userID}">
                <input type="hidden" name="bookID" value="${bookDetails.bookID}">
                <textarea name="comment" rows="6" class="form-control" name="comment" required placeholder="Enter your review..."></textarea>
                <label>Rating:</label>
                <div class="rating">
                    <input type="radio" id="star5" name="rating" value="5" required>
                    <label for="star5">★</label>

                    <input type="radio" id="star4" name="rating" value="4">
                    <label for="star4">★</label>

                    <input type="radio" id="star3" name="rating" value="3">
                    <label for="star3">★</label>

                    <input type="radio" id="star2" name="rating" value="2">
                    <label for="star2">★</label>

                    <input type="radio" id="star1" name="rating" value="1">
                    <label for="star1">★</label>
                </div>
                <button type="submit" class="btn btn-primary btn-submit">Send</button>
            </form>
        </c:if>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

