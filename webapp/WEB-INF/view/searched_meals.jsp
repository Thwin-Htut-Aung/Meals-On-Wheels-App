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


<!--  Access the Static Resources without using spring URL -->
<link href="/style/menu-style.css" rel="stylesheet" />

<title>Menu | Meals On Wheels</title>
</head>

<body>

	<%@ include file="header.jsp"%>


	<!-- First Container -->
	<div class="container-fluid bg-1 my-5">
		<div>
			<h2 class="text-center">Merry Meal Menu</h2>

			<c:if test="${not empty error_message}">
				<p>${error_message}</p>
			</c:if>

			<c:if test="${empty meals}">
				<sec:authorize access="hasAnyRole('ROLE_PARTNER','ROLE_VOLUNTEER','ROLE_ADMINS')">
					<span>No meal has been added yet. Press the 'Add' button to add the available meals.</span>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_CAREGIVER')">
					<span>No meals are available at the moment.
					</span>
				</sec:authorize>
			</c:if>

			
			<div class="row">
				<div class="col-md-12">
				<c:url var="get_search_url" value="search-meals"/>
				<form action="${get_search_url}" id="myform" method="get" class="float-end" style="padding:20px;">

						<input class="form-control mr-sm-2" type="search"
							placeholder="Search for meals" value="${keyword}" name="keyword" />

						<input type="submit" value="Search" class="btn btn-primary"/>

					</form>

				</div>
			</div>
				
				
				<sec:authorize access="hasAnyRole('ROLE_PARTNER','ROLE_VOLUNTEER','ROLE_ADMINS')">
					<a href="new-meal">
						<button class="btn btn-primary">Add a new meal</button>
					</a>	
				</sec:authorize>


		<!--  Complete Menu  -->
			<c:if test="${not empty meals}">
			
			<sec:authorize access="hasAnyRole('ROLE_PARTNER','ROLE_VOLUNTEER','ROLE_ADMINS')">
			<div class="row">

				<div class="col-md-12">
				
					
					
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<th>No.</th>
								<th>Dish</th>
								<th>Description</th>
								<th>Actions</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="meal" items="${meals}">
						
							<tr>
								<td><%=i %></td>
								<td>${meal.mealName}</td>
								<td>${meal.mealDescription}</td>

								<td>
								
									<a href="edit?id=${meal.mealId}">
										<button class="btn btn-primary">Edit</button>
									</a>
									<a href="delete?id=${meal.mealId}">
										<button class="btn btn-danger">Delete</button>
									</a>
								
								
								</td>
							</tr>
							
							<% i++; %>
						</c:forEach>

						</tbody>
					</table>
					
					</div>
			</div>
					</sec:authorize>
					
					
				<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_CAREGIVER')">
				<div class="row">

				<div class="col-md-12">
					
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<th>No.</th>
								<th>Dish</th>
								<th>Description</th>
								<th>Quantity</th>
								<th>Seasoning</th>
								<th>Specific Request</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						
						<c:forEach var="meal" items="${meals}">
						
						<input type="hidden" name="id" value="${meal.mealId}">
							<tr>
								<td><%=i%></td>
								<td>${meal.mealName}</td>
								<td>${meal.mealDescription}</td>
								<td><input name="quantity" type="number"></td>
								<td><select name="seasoning">
								<option value="select">Select</option>
								<option value="low">Low</option>
  								<option value="medium">Medium</option>
  								<option value="extra">Extra</option>
  								</select></td>
								<td><input name="request" type="text"></td>
								
							</tr>

							<% i++; %>
						</c:forEach>
						
						<tr>
						
						<td><button class="btn btn-success" onclick="submit()">Place Order</button>
						</tr>
						
						</tbody>
					</table>
					
					</div>
					</div>
					</sec:authorize>
					
					<script>
					function submit(){
						
						const url = new URL("http://localhost:8080/save-order");
						
						const quan = document.getElementsByName("quantity");
						for(var j=0; j<quan.length; j++){
							var quanval = quan[j].value;
							url.searchParams.append('quantity'+j,quanval);
						}
						
						const season = document.getElementsByName("seasoning");
						for(var j=0; j<season.length; j++){
							var seasonval = season[j].value;
							url.searchParams.append('seasoning'+j,seasonval);
						}
						
						const req = document.getElementsByName("request");
						for(var j=0; j<req.length; j++){
							var reqval = req[j].value;
							url.searchParams.append('request'+j,reqval);
						}
						
						location.replace(url);
						
					}
					
					function search(){
						const url = new URL("http://localhost:8080/search-meals");
						const key = document.keyword.value;
						url.searchParams.append('keyword',key);
						location.replace(url);
					}
					</script>
					
					</c:if>
							
				</div>
			</div>

	<%@ include file="footer.jsp"%>
	</body>
	</html>