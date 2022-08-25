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
<title>FireTeam Finder Beta</title>
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
<body style="background-color: #1d232f">
	<div class="container mt-4">
		<div class="d-flex justify-content-between align-items-center">
			<a href="/" class="btn btn-outline-light">Home</a>
			<c:if test="${username == null}">
				<div class="d-flex justify-content-end align-items-center">
					<a href="/loginreg" class="btn btn-outline-light">Sign Up/Log
						In</a>
				</div>
			</c:if>
			<c:if test="${username != null}">
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
			</c:if>
		</div>
	</div>
	<div class="container mt-3 mb-5">
		<h1 class="text-center" style="color: white">All Games</h1>
		<div class="d-flex justify-content-center">
			<a href="/new/game" class="btn btn-success">Add a New Game</a>
		</div>
	</div>
	<div class="container">
		<div class="d-flex justify-content-evenly flex-wrap">
			<c:forEach var="g" items="${allGames}">
				<div class="card mb-4" style="width: 18rem;">
					<img src="${g.imageURL}" class="card-img-top"
						alt="${g.title} game art">
					<div class="card-body text-center"
						style="background-color: #C0C0C0">
						<h5 class="card-title">
							<c:out value="${g.title}" />
						</h5>
						<a href="/game/${g.id}" class="btn btn-primary">View LFG
							Requests</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>