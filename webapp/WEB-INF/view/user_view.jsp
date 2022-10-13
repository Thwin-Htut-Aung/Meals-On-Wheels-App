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
<link rel="stylesheet" href="/style/profile.css" />
<title>View User | Meals On Wheels</title>
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
           <!--  <i class="fa-solid fa-user fa-9x"></i> -->
            <h3>${user.fullName}</h3>
            <c:forEach var="role" items="${user.roles}">
			<p>${role.name}</p>
			</c:forEach>
			<c:if test="${user.verified == false}">
			<p>Unverified</p>
			</c:if>
			<c:if test="${user.verified == true}">
			<p>Verified</p>
			</c:if>
          </div>
        </div>
        <div class="games">
          <div class="status">
            <h1>Profile</h1>
          </div>
          <div class="cards">
           <c:forEach var="role" items="${user.roles}">
           <c:if test="${role.name == 'ROLE_PARTNER' || role.name == 'ROLE_VOLUNTEER'}">
           <div class="card">
              <div class="card-info">
                <h2>Organization Name : ${user.organizationName}</h2>
              </div>
            </div>
           </c:if>
           </c:forEach>
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
            <c:forEach var="role" items="${user.roles}">
           <c:if test="${role.name == 'ROLE_MEMBER'}">
            <div class="card">
              <div class="card-info">
                <h2>Issue : ${user.issue}</h2>
              </div>
            </div>
            </c:if>
            </c:forEach>
          </div>
          <br><br>
          
          
          <div class="buttons">
       
            <div class="update"> 
              <a class="btn-custom" href="javascript:history.back()">Back</a>
            </div>
            <div class="update">
            <c:if test="${user.verified == false}">
              <a class="btn-custom" href="/admin/verify/${user.userId}">Verified User</a>
			</c:if>
			<c:if test="${user.verified == true}">
              <a class="btn-custom" href="/admin/list_users">Unverified User</a>
			</c:if>
            </div>
            <%-- <div class="update">
            <c:forEach var="file" items="${user.files}">
              <a class="btn-custom" href="/files/${file.id}">See File</a>
            </c:forEach>
            </div> --%>
          </div>
          
          <br><br>
        </div>
      </section>
    </main>

<%@include file="footer.jsp"%>
</body>
</html>