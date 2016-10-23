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
	background-color:cornsilk;
	border-color: cornsilk;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color:darkblue;
	background-color:floralwhite;
	border-color: #floralwhite;
}

#login-box {
	width: 400px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border: 1px solid #003;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<center>
		<h1>Login</h1>
	</center>

	<div id="login-box">

		<h4>
			Enter Username and Password
		</h4>
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
					<td><b>User:</b></td>
					<td><input type='text' name='username'></td>
				</tr>
				<tr>
					<td><b>Password:</b></td>
					<td><input type='password' name='password' /></td>
				</tr>
				<tr>
					<td colspan='2'><br />
						<center>
							<input name="submit" type="submit" value="submit"
								class="btn-info" />
						</center></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>