<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Login Page</title>
<style>

.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color:darkred;
	background-color:lightblue ;
	border-color: Coral ;
}
.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color:darkblue;
	background-color:floralwhite;
	border-color: solid #0000;
}
#login-box {
	width: 500px;
	padding: 20px;
	margin: 100px auto;
	background-color:pink;
	-webkit-border-radius: 6px;
	-moz-border-radius: 3px;
	border: 4px solid #065;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<center>
		<h1>Login</h1>
	</center>

	<div id="login-box">

		<h3>
			Enter Username and Password
		</h3>
		<br /> <br />

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm'
			action="<c:url value='/j_spring_security_check' />" method='POST'>

			<table>
				<tr>
					<td><h3>Username:</h1></td>
					<td><input type='text' name='username' class="well" required></td>
				</tr>
				<tr>
					<td><h3>Password:</h1></td>
					<td><input type='password' name='password' class="well" required/></td>
				</tr>
				<tr>
					<td colspan='2'><br />
						<center>
							<input name="submit" type="submit" value="Login"
								class="btn btn-success" />
						</center></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>