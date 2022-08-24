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
<title>Insert title here</title>
<!-- get Bootstrap from web -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- for CSS and/or JS -->
<!-- <link rel="stylesheet" href="{{ CSS PATH }}"> -->
<!-- <script src="{{ JS PATH }}"></script> -->
</head>
<body style="background-color: #1d232f; color: white">
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
						data-bs-toggle="dropdown" aria-expanded="false">Actions</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="/account/info">Account
								Info</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item text-danger" href="/logout">Log
								Out</a></li>
					</ul>
				</div>
			</c:if>
		</div>

		<h1 class="text-center mt-3">
			<c:out value="${thisGame.title}" />
			LFG Request Details
		</h1>

		<div class="text-center mt-5">
			<div class="mb-5">
				<h4>Platform</h4>
				<p>
					<c:out value="${thisRequest.platform}" />
				</p>
			</div>

			<div class="mb-5">
				<h4>Gamertag</h4>
				<h5>
					<em>(for contacting player)</em>
				</h5>
				<p>
					<c:out value="${thisRequest.gamertag}" />
				</p>
			</div>

			<div class="mb-5">
				<h4>Activity</h4>
				<p>
					<c:out value="${thisRequest.activity}" />
				</p>
			</div>

			<div class="mb-5">
				<h4>Player Count</h4>
				<p>
					<c:out
						value="${thisRequest.playersPresent}" />
					/
					<c:out value="${thisRequest.playerLimit}" />
				</p>
			</div>

			<div class="mb-5">
				<h4>Description</h4>
				<p>
					<c:out value="${thisRequest.description}" />
				</p>
			</div>
		</div>
	</div>
</body>
</html>