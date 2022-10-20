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
<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1 class="text-center">Create a Post</h1>
	<div class="conainer mt-5">
		<form:form action="/posts/new" method="post" modelAttribute="blog"> 
			<form:hidden path="poster" value="${userId}" />
			<div class="form-group">
				<form:label path="blogTitle">Post Title:</form:label>
				<form:input path="blogTitle" class="form-control" />
				<form:errors path="blogTitle" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="blogSubTitle">Post SubTitle:</form:label>
				<form:input path="blogSubTitle" class="form-control" />
				<form:errors path="blogSubTitle" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="description">Post description:</form:label>
				<form:input path="description" class="form-control" />
				<form:errors path="description" class="text-danger" />
			</div>
			<button class="btn btn-primary">Create a Post</button>
		</form:form>
	</div>
</body>
</html> 