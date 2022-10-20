<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/home.css"> <!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="navbar">
		<h1>Welcome, <c:out value="${ username }"/></h1>
		<a class="btn btn-primary" href="/posts/new">Create a Post</a>
		<a class="btn btn-info" href="/your/posts">View your Posts</a>
		<a class="btn btn-danger" href="/logout">Logout</a>
	</div>
	<h1 class="text-center text-testing">All the posts</h1>
	<br/>
	<div class="container border-test">
		<c:forEach var="blog" items="${blogs}"> 
			<h3>Post#: ${blog.id}</h3>	
			<h3>Post Title: ${blog.blogTitle}</h3>	
			<h4>Post SubTitle: ${blog.blogSubTitle}</h4>
			<p>Post Description: ${blog.description}</p>	
			<strong> ${blog.poster.userName}</strong>
			<c:choose> 
				<c:when test="${blog.poster.id.equals(userId) }"> 	
					<a class="btn btn-warning" href="/posts/${blog.id}/edit">Edit</a>
				
					<form action="/posts/${blog.id}/delete" method="post"> 
						<input type="hidden" name="_method" value="delete" />
						<button class="btn btn-danger">Delete</button>
					</form>
				</c:when>
				<c:otherwise> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>