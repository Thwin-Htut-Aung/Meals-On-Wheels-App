<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="init.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--  Enable Bootstrap -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
    $( "#datepicker1" ).datepicker();
  } );
  </script>
  
<title>Add Subscription</title>
</head>
<body>
<%@ include file="header.jsp"%>

<!-- First Container -->
	<div class="container-fluid bg-success text-center">
		<br>
		<h3 class="margin">Add a new subscription !</h3>
		<br>
		<div class="row">

			<div class="col-md-4"></div>

			<div class="col-md-4">



				
				<form:form method="post" action="save-sub" modelAttribute="sub">

					<input type="hidden" value="${_csrf.token}"/>
						
					<form:hidden path="subId" />
					
					<div class="form-group">
					<form:label path="subName">Subscription Name:</form:label>
					<form:input path="subName" />
					</div>

					<div class="form-group">
					<form:label path="subType">Subscription Type:</form:label>
					<form:select path="subType">
					<form:option value="Short-term Subscription">Short-term Subscription</form:option>
					<form:option value="Long-term Subscription">Long-term Subscription</form:option>
					<form:option value="Paid Subscription">Paid Subscription</form:option>
					<form:option value="Premium Subscription">Premium Subscription</form:option></form:select>
					</div>

					<div class="form-group">
						<form:label path="startDate">From:</form:label>
						<form:input path="startDate" id="datepicker"/>
					</div>
					
					<div class="form-group">
						<form:label path="endDate">Until:</form:label>
						<form:input path="endDate" id="datepicker1"/>
					</div>
					<br>
					
					
					<input class="btn btn-primary btn-lg" type="submit" name="Save" value="Add" />
					<a class="btn btn-warning btn-lg" href="javascript:history.back()">Back</a> 
					<!-- <input
						type="button" value="Cancel" onclick="cancel()" />

					<script>
						function cancel() {
							window.location.href = "cars"
						}
					</script> -->
				</form:form>

			</div>


			<div class="col-md-4"></div>

		</div>

	</div>
	
</body>
</html>