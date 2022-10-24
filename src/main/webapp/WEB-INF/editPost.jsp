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
<link rel="stylesheet" href="/css/editPost.css"> <!-- change to match your file/naming structure -->
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

	<h1 class="text-center">Edit a Post</h1>
	
	<div class="conainer border-test mt-5">
		<form:form action="/posts/${blog.id}/edit" method="post" modelAttribute="blog"> 
			<input type="hidden" name="_method" value="put" />
			<form:hidden path="poster" value="${blog.poster.id}" />
			<div class="container border-within">
			
				<div class="form-group mt-2">
					<form:label path="blogTitle">Post Title:</form:label>
					<form:input path="blogTitle" class="form-control" />
					<form:errors path="blogTitle" class="text-danger" />
				</div>
				<div class="form-group mt-2">
					<form:label path="blogSubTitle">Post SubTitle:</form:label>
					<form:input path="blogSubTitle" class="form-control" />
					<form:errors path="blogSubTitle" class="text-danger" />
				</div>
				<div class="form-group mt-2">
					<form:label path="description">Post description:</form:label>
					<form:textarea path="description" class="form-control" />
					<form:errors path="description" class="text-danger" />
				</div>
				<button class="btn btn-primary mt-2">Edit a Post</button>
			</div>
		</form:form>
	</div>

</body>