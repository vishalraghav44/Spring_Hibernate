<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<h2><center>Registration of a New Employee</center></h2>
<style>
body{
background-color: BurlyWood ;
}
</style>
</head>
<body>


  
   <form action="add" align="center">
     
       
    <table border="4" width="50%" cellpadding="2" class="table table-hover">
  
     <tr>
       <td class="warning"><h4>Employee ID :</h4></td> <td class="warning"> <input type="text" name="emp_id" required/></td>

    </tr>
   
    <tr>
      <td class="success"><h4> Employee Name :</h4> </td> <td class="warning"> <input type="text" name="emp_name" required/></td>

    </tr>
    <tr>
         <td class="danger"><h4> DESIGNATION :</h4> </td> <td class="warning"> <input type="text" name="designation" required/></td>
     </tr>
    <tr>
         <td class="info"><h4> Department ID : </h4></td> <td class="warning"> <input type="text" name="dept.dept_id" required/></td>
    </tr>
    <tr>
        <td colspan="8" class="success" >
            <input type="submit" value="Add New Record" class="btn btn-info"/>
        </td>
     </tr>
</table> 	

</body>
</html>
