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
<title>Admin Dashboard | Meals On Wheels</title>
</head>
<body>
<%@include file="header.jsp"%>
<br>
<main class="container">
<h2 class="text-center">User List</h2>
<br>

<a class="btn btn-primary" href="/admin/add_user">Add User</a>
<br><br>

<%-- <c:if test="${msg_delete != null}">
<div class="alert alert-success">User successfully deleted</div>
</c:if> --%>

<div class="form-outline mb-4">
<form action="search" id="search-form" method="get">
  <label class="form-label" for="datatable-search-input">Search User</label>
  <input type="search" class="form-control" id="datatable-search-input" name="keyword">
</form>
</div>

<div id="datatable">
</div>

	<c:if test="${not empty listusers}">
	<div class="table-responsive-lg">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>No.</th>
					<!-- <th>User ID </th> -->
					<th>Full Name</th>
					<th>Email</th>
					<th>Role</th>
					<th>Status</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<% int i=1; %>
				<c:forEach var="user" items="${listusers}">
				<tr>
					<td><%=i %></td>
					<%-- <td>${user.id}</td> --%>
					<td>${user.fullName}</td>
					<td>${user.email}</td>
					<c:forEach var="role" items="${user.roles}">
					<td>${role.name}</td>
					</c:forEach>
					<c:if test="${user.verified == false}">
					<td>Unverified</td>
					</c:if>
					<c:if test="${user.verified == true}">
					<td>Verified</td>
					</c:if>
					<td>
		                <div class="dropdown">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
						    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots-vertical" viewBox="0 0 16 16">
							  <path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
							</svg>
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						    <li><a class="dropdown-item" href="view_user/${user.userId}">View</a></li>
						    <li><a class="dropdown-item" href="edit_user/${user.userId}">Edit</a></li>
						    <li><a class="dropdown-item" href="delete_user/${user.userId}" onclick="gotDelete()">Delete</a></li>
						  </ul>
						</div>
					</td>
				</tr>
				<% i++; %>
				</c:forEach>
			</tbody>
		</table>
					<script>
					function gotDelete(){
						alert("User sucessfully deleted!")
					}
					</script>
	</div>
	</c:if>
</main>
<br><br>
<%@include file="footer.jsp"%>
</body>
</html>