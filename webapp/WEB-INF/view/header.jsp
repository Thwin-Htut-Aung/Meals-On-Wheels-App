<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="init.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
<link href="/style/header.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body >

   <%-- <header class="p-3 border-bottom bg-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark me-lg-2 text-decoration-none fw-bold" style="font-size: 20px">
        Meals On Wheels
        </a>
		
		<c:choose>
			<c:when test="${action != null}">
			</c:when>
			<c:otherwise>
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">About Us</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">Contact Us</a></li>
        </ul>

		<sec:authorize access="isAuthenticated()">
        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <!-- <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle"> -->
            <i class="fa-solid fa-user fa-xl"></i>
          </a>
          <ul class="dropdown-menu text-small">
            <li><a class="dropdown-item" href="/profile">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <form:form hidden="hidden" name="logoutForm" method="post" action="/dologout">
            	<input type="submit" value="Logout" />
            </form:form>
            <li><a class="dropdown-item" href="javascript: logoutForm.submit();">Sign Out</a></li>
            <!-- <li><a class="dropdown-item" href="#">Sign out</a></li> -->
          </ul>
        </div>
        </sec:authorize>
        
        <sec:authorize access="!isAuthenticated()">
        <div class="text-end">
        	<button type="button" class="btn btn-primary me-2 bg-gradient-citrus fw-bolder text-dark" onclick="window.location.href='/login';">Sign-in</button>
        </div>
        </sec:authorize>
			</c:otherwise>
		</c:choose>
        
        
      </div>
    </div>
  </header> --%>

<sec:authorize access="hasAnyRole('CAREGIVER', 'MEMBER', 'PARTNER', 'VOLUNTEER')" var="isFour" />  
<sec:authorize access="hasAnyRole('CAREGIVER', 'MEMBER')" var="isCareMem" />
<sec:authorize access="hasAnyRole('PARTNER', 'VOLUNTEER')" var="isPartVol" />
<sec:authorize access="hasRole('ROLE_RIDER')" var="isRider" />
<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
  
  <header class="p-3 border-bottom background">
    <div class="">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      
		<sec:authorize access="!isAuthenticated()">
			<a href="/" class="circle d-flex align-items-center mb-0 mb-lg-0 text-light text-decoration-none me-lg-3">
			<img class="circle" width="80px" src="/img/logo-crop.jpg" alt="This is a Logo"/>
	  		</a>
		<c:choose>
			<c:when test="${action != null}">
			</c:when>
			<c:otherwise>
			<ul class=" h5 nav col-12 col-lg-auto me-lg-auto mb-0 justify-content-center mb-md-0">
	          <li><a href="#" class="nav-link px-3 text-light">Home</a></li>
	          <li><a href="#aboutus" class="nav-link px-3 text-light">About Us</a></li>
	          <li><a href="#contact" class="nav-link px-3 text-light">Contact Us</a></li>
	          <li><a href="https://rzp.io/l/pNLAHdnEpA" target="_blank" class="nav-link px-3 text-light">Donate</a></li>
	          <li><a href="#fsm" class="nav-link px-3 text-light">Food Safety Management</a></li>
	          <li><a href="#pp" class="nav-link px-3 text-light">Privacy Policy</a></li>
	        </ul>
	        <div class="px-5">
	            <button type="button" class="signin" onclick="window.location.href='/login';">Sign In</button>
	        </div>
			</c:otherwise>
		</c:choose>
		</sec:authorize>
      
      	
        
        <sec:authorize access="isAuthenticated()">
        
        <c:choose>
