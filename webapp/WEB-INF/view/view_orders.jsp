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

<title>Orders | Meals On Wheels</title>
</head>

<body>

	<%@ include file="header.jsp"%>


	<!-- First Container -->
	<div class="container-fluid bg-1 my-5">
		<div>
			<h2 class="text-center">Order List</h2>
			<br>	
			<br>

			<c:if test="${not empty error_message}">
				<p>${error_message}</p>
			</c:if>

			<c:if test="${empty orders}">
				<sec:authorize access="hasAnyRole('ROLE_PARTNER','ROLE_VOLUNTEER','ROLE_ADMIN')">
					<span>No order has been placed yet.</span>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_CAREGIVER')">
					<span>You have not placed any orders. Go to the menu to place orders.
					</span>
				</sec:authorize>
			</c:if>


			
			<c:if test="${not empty orders}">
			<sec:authorize access="hasAnyRole('ROLE_PARTNER','ROLE_VOLUNTEER','ROLE_ADMIN')">
			
			<div class="row">

				<div class="col-md-12">
					
					
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<th>No.</th>
								<th>Order Date</th>
								<th>Member Name</th>
								<th>Meals</th>
								<th>Status</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="order" items="${orders}">
						
							<tr>
								<td><%=i %></td>
								<td>${order.orderDate}</td>
								<td>${order.user.fullName}</td>
								<td>
		
								<c:forEach var="meal" items="${order.meals}">
								<span>Dish - ${meal.menu.mealName} &nbsp;&nbsp;Quantity - ${meal.quantity} 
								&nbsp;&nbsp;Seasoning - ${meal.seasoning} &nbsp;&nbsp;Request - ${meal.request}<br>
								</span>
								</c:forEach>
								
								</td>
								
								<c:if test="${order.informed==false}">
								
								<td>
								<form action="inform-rider?id=${order.orderId}" method="get">
								<input type="hidden" name="id" value="${order.orderId}">
							
								<select name="rideremail"><c:forEach var="rider" items="${riders}">
								<option value="${rider.email}">${rider.fullName}</option>
								</c:forEach></select>
								<button class="btn btn-primary" type="submit">Inform Rider</button></form>
								</td>
							
								</c:if>
								
								<c:if test="${order.informed==true and order.pickedUp==false}">
								<td>The rider "${order.riderName}" is on their way to pick up the order!</td></c:if>
								
								<c:if test="${order.pickedUp==true}">
								<td>The order has been picked up by the rider "${order.riderName}"!</td></c:if>

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
								
								<th>Order Date</th>
								<th>Member Name</th>
								<th>Meals</th>
								<th>Status</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="order" items="${orders}">
						
							<tr>
								<td><%=i %></td>
								<td>${order.orderDate}</td>
								<td>${order.user.fullName}</td>
								<td>
		
								<c:forEach var="meal" items="${order.meals}">
								<span>Dish - ${meal.menu.mealName} &nbsp;&nbsp;Quantity - ${meal.quantity} 
								&nbsp;&nbsp;Seasoning - ${meal.seasoning} &nbsp;&nbsp;Request - ${meal.request}<br>
								</span>
								</c:forEach>
								
								</td>
								
								<c:if test="${order.informed==false}"><td>Your order is being prepared!</td></c:if>
								<c:if test="${order.informed==true and order.pickedUp==false}">
								<td>The rider "${order.riderName}" is on their way to pick up your order!</td></c:if>
								<c:if test="${order.pickedUp==true}">
								<td>Your order has been picked up by the rider "${order.riderName}"!</td></c:if>
								
							</tr>
							<% i++; %>
							
						</c:forEach>

						</tbody>
					</table>
					
					
					
				</div>
			</div>
			
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_RIDER')">
			
			<c:if test="${number_of_orders==0}">
			<span>No order has been assigned to you yet.
			</span></c:if>
			
			<c:if test="${number_of_orders>0}">
			<div class="row">

				<div class="col-md-12">
				
					<h3>You have ${number_of_orders} orders left to deliver!</h3>
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<th>No.</th>
								
								<th>Order Date</th>
								<th>Member Name</th>
								<th>Member Address</th>
								<th>Meals</th>
								<th>Status</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="order" items="${orders}">
						
							<tr>
								<td><%=i %></td>
								<td>${order.orderDate}</td>
								<td>${order.user.fullName}</td>
								<td>${order.user.address}</td>
								<td>
		
								<c:forEach var="meal" items="${order.meals}">
								<span>Dish - ${meal.menu.mealName} &nbsp;&nbsp;Quantity - ${meal.quantity} 
								&nbsp;&nbsp;Seasoning - ${meal.seasoning} &nbsp;&nbsp;Request - ${meal.request}<br>
								</span>
								</c:forEach>
								
								</td>
								
								<td>The order is ready to be picked up!<br><a href="pick-up-order?id=${order.orderId}">
								<button class="btn btn-primary" onclick="pickUp()">Pick Up</button></a></td>

									
							</tr>
							<% i++; %>
							
						</c:forEach>

						</tbody>
					</table>
					<script>
					function pickUp(){
						alert("Good job! Deliver the order to the member.")
					}
					</script>
					
					
				</div>
			</div>
			
			</c:if>
			</sec:authorize>
			
			</c:if>



		</div>
	</div>


	<%@ include file="footer.jsp"%>
	</body>
	</html>