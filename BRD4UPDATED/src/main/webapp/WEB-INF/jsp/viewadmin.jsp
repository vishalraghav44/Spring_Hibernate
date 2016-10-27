
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Graph Display</title>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
   window.onload = function () {
	 var chart = new CanvasJS.Chart("chartContainer", {
		theme: "theme3",//theme1
		title:{
			text: "EMPLOYEE DEPARTMENT GRAPH BY RAGHAV", 
				fontFamily: "arial black"
		},
		animationEnabled: false,   // change to true
		data: [              
		{
			type: "column",
			click: onClick,
			dataPoints: [
				<c:forEach var="e" items="${list}"> 
				{ label: "${e.dept_id}", y:${e.count}},			   			 			   
			    </c:forEach>
			]
		}
		]
	});
	chart.render();
	function onClick(e) {
		window.location = 'http://10.0.61.62:8080/BRD4UPDATED/empdept/' + e.dataPoint.label;
  }
}
</script>

<style>
.sociable ul {
    margin: 0px;
    padding: 0px;
    list-style: none;
}
.sociable ul li {
    display: inline-block;
    font-size: 40px;
    background: lightblue;
    padding: 4px 0px 0px 0px;
    border-radius: 100%;
    height: 48px;
    width: 48px;
    text-align: center;
}
.sociable ul li.fb  {
    background: #3B5998;
    color: #fff;
}
.sociable ul li.fb:hover a {

    color: #fff;
}

.sociable ul li.twitter {
    background: #1DA1F2;
    color: white;
}
.sociable ul li.twitter:hover a {

    color: #fff;
}

.sociable ul li.youtube {
    background: #C8302A;
    color:white;
}
.sociable ul li.youtube:hover  a {

    color: white;
}

</style>

</head>

<body>

	
	
	<center>
		<h1>Table</h1>
		<table border="2" width="70%" cellpadding="2" class="table table-hover">
			<tr class="active">
				<td class="success">Department Id</td>
				<td class="danger">No of Employees</td>
			</tr>
			<c:forEach var="count" items="${list}">
				<tr >
					<td class="warning">${count.dept_id}</td>
					<td class="info" >${count.count}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
	</center>
	<br>


	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
	<div id="click">
		<c:choose>
			<c:when test="${!empty employee}">
			<center>
				<center>
					 <form action="http://10.0.61.62:8080/BRD4UPDATED/addemp">
						 <input type="submit" value="Add New Employee" class="btn btn-info" />
				     </form>
				</center>
				
				<br />
				<br />
					
				<form action="http://10.0.61.62:8080/BRD4UPDATED/search">
					<input type="text" name="emp" class="well" required/> <input type="submit"
						value="Search" class="btn btn-success"/>
				</form>
				<br>
				<form action="http://10.0.61.62:8080/BRD4UPDATED/sort">
					<select name="name" class="well">
						<option value="emp_name">Employee_Name</option>
						<option value="emp_id">Employee_Id</option>
						
					</select> <select name="type" class="well">
						<option value="ASC">Ascending</option>
						<option value="DESC">Descending</option>
					</select> <input type="submit" value="Sort" class="btn btn-danger" />
					<br> <br>
					<br>
					<div>
					
				</form>
				</center>
				<br>
				<center>
					<table border="2" width="70%" cellpadding="2" class="table table-striped">
					<tr>
						<td><b>Employee Id</b></td>
						<td><b>Name</b></td>
						<td><b>Designation</b></td>
						<td><b>Department Id</b></td>
						<td><b>Edit Employee</b></td>
						<td><b>Delete Employee</b></td>
						
						</tr>
						<c:forEach var="count" items="${employee}">
							<tr>
							    <td class="success">${count.emp_id}</td>
							    <td class="info">${count.emp_name}</td>
								<td class="danger">${count.designation}</td>
								<td class="warning">${count.dept.dept_id}</td>
								<!---------- 
								<td><a href="http://10.0.61.62:8080/BRD4UPDATED/delete/${count.emp_id}/${count.dept.dept_id}">Delete</a></td> -->
						        <td><a href="http://10.0.61.62:8080/BRD4UPDATED/edit/${count.emp_id}">Edit</a></td>
								<td><a href="http://10.0.61.62:8080/BRD4UPDATED/delete/${count.emp_id}">Delete</a></td>
							</tr>
						</c:forEach>
					</table>
				</center>
			</c:when>
			<c:otherwise>
				<div>
					<center>No Match Found....</center>
				</div>
			</c:otherwise>
		</c:choose>
	
	<br> 
	<br>
	
	 </div >
	   <center>
	        <form action="http://10.0.61.62:8080/BRD4UPDATED/hello">
					<input type="submit" value="Back"  class="btn btn-warning">
			</form>
		</center>
	</div>
	
	<br>
	<br>
	
	 <!-- Footer -->
	 <center>
        <footer id="footer">
            <div class="sociable">
                <ul>
		<li class="fb"><a href="#">
		<span class="fa fa-facebook" aria-hidden="true"></span>
		</a></li>
		<li class="twitter"><a href="#"><span class="fa fa-twitter" aria-hidden="true"></span></a></li>
		<li class="youtube"><a href="#"><span class="fa fa-youtube" aria-hidden="true"></span></a></li>
	</ul>
            </div>
        </footer>
        </center>
    </div>
    
   
</body>
</html>
