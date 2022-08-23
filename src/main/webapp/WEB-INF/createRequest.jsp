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
<title>Fireteam Finder - Create Request</title>
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
			<div class="d-flex justify-content-end align-items-center">
				<a href="/logout" class="btn btn-outline-danger">Log Out</a>
			</div>
		</div>

		<h1 class="text-center mt-2 mb-4">Create an LFG Request</h1>

		<div class="d-flex justify-content-center">
			<form:form action="/destiny/create/request/submit" method="post" modelAttribute="newReq"
				class="w-50">
				
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
					<a href="/" class="btn btn-warning">Cancel</a> <input
						type="submit" value="Submit" class="btn btn-success" />
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>