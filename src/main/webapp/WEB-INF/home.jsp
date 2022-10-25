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
	
    <nav class="navbar navbar-expand-lg bg-light sticky-top">
        <div class="container-fluid">
            <h2>Welcome, <c:out value="${ username }"/></h2>
            <div class="collapse navbar-collapse " id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link active" href="/home">Home</a>
                    <a class="nav-link" href="/posts/new">Create Post</a>
                    <a class="nav-link" href="/your/posts">View Your Posts</a>
                </div>
            </div>
            <a class="float-end btn btn-danger" href="/logout">Logout</a>
        </div>
    </nav>
	
	
	<h1 class="text-center">All the posts</h1>
	<br/>
	
	<div class="container border-test">
		<c:forEach var="blog" items="${blogs}"> 
			
			<div class="container border-post">
				<h3>Post#: ${blog.id}</h3>	
				<h3>Post Title: ${blog.blogTitle}</h3>	
				<h5>Post SubTitle: ${blog.blogSubTitle}</h5>
				<p>Post Description: ${blog.description}</p>	
				<strong> ${blog.poster.userName}</strong>
				
				<!-- This div is to make the user who posted and edit + delete button on the same line -->
				<div class="d-flex float-end">
				
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
				</div>
			
			</div>
		</c:forEach>		
	</div>
</body>
</html>