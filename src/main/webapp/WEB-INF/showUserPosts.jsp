<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Posts</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/general.css"> <!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	
	<nav class="navbar navbar-expand-lg bg-light sticky-top">
        <div class="container-fluid">
            <h2>Welcome, <c:out value="${ username }"/></h2>
            <div class="collapse navbar-collapse " id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link active " href="/home">Home</a>
                    <a class="nav-link" href="/posts/new">Create Post</a>
                    <a class="nav-link" href="/your/posts">View Your Posts</a>
                </div>
            </div>
            <a class="float-end btn btn-danger" href="/logout">Logout</a>
        </div>
    </nav>

	<h1 class="text-center">Your posts</h1>
	
	<div class="container">
		<c:forEach var="blog" items="${user.postBlog}"> 
			<div class="container border-post mt-3">
				<h3>Post#: ${blog.id}</h3>	
				<h3>Post Title: ${blog.blogTitle}</h3>	
				<h5>Post SubTitle: ${blog.blogSubTitle}</h5>
				<p>Post Description: ${blog.description}</p>	
				<strong> Created by: ${blog.poster.userName}</strong>
				<div class="d-flex float-end">
					<c:choose> 
						<c:when test="${blog.poster.id.equals(userId) }"> 	
							<a class="btn btn-warning margin-right" href="/posts/${blog.id}/edit">Edit</a>
						
							<form action="/posts/${blog.id}/delete" method="post"> 
								<input type="hidden" name="_method" value="delete" />
								<button class="btn btn-danger margin-left">Delete</button>
							</form>
						</c:when>
						<c:otherwise> 
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>