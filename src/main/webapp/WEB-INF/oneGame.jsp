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
<title>LFG Requests for <c:out value="${thisGame.title}"/></title>
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
			LFG Requests for
			"<c:out value="${thisGame.title}" />"
		</h1>
		<div class="d-flex justify-content-center">
			<a href="/game/${thisGame.id}/new/request" class="btn btn-success">Create
				LFG Request</a>
		</div>

		<table class="table table-dark table-striped mt-5 text-center">
			<thead>
				<tr>
					<th>Platform</th>
					<th>Activity</th>
					<th>Player Count</th>
					<th>Request Time</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${thisGame.requestsForGame}" var="oneReq">
				<tr>
					<td><c:out value="${oneReq.platform}"/></td>
					<td><a href="/game/${thisGame.id}/request/${oneReq.id}" style="color:white"><c:out value="${oneReq.activity}"/></a></td>
					<td><c:out value="${oneReq.playersPresent}"/> / <c:out value="${oneReq.playerLimit}"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd @ hh:mm a z" value="${oneReq.getCreatedAt()}" /></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>