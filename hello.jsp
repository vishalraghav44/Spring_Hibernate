<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <style>
        body{
            background-color: darkseagreen;
            
        }
        h1{
            text-decoration-color: currentColor;
            transform-style: preserve-3d;
        }
        h2{
           background- 
        }
    </style>
</head>
<body>
	 <center>
		<h1>Welcome</h1>

		<!-- For login user -->
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm"></form>
		<form action="http://10.0.61.62:8080/BRD4UPDATED/viewemp/${pageContext.request.userPrincipal.name}"
			id="viewForm"></form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
			function viewSubmit() {
				document.getElementById("viewForm").submit();
			}
		</script>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				<b>Hello User</b> : ${pageContext.request.userPrincipal.name} | <a href="javascript:formSubmit()"> Logout</a>
				<br>
				<a href="javascript:viewSubmit()/${pageContext.request.userPrincipal.name}">
					Click Here To View Employees</a>
			</h2>
		</c:if>
	 </center> 
</body>
</html>