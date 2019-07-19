<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Manage Students</title>
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
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-10 p-b-20">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-40">
						MANAGE STUDENTS 
					</span>
					<span class="login100-form-avatar">
						<img src="images/student.gif" alt="AVATAR">
					</span>

					<div class="container-login100-form-btn1">
						<button name="choice" class="login100-form-btn" value="list students">
							list students
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button name="choice" class="login100-form-btn" value="add a student">
							add a student
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button name="choice" class="login100-form-btn" value="Find a student">
							Find a student
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button  name="choice" class="login100-form-btn" value="back to menu">
							back to menu
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<%
		String value = null;
		try
		{
		 	value = request.getParameter("choice");
			switch (value)
			{
				case "list students":
					response.sendRedirect("/Project_2019/list_students/list_students.jsp");
					break;
				case "add a student":
					response.sendRedirect("/Project_2019/REGISTRATION/registration.jsp");
					break;
				case "Find a student":
					response.sendRedirect("/Project_2019/find_student/find_student.jsp");
					break;
				case "back to menu":
					response.sendRedirect("/Project_2019/menu/menu.jsp");
					break;
				default :
					response.sendRedirect("https://www.google.com");
					break;
			}
		}
		catch(NullPointerException e)
		{
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