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
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet" />
<link href="/style/dimas-style.css" rel="stylesheet" />
<link rel="stylesheet" href="/style/profile.css" />
<title>Profile | Meals On Wheels</title>
</head>
<body>
<%@include file="header.jsp"%>

<%-- <section style="background-color: #eee;">

  <div class="container py-5">
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3">John Smith</h5>
            <sec:authorize access="hasAnyRole('PARTNER', 'VOLUNTEER')">
            <p class="text-muted mb-1">${user.organizationName}</p>
            </sec:authorize>
            <p class="text-muted mb-4">${user.city}, ${user.country}</p>
            <div class="d-flex justify-content-center mb-2">
              <a type="button" class="btn btn-primary">Edit Profile</a>
              <sec:authorize access="hasRole('CAREGIVER')">
              <a type="button" class="btn btn-outline-primary ms-1">Add Member</a>
              </sec:authorize>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${user.fullName}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${user.email}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${user.phoneNumber}</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${user.address}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section> --%>

<sec:authorize access="hasRole('ROLE_CAREGIVER')" var="isCaregiver" />
<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
<sec:authorize access="hasRole('ROLE_PARTNER')" var="isPartner" />
<sec:authorize access="hasRole('ROLE_VOLUNTEER')" var="isVolunteer" />
<sec:authorize access="hasRole('ROLE_RIDER')" var="isRider" />
<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />

	<main>
      <section class="glass">
        <div class="dashboard">
          <div class="user">
            <img
              src="https://www.pngitem.com/pimgs/m/508-5087336_person-man-user-account-profile-employee-profile-template.png"
              alt=""
            />
           <!--  <i class="fa-solid fa-user fa-9x"></i> -->
            <h3>${user.fullName}</h3>
			<c:choose>
			  <c:when test="${isCaregiver}">
			    <p>Care Giver</p>
			  </c:when>
			  <c:when test="${isMember}">
			    <p>Member</p>
			  </c:when>
			  <c:when test="${isPartner}">
			    <p>Partner</p>
			  </c:when>
			  <c:when test="${isVolunteer}">
			    <p>Volunteer</p>
			  </c:when>
			  <c:when test="${isRider}">
			    <p>Rider</p>
			  </c:when>
			  <c:when test="${isAdmin}">
			    <p>Admin</p>
			  </c:when>
			  <c:otherwise>
			    You have no relevant role
			  </c:otherwise>
			</c:choose>
          </div>
        </div>
        <div class="games">
          <div class="status">
            <h1>Profile</h1>
          </div>
          <div class="cards">
          <sec:authorize access="hasAnyRole('PARTNER', 'VOLUNTEER')">
            <div class="card">
              <div class="card-info">
                <h2>Organization Name : ${user.organizationName}</h2>
              </div>
            </div>
           </sec:authorize>
            <div class="card">
              <div class="card-info">
                <h2>Full Name : ${user.fullName}</h2>
              </div>
            </div>
            <div class="card">
              <div class="card-info">
                <h2>Email Address : ${user.email}</h2>
              </div>
            </div>
            <div class="card">
              <div class="card-info">
                <h2>Phone No : ${user.phoneNumber}</h2>
              </div>
            </div>
            <div class="card">
              <div class="card-info">
                <h2>Location : ${user.city}, ${user.country}</h2>
              </div>
            </div>
            <div class="card">
              <div class="card-info">
                <h2>Address : ${user.address}</h2>
              </div>
            </div>
<!--             <div class="card">
              <div class="card-info">
                <h2>Pin Code :-</h2>
              </div>
            </div> -->
            <sec:authorize access="hasRole('MEMBER')">
            <div class="card">
              <div class="card-info">
                <h2>Issue : ${user.issue}</h2>
              </div>
            </div>
            </sec:authorize>
          </div>
          <br><br>
          <div class="buttons">
            <div class="update">
              <a class="btn-custom" href="/update_profile">Update</a>
            </div>
            <div class="update">
              <a class="btn-custom" href="javascript:history.back()">Back</a>
            </div>
            <sec:authorize access="hasRole('CAREGIVER')">
            <div class="update">
              <a class="btn-custom" href="/register/member">Add Member</a>
            </div>
            </sec:authorize>
          </div>
          <br><br>
        </div>
      </section>
    </main>
<%@ include file="footer.jsp"%>
</body>
</html>