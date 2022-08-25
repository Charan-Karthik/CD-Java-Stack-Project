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
<title>FireteamFinder - Dashboard</title>
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
<link rel="stylesheet" href="/CSS/dashboardStyle.css">
<!-- <script src="{{ JS PATH }}"></script> -->
</head>
<body>
	<div class="container mt-4 fixed-top">
		<c:if test="${username == null}">
			<div class="d-flex justify-content-between align-items-center">
				<a
					href="https://www.paypal.com/donate/?business=XQPVNXAPA35XW&no_recurring=0&item_name=Support+further+development+for+Fireteam+Finder&currency_code=USD"
					class="btn" style="background-color: #EE82EE">Support this
					Project!</a> <a href="/loginreg" class="btn btn-dark">Sign Up/Log
					In</a>
			</div>
		</c:if>
		<c:if test="${username != null}">
			<div
				class="dropdown d-flex justify-content-between align-items-center">
				<a
					href="https://www.paypal.com/donate/?business=XQPVNXAPA35XW&no_recurring=0&item_name=Support+further+development+for+Fireteam+Finder&currency_code=USD"
					class="btn" style="background-color: #EE82EE">Support this
					Project!</a>
				<button class="btn btn-secondary dropdown-toggle" type="button"
					data-bs-toggle="dropdown" aria-expanded="false">Welcome, <c:out value="${username}"/> </button>
				<ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end">
<!-- 					<li><a class="dropdown-item" href="/account/info">Account
							Info</a></li>
					<li><hr class="dropdown-divider"></li> -->
					<li><a class="dropdown-item text-danger" href="/logout">Log
							Out</a></li>
				</ul>
			</div>
		</c:if>
	</div>
	<div class="mainContainer">
		<h1 style="color: #FFD700">Destiny 2: Fireteam Finder</h1>
		<div>
			<p style="color: #C0C0C0">
				<em>Select Platform</em>
			</p>
		</div>
		<div id="platformSelector">
			<div>
				<a href="/destiny/groups/all/platforms" class="btn btn-secondary">ANY</a>
			</div>
			<div>
				<a href="/destiny/groups/playstation" class="btn btn-primary">PlayStation</a>
			</div>
			<div>
				<a href="/destiny/groups/xbox" class="btn btn-success">XBox</a>
			</div>
			<div>
				<a href="/destiny/groups/pc" class="btn btn-info">PC</a>
			</div>
		</div>
	</div>
	<div
		class="d-flex justify-content-center align-items-center fixed-bottom">
		<a href="/all/games" class="btn btn-lg btn-outline-light">LFG
			Platform for Other Games</a>
	</div>
</body>
</html>