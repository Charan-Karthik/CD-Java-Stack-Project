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
<title>Fireteam Finder - Edit LFG Request</title>
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

		<h1 class="text-center mt-2 mb-4">Edit Your LFG Request</h1>

		<div class="d-flex justify-content-center">
			<form:form action="/destiny/request/submit/changes" method="post"
				modelAttribute="thisRequest" class="w-50">

				<input type="hidden" name="_method" value="put">
				<form:input type="hidden" path="id" />
				<form:input type="hidden" path="requestor" />

				<div class="form-group mb-3">
					<form:label path="platform" class="form-label">Game Platform:</form:label>
					<form:select path="platform" class="form-select">
						<form:option value="Any">Any</form:option>
						<form:option value="PlayStation">PlayStation</form:option>
						<form:option value="Xbox">Xbox</form:option>
						<form:option value="PC">PC</form:option>
					</form:select>
					<form:errors path="platform" class="text-danger" />
				</div>

				<div class="form-group mb-3">
					<form:label path="gamertag" class="form-label">Gamertag (for contacting purposes):</form:label>
					<form:input path="gamertag" class="form-control" />
					<form:errors path="gamertag" class="text-danger" />
				</div>

				<div class="form-group mb-3">
					<form:label path="activity" class="form-label">Activity Name:</form:label>
					<form:input path="activity" class="form-control" />
					<form:errors path="activity" class="text-danger" />
				</div>

				<div class="form-group mb-3">
					<form:label path="guardianLimit" class="form-label">Guardian Limit for Activity:</form:label>
					<form:input path="guardianLimit" class="form-control" type="number" />
					<form:errors path="guardianLimit" class="text-danger" />
				</div>

				<div class="form-group mb-3">
					<form:label path="guardiansNeeded" class="form-label">Number of Guardians Still Needed:</form:label>
					<form:input path="guardiansNeeded" class="form-control"
						type="number" />
					<form:errors path="guardiansNeeded" class="text-danger" />
				</div>

				<div class="form-group mb-4">
					<form:label path="description" class="form-label">Description:</form:label>
					<form:textarea path="description" class="form-control"></form:textarea>
					<form:errors path="description" class="text-danger" />
				</div>

				<div class="d-flex justify-content-between align-items-center">
					<a href="/destiny/activity/${thisRequest.id}"
						class="btn btn-warning">Cancel</a> <input type="submit"
						value="Submit Changes" class="btn btn-success" />
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>