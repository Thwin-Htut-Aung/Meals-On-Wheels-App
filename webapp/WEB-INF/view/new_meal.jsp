<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script> -->

<!--  Access the Static Resources without using spring URL -->
<script src="/js/custom.js"></script>

<title>Add Menu | Meals On Wheels</title>
</head>

<body>

	<!-- Test My JS -->
	<!-- <input type="button" class="button" onclick="sayHello();" value="Click me!">  -->

	<%@ include file="header.jsp"%>


	<!-- First Container -->
	<div class="container-fluid bg-warning text-center my-5">
		<h2 class="margin">Add a new meal to the menu !</h2>
		<br>
		
		<div class="row">

			<div class="col-md-4"></div>

			<div class="col-md-4">


				<!--
            It is standard practice to have all action & href urls wrapped with c:url tag.
            This tag adds jsessionid to the action/href url, in case cookies are disabled by the user.
       			 -->

				
				<form:form method="POST" action="/save-meal" modelAttribute="meal"  class="form-inline">

					<input type="hidden" value="${_csrf.token}"/>
						
					<form:hidden path="mealId" />
					
					<div class="form-group">
					<form:label path="mealName" >Meal Name:</form:label>
					<form:input path="mealName" class="form-control"/>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label path="mealDescription">Meal Description:</form:label>
						<form:input path="mealDescription" class="form-control"/>
					</div>
					<br>	
					<br>
					<div class="mt-3">
					<input type="submit" name="Add" value="Save" class="btn btn-primary btn-lg"/>
					<a class="btn btn-success btn-lg" href="javascript:history.back()">Back</a>
					</div>
					<br>	
					<br>
					<%-- <input
						type="button" value="Cancel" onclick="cancel()" />

					<script>
						function cancel() {
							window.location.href = "cars"
						}
					</script> --%>
				</form:form>

			</div>


			<div class="col-md-4"></div>

		</div>

	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
