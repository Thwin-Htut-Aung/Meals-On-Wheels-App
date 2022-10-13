<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="init.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/style/dimas-style.css" rel="stylesheet" />
<title>Register | Meals On Wheels</title>
</head>
<body class=" bg-gradient-bourbon">
<%@include file="header.jsp"%>
<main>
	<div class="d-flex flex-wrap align-items-center text-center justify-content-center bg-light mx-auto my-5 py-5 rounded col-lg-6 col-md-10 col-12">
		<div class="col-lg-8 col-sm-12">
		<div class="mb-4 text-center">
			<p class="h3 fw-bold text-capitalize">select your registration type</p>
			<p>Already have an account? <a style="color: blue;" href="login">Sign In</a></p>
		</div>
		

<div class="accordion accordion-flush bg-light" id="accordionFlushExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        Caregiver and Member
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      	<p>Registration for Caregiver and Member. As Caregiver will manage their member account. 
      	If you don't need a caregiver, can directly register as member. <br>
      	Member registration are require to submit a file for verification. The file content are your ID card, Family card, latest photo, and Medical Certificate (if any)</p>
      	<a type="button" class="btn btn-dark bg-gradient-citrus mx-4 text-uppercase" href="register/caregiver">caregiver</a>
		<a type="button" class="btn btn-dark bg-gradient-citrus mx-4 text-uppercase " href="register/member">member</a>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        Partner and Volunteer
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      	<p>Registration to become our Partner and Volunteer. Both partner and volunteer are required to submit a file for authentication. <br>
      	The file content are photos of the organization (place / kitchen) organization structure, and supporting certificate (if any)</p>
      	<a type="button" class="btn btn-dark bg-gradient-citrus mx-4 text-uppercase" href="register/partner">partner</a>
		<a type="button" class="btn btn-dark bg-gradient-citrus mx-4 text-uppercase" href="register/volunteer">volunteer</a>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Rider
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      	<p>Registration to become our Rider. You are required to submit a file for authentication. <br>
      	The file content are your latest photo, the vehicle, Driving License, and Vehicle Number Certificate</p>
      	<a type="button" class="btn btn-dark bg-gradient-citrus mx-4 text-uppercase" href="register/rider">Rider</a>
      </div>
    </div>
  </div>
</div>

		</div>
	</div>
</main>
<%@include file="footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>