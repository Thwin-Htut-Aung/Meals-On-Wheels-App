<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="init.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="/style/dimas-style.css" rel="stylesheet" />
<title>Thank you | Meals On Wheels</title>
</head>
<body class=" bg-gradient-bourbon">
<%@include file="header.jsp"%>
<main>
	<div class="container mb-5">
		<img class="mx-auto d-block my-5 img-fluid rounded" width="720" alt="green-check" src="/img/regis-thx.png">
		<div class="d-flex flex-column align-items-center justify-content-center bg-light mx-auto py-4 rounded col-lg-6 col-md-10 col-sm-12">
			<div class="col-lg-10 col-sm-11 text-center">
			<p class="h3 fw-bold mb-3">Registration Complete</p>
			<p class="mb-1 h5">Thank you for join us.</p>
			<c:choose>
				<c:when test="${action == 'caregiver' || action == 'member'}"><p>You are now able to register your member. Close this tab.
				Login to the web. Go to Profile. There you can add the member.</p></c:when>
				<c:otherwise><p>You are able to use our service.
				Further qualification will be inform after we check your authenticity of the data given</p></c:otherwise>
			</c:choose>
			<a class="btn btn-warning px-5 fw-bold" href="/login">Close</a>
			</div>
		</div>
	</div>
</main>
</body>
</html>