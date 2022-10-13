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
<title>Login | Meals On Wheels</title>
</head>
<body>
<%@include file="header.jsp"%>
<section class="h-100 gradient-form" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black">
          <div class="row g-0">
            <div class="col-lg-6">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img class="circle" width="100px" src="/img/logo-crop.jpg" alt="This is a Logo"/>
                  <h4 class="mt-1 mb-5 pb-1">We are The Merry Meals</h4>
                </div>
                
                <c:if test="${error_msg != null}">
					<div class="alert alert-danger">${error_msg}</div>
				</c:if>

                <c:url var="post_url" value="/dologin" />
		        <form action="${post_url}" method="post">
				  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                  <div class="form-outline mb-4">
                    <input type="email" id="username" class="form-control" name="username"/>
                    <label class="form-label" for="username">Email</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" id="password" class="form-control" name="password"/>
                    <label class="form-label" for="password">Password</label>
                  </div>
                  
                  <div class="text-center pt-1 mb-5 pb-1">
                  <input type="submit" class="btn btn-primary fa-lg py-3 px-5 gradient-custom-2" name="Login" value="Login"/>
                  </div>

                </form>
                
                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">Don't have an account?</p>
                    <a type="button" class="btn btn-outline-danger" href="/register">Create new</a>
                  </div>

              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                <h4 class="mb-4">We are more than just a charitable organization</h4>
                <p class="small mb-0">Merry Meals is charitable organization that giving support to elder people who
                need someone to prepare their meal. We are available on weekdays and ready to deliver your order.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<%@include file="footer.jsp"%>
</body>
</html>