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
<link rel="stylesheet" href="/style/profile-updt.css" />
<title>Profile | Meals On Wheels</title>
</head>
<body>
<%@include file="header.jsp"%>

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
        <div class="games">
          <div class="status">
            <h1>Edit Profile</h1>
          </div>
          <form:form method="post" id="editProfile" action="update_profile/${user.userId}" modelAttribute="user">
          <div class="cards">
          <form:input class="form-control" path="userId"
					name="userId" id="userId" hidden="hidden"/>
          <sec:authorize access="hasAnyRole('PARTNER', 'VOLUNTEER')">
            <div class="card">
              <div class="card-info">
                <h2>Organization Name :</h2>
                <form:input
                  type="text" path="organizationName" name="organizationName" id="organizationName"
                  placeholder="Update your organization name"
                />
              </div>
            </div>
            </sec:authorize>
            <div class="card">
              <div class="card-info">
                <h2>Full Name :</h2>
                <form:input type="text" path="fullName" name="fullName" id="fullName"
                placeholder="Update your name" />
              </div>
            </div>
            <div class="card">
              <div class="card-info">
                <h2>Phone No :</h2>
                <form:input type="number" path="phoneNumber" name="phoneNumber" id="phoneNumber"
                placeholder="Update your phone number" />
              </div>
            </div>
            <div class="card">
              <div class="card-info">
                <h2>Country :</h2>
                <form:input type="text"  path="country" name="country" id="country"
                placeholder="Update your country" />
              </div>
            </div>
            <div class="card">
              <div class="card-info">
                <h2>City :-</h2>
                <form:input type="text" path="city" name="city" id="city" 
                placeholder="Update your city" />
              </div>
            </div>
            <div class="card">
              <div class="card-info">
                <h2>Address :-</h2>
                <form:input type="text" path="address" name="address" id="address" 
                placeholder="Update your address" />
              </div>
            </div>
            <sec:authorize access="hasRole('MEMBER')">
            <div class="card">
            <div class="card-info">
            	<h2>Your Issue :-</h2>
				<form:select path="issue" class="form-select" aria-label="Default select example" id="issue" name="issue">
					<form:option value="">Select...</form:option>
					<form:option value="Old ages">Old Ages</form:option>
					<form:option value="Diseases">Diseases</form:option>
					<form:option value="Disabilities">Disabilities</form:option>
				</form:select>
            </div>
			</div>
			</sec:authorize>
          </div>
          <div class="buttons">
            <div class="update">
              <button type="submit" class="btn-custom">Update</button>
            </div>
            <div class="back">
              <a class="btn-custom" href="javascript:history.back()">Back</a>
            </div>
          </div>
          </form:form>
        </div>
        </div>
      </section>
    </main>
    <%@ include file="footer.jsp"%>
</body>
</html>