<%-- 		<c:when test="${isCareMem}">
		<a href="/sample1" class="circle d-flex align-items-center mb-0 mb-lg-0 text-light text-decoration-none me-lg-3">
		<img class="circle" width="80px" src="/img/logo-crop.jpg" alt="This is a Logo"/>
		</a>
		</c:when>
		<c:when test="${isPartVol}">
		<a href="/sample2" class="circle d-flex align-items-center mb-0 mb-lg-0 text-light text-decoration-none me-lg-3">
		<img class="circle" width="80px" src="/img/logo-crop.jpg" alt="This is a Logo"/>
		</a>
		</c:when> --%>
		<c:when test="${isFour}">
		<a href="/view-menu" class="circle d-flex align-items-center mb-0 mb-lg-0 text-light text-decoration-none me-lg-3">
		<img class="circle" width="80px" src="/img/logo-crop.jpg" alt="This is a Logo"/>
		</a>
		<ul class=" h5 nav col-12 col-lg-auto me-lg-auto mb-0 justify-content-center mb-md-0">
			<li><a href="/view-menu" class="nav-link px-3 text-light">Menu</a></li>
	        <li><a href="/view-orders" class="nav-link px-3 text-light">Order</a></li>
        </ul>
		</c:when>
		<c:when test="${isRider}">
		<a href="/view-orders" class="circle d-flex align-items-center mb-0 mb-lg-0 text-light text-decoration-none me-lg-3">
		<img class="circle" width="80px" src="/img/logo-crop.jpg" alt="This is a Logo"/>
		</a>
		<ul class=" h5 nav col-12 col-lg-auto me-lg-auto mb-0 justify-content-center mb-md-0">
			<li><a href="/view-orders" class="nav-link px-3 text-light">Order</a></li>
        </ul>
		</c:when>
		<c:when test="${isAdmin}">
		<a href="/admin/list_users" class="circle d-flex align-items-center mb-0 mb-lg-0 text-light text-decoration-none me-lg-3">
		<img class="circle" width="80px" src="/img/logo-crop.jpg" alt="This is a Logo"/>
		</a>
		<ul class=" h5 nav col-12 col-lg-auto me-lg-auto mb-0 justify-content-center mb-md-0">
			<li><a href="/admin/list_users" class="nav-link px-3 text-light">Users</a></li>
			<li><a href="/view-menu" class="nav-link px-3 text-light">Menu</a></li>
	        <li><a href="/view-orders" class="nav-link px-3 text-light">Order</a></li>
        </ul>
		</c:when>
		<c:otherwise>
		<a class="circle d-flex align-items-center mb-0 mb-lg-0 text-light text-decoration-none me-lg-3">
		<img class="circle" width="80px" src="/img/logo-crop.jpg" alt="This is a Logo"/>
		</a>
		<ul class=" h5 nav col-12 col-lg-auto me-lg-auto mb-0 justify-content-center mb-md-0">
        </ul>
		</c:otherwise>
		</c:choose>
        
        
          <div class="px-5">
            <div class="navbar">
              <div class="nav_right">
                <ul>
                  <li class="nr_li dd_main">
                    <img
              src="https://www.pngitem.com/pimgs/m/508-5087336_person-man-user-account-profile-employee-profile-template.png"
              alt=""
            />
					<!-- <i class="fa-solid fa-user fa-2xl"></i> -->
                    <div class="dd_menu">
                      <div class="dd_left">
                        <ul>
                          <li><i class="fas fa-bell"></i></li>
                          <li><i class="fas fa-edit"></i></li>
                          <li><i class="fas fa-sign-out-alt"></i></li>
                          <!-- <li><i class="fas fa-open-book"></i></li>
                          <li><i class="fas fa-comment-dots"></i></li> -->
                        </ul>
                      </div>
                      <div class="dd_right">
                        <ul>
                          <li><a href="/view-subs"> Subscription</a></li>
                          <li><a href="/profile">Profile</a></li>
                          <!-- <li><a href="/view-menu">Menu</a></li>
                          <li><a href="/view-orders">Order</a></li> -->
                          <form:form hidden="hidden" name="logoutForm" method="post" action="/dologout">
				            	<input type="submit" value="Logout" />
				          </form:form>
                          <li><a href="javascript: logoutForm.submit();">Sign Out</a></li>
                        </ul>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        
        </sec:authorize>
        <%--         <div class="dropdown text-end me-lg-5">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <!-- <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle"> -->
            <i class="fa-regular fa-user fa-2xl"></i>
          </a>
          <ul class="dropdown-menu text-small">
            <li><a class="dropdown-item" href="/profile">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <form:form hidden="hidden" name="logoutForm" method="post" action="/dologout">
            	<input type="submit" value="Logout" />
            </form:form>
            <li><a class="dropdown-item" href="javascript: logoutForm.submit();">Sign Out</a></li>
          </ul>
        </div> --%>
        
      </div>
    </div>
  </header>

    <script>
      var dd_main = document.querySelector(".dd_main");

      dd_main.addEventListener("click", function () {
        this.classList.toggle("active");
      });
    </script>

</body>
</html>