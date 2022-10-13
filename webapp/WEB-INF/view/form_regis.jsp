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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
<link href="/style/dimas-style.css" rel="stylesheet" />
<title>Registration Form | Meals On Wheels</title>
</head>
<body class=" bg-gradient-bourbon">
<%@include file="header.jsp"%>

	<div
		class="d-flex flex-wrap align-items-center justify-content-center bg-light mx-auto py-5 my-5 col-lg-6 col-md-10 col-sm-12 rounded">
		<form:form method="post" class="col-lg-8 col-md-10" id="regForm" enctype = "multipart/form-data"
			modelAttribute="user" action= "${action}">
			<h2 class="d-flex justify-content-center mb-5 text-capitalize fw-bold">Registration Form ${action}</h2>
			<c:choose>
				<c:when test="${action == 'partner' || action == 'volunteer'}">
				<div class="mb-3">
				<form:label class="form-label" for="organizationName" path="organizationName">Organization Name</form:label>
				<form:input type="text" class="form-control" path="organizationName" name="organizationName" id="organizationName" />
			</div>
			<div class="mb-3">
				<form:label class="form-label" for="fullName" path="fullName">Full Name
				<i class="fa-solid fa-circle-info" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-custom-class="custom-tooltip" 
				data-bs-title="Owner name / Person in charge / Leader Organization"></i>
				</form:label>
				<form:input type="text" class="form-control" path="fullName" name="fullName" id="fullName" />
			</div>
				</c:when>
				<c:otherwise>
				<div class="mb-3">
					<form:label class="form-label" for="fullName" path="fullName">Full Name</form:label>
					<form:input type="text" class="form-control" path="fullName" name="fullName" id="fullName" />
				</div>
				</c:otherwise>
			</c:choose>
			<div class="mb-3">
				<form:label class="form-label" for="inputcountry" path="country">Country</form:label>
				<form:input type="text" class="form-control" path="country" name="country" id="country" />
			</div>
			<div class="mb-3">
				<form:label class="form-label" for="inputcity" path="city">City</form:label>
				<form:input type="text" class="form-control" path="city" name="city" id="city" />
			</div>
			<div class="mb-3">
				<form:label class="form-label" for="address" path="address">Address</form:label>
				<form:input type="text" class="form-control" path="address" name="address" id="address" />
			</div>
			<div class="mb-3">
				<form:label class="form-label" for="phoneNumber" path="phoneNumber">Phone</form:label>
				<form:input type="text" class="form-control" path="phoneNumber" name="phoneNumber" id="phoneNumber" />
			</div>
			<c:if test="${action == 'member'}">
			<div class="mb-3">
				<form:label class="form-label" for="issue" path="issue">Member Issue 
				<i class="fa-solid fa-circle-info" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-custom-class="custom-tooltip" 
				data-bs-title="Type of your issue / reason need our service"></i>
				</form:label>
				<form:select path="issue" class="form-select" aria-label="Default select example" id="issue" name="issue">
					<form:option value="">Select...</form:option>
					<form:option value="Old ages">Old Ages</form:option>
					<form:option value="Diseases">Diseases</form:option>
					<form:option value="Disabilities">Disabilities</form:option>
				</form:select>
			</div>
			</c:if>
			<c:if test="${action != 'caregiver'}">
			<div class="mb-3">
			  <label for="formFile" class="form-label">Select File
			  <i class="fa-solid fa-circle-info" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-custom-class="custom-tooltip" 
				data-bs-title="File must be a pdf and size under 3mb"></i>
			  </label>
			  <input class="form-control" type="file" id="file" name="file">
			  <span class="text-danger">${msg_uperror}</span>
			</div>
			</c:if>
			<div class="mb-3">
				<form:label class="form-label" for="inputEmail" path="email">Email</form:label>
				<form:input type="text" class="form-control" path="email"
					name="email" id="email" />
				<span class="text-danger">${msg_dupe}</span>
			</div>
			<div class="mb-3">
				<form:label class="form-label" for="inputPassword" path="password">Password</form:label>
				<form:input type="password" class="form-control" path="password"
					name="password" id="password" />
			</div>
			<div class="mb-3">
				<label class="form-label" for="inputPassword2">Confirm Password</label>
				<input type="password" class="form-control"
					name="pass2" id="password2" />
			</div>
			<form:button type="submit" class="btn btn-primary" id="register"
				name="register">Register</form:button>
		</form:form>
	</div>
	
	<script>
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
    </script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script type="text/javascript" src="/script/form-regis.js"></script>

</body>
</html>