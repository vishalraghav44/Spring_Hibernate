<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link rel="stylesheet" href="https://opensource.keycdn.com/fontawesome/4.6.3/font-awesome.min.css" integrity="sha384-Wrgq82RsEean5tP3NK3zWAemiNEXofJsTwTyHmNb/iL3dP/sZJ4+7sOld1uqYJtE" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Form</title>


</head>
<body>
	<center>

		<div style="color: teal; font-size: 40px">Edit Employee Details Form</div>

<br>
<br>

		<c:url var="userRegistration" value="saveUser.html" />
		<form:form id="registerForm" modelAttribute="employee" method="post"
			action="http://10.0.61.62:8080/BRD4UPDATED/update">
			<table height="150px" border="2" cellpadding="2" class="table table-striped">
				<tr>
					<td><form:label path="emp_id">EMPLOYEE ID</form:label></td>
					<td><form:input path="emp_id" value="${employee.emp_id}" readonly="true"  /></td>
				</tr>
				
				<tr>
					<td><form:label path="emp_name">EMPLOYEE NAME</form:label></td>
					<td><form:input path="emp_name" value="${employee.emp_name}" /></td>
				</tr>
				
				<tr>
					<td><form:label path="designation">DESIGNATION</form:label></td>
					<td><form:input path="designation" value="${employee.designation}" /></td>
				</tr>
				<tr>
					<td><form:label path="dept.dept_id">DEPARTMENT ID</form:label></td>
					<td><form:input path="dept.dept_id"
							value="${employee.dept.dept_id}" readonly="true" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="update" class="btn btn-info"/></td>
					</table>
					<br>
					<br>
					<br>
					<br>
					
					<div>
			 <input type="submit" value="Back" class="btn btn-warning"/></div>
				
			
			
		</form:form>
