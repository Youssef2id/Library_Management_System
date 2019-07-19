<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="beans.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
		<%
		String name = request.getParameter("name");
		String firstname = request.getParameter("firstname");
		String cin = request.getParameter("cin");
		String level = request.getParameter("level");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		int valid = 0;
		if (name != null && firstname != null && cin != null
			&& level != null && birthday != null && email != null)
			valid = 1;
		Student s = new Student(name, firstname, cin, level, birthday, email);
		if(valid == 1)
			out.println("<title>Valid Information</title>");
		else
			out.println("<title>Invalid Information</title>");
	%>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<%
		if (valid == 1 ){%>
		<div class='limiter'>
			<div class='container-login100'>
				<div class='wrap-login100 p-t-85 p-b-20'>
					<form class='login100-form validate-form' action='/Project_2019/list_students/list_students.jsp'>
						<span class='login100-form-title p-b-70'>
							Student Edited Successfully
						</span>
						<span class='login100-form-avatar'>
							<img src='images/checked.png' alt='AVATAR'>
						</span>
						<div class='container-login100-form-btn'>
							<button class='login100-form-btn'>
								Return To The List
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%}
		if (valid == 1)
		{
			s.update_student_db(s);
			session.invalidate();
		}
	%>
	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>