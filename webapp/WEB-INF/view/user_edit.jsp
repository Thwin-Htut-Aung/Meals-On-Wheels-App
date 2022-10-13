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

	<main>
      <section class="glass">
        <div class="dashboard">
          <div class="user">
            <img
              src="https://raw.githubusercontent.com/codingmarket07/Dropdown-Menu-14j20/master/profile_pic.png"
              alt=""
            />
            
            <h3>${user.fullName}</h3>
			<c:forEach var="role" items="${user.roles}">
			<p>${role.name}</p>
			</c:forEach>
        </div>
        <div class="games">
          <div class="status">
            <h1>Edit Profile</h1>
          </div>
          <c:if test="${msg != null}">
          <div class="alert alert-success">
				User successfully updated
			</div>
			</c:if>
          <form:form method="post" id="editProfile" action="${user.userId}" modelAttribute="user">
          <div class="cards">
          <form:input class="form-control" path="userId"
					name="userId" id="userId" hidden="hidden"/>
          <c:forEach var="role" items="${user.roles}">
           <c:if test="${role.name == 'ROLE_PARTNER' || role.name == 'ROLE_VOLUNTEER'}">
            <div class="card">
              <div class="card-info">
                <h2>Organization Name :</h2>
                <form:input
                  type="text" path="organizationName" name="organizationName" id="organizationName"
                  placeholder="Update your organization name"
                />
              </div>
            </div>
           </c:if>
           </c:forEach>
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
            <c:forEach var="role" items="${user.roles}">
           <c:if test="${role.name == 'ROLE_MEMBER'}">
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
			</c:if>
			</c:forEach>
          </div>
          <div class="buttons">
            <div class="update">
              <button type="submit" class="btn-custom">Update</button>
            </div>
            <div class="back">
              <a class="btn-custom" href="/admin/list_users">Back</a>
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