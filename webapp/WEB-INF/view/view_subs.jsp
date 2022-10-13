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

<link href="/style/menu-style.css" rel="stylesheet" />
<title>Your Subscriptions</title>
</head>
<body>
<%@ include file="header.jsp"%>

<div class="container-fluid bg-1">
		<div>
		
		<sec:authorize access="hasAnyRole('ROLE_PARTNER','ROLE_VOLUNTEER','ROLE_ADMINS')">
					<h2 class="text-center">All Member Subscriptions</h2>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_CAREGIVER')">
					<h2 class="text-center">All Your Subscriptions</h2>
				</sec:authorize>
			

		<c:if test="${empty subs}">
				<sec:authorize access="hasAnyRole('ROLE_PARTNER','ROLE_VOLUNTEER','ROLE_ADMINS')">
					<span>No member subscriptions at the moment</span>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_CAREGIVER')">
					<span>You have not selected any subscription. Tell us how long you would like to use our service.
					</span>
					<br>
				</sec:authorize>
			</c:if>

		
		<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_CAREGIVER')">
					<a href="new-sub">
						<button class="btn btn-primary">Add a new subscription.</button>
					</a>	
				</sec:authorize>
				
				
				<!--  Subs list  -->
			<c:if test="${not empty subs}">
			
			<sec:authorize access="hasAnyRole('ROLE_PARTNER','ROLE_VOLUNTEER','ROLE_ADMINS','ROLE_MEMBER','ROLE_CAREGIVER')">
			<div class="row">

				<div class="col-md-12">
				
					
					
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<th>No.</th>
								<th>Member Name</th>
								<th>Subscription Name</th>
								<th>Type</th>
								<th>Starting Date(M/D/Y)</th>
								<th>Expiration Date(M/D/Y)</th>
								<th>Delete</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="sub" items="${subs}">
						
							<tr>
								<td><%=i %></td>
								<td>${sub.user.fullName}</td>
								<td>${sub.subName}</td>
								<td>${sub.subType}</td>
								<td>${sub.startDate}</td>
								<td>${sub.endDate}</td>

								<td>
									<a href="delete-sub?id=${sub.subId}">
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
					</c:if>
					
					
				</div>
				</div>
</body>
</html>