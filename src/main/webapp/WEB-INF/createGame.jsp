<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fireteam Finder - Create Game</title>
<!-- get Bootstrap from web -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<!-- for CSS and/or JS -->
<!-- <link rel="stylesheet" href="{{ CSS PATH }}"> -->
<!-- <script src="{{ JS PATH }}"></script> -->
</head>
<body style="background-color: #1d232f; color: white">
	<div class="container mt-4">
		<div class="d-flex justify-content-between align-items-center">
			<a href="/" class="btn btn-outline-light">Home</a>
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					data-bs-toggle="dropdown" aria-expanded="false">
					Welcome,
					<c:out value="${username}" />
				</button>
				<ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end">
					<!-- <li><a class="dropdown-item" href="/account/info">Account
							Info</a></li>
					<li><hr class="dropdown-divider"></li> -->
					<li><a class="dropdown-item text-danger" href="/logout">Log
							Out</a></li>
				</ul>
			</div>
		</div>

		<h1 class="text-center mt-3 mb-4">Add a Game for LFG Requests!</h1>

		<div class="d-flex justify-content-center">
			<form:form action="/create/game" method="post"
				modelAttribute="newGame" class="w-50">

				<div class="form-group mb-3">
					<form:label path="title" class="form-label">Game Title:</form:label>
					<form:input path="title" class="form-control" />
					<form:errors path="title" class="text-danger" />
				</div>

				<div class="form-group mb-3">
					<form:label path="imageURL" class="form-label">Game Image URL:</form:label>
					<form:input path="imageURL" class="form-control" type="url" />
					<form:errors path="imageURL" class="text-danger" />
				</div>

				<div class="d-flex justify-content-between align-items-center">
					<a href="/all/games" class="btn btn-warning">Cancel</a> <input
						type="submit" value="Submit" class="btn btn-success" />
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>