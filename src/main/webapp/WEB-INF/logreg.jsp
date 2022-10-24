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
	<h1 class="text-center mt-3">Welcome! Please register to get started!</h1>
	<!-- Main page container -->
	<div class="container d-flex mt-3">
		<!-- Register Container -->
		<div class="container">	
			<h1>Register</h1>
			<!-- Register form -->
			<form:form action="/register" method="post" modelAttribute="newUser">
			<div class="form-group mt-3">
					<form:label path="userName">User Name:</form:label>
				<form:input path="userName" class="form-control" />
				<form:errors path="userName" class="text-danger" />
			</div>	
			<div class="form-group mt-3">
				<form:label path="email">Email:</form:label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" class="text-danger" />
			</div>	
			<div class="form-group mt-3">
				<label>Password:</label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" class="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label>Confirm Password:</label>
				<form:password path="confirm" class="form-control" />
				<form:errors path="confirm" class="text-danger" />
			</div>		
			<input type="submit" value="Register" class="btn btn-primary mt-3 w-100"/>
			</form:form>
		</div>
		<!-- End of Register container -->
		
		<!-- Login container -->
		<div class="container">		
			<h1> Login</h1>
	
			<!-- Login form -->
			<form:form action="/login" method="post" modelAttribute="newLogin">
			<div class="form-group mt-3">
				<form:label path="email">Email:</form:label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" class="text-danger" />
			</div>	
			<div class="form-group mt-3">
				<label>Password:</label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" class="text-danger" />
			</div>
			<input type="submit" value="Login" class="btn btn-primary mt-3 w-100" />
			</form:form>
		</div>	
		<!-- End of Login container -->
	</div>	
	<!-- End of main page -->	
</body>
</html> 