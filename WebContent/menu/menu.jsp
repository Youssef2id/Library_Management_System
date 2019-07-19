<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Menu</title>
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
						MENU 
					</span>
					<span class="login100-form-avatar">
						<img src="images/welcome.gif" alt="AVATAR">
					</span>

					<div class="container-login100-form-btn1">
						<button name="choice" class="login100-form-btn" value="manage books">
							manage books
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button name="choice" class="login100-form-btn" value="manage students">
							manage students
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button name="choice" class="login100-form-btn" value="borrow a book">
							borrow a book
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button name="choice" class="login100-form-btn" value="Return a book">
							Return a book
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button  name="choice" class="login100-form-btn" value="export cvs data  base">
							export cvs data  base
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
				case "manage books":
					response.sendRedirect("/Project_2019/manage_books/manage_books.jsp");
					break;
				case "manage students":
					response.sendRedirect("/Project_2019/student_menu/student_menu.jsp");
					break;
				case "borrow a book":
					response.sendRedirect("/Project_2019/borrow/borrow.jsp");
					break;
				case "Return a book":
					response.sendRedirect("/Project_2019/return/return.jsp");
					break;
				case "export cvs data  base":
					response.sendRedirect("/Project_2019/export_csv/export_csv.jsp");
					break;
			}
		}
		catch(NullPointerException e)
		{
		}
	%>	
			<form class="logout100-form validate-form" action="logout.jsp">
				<div class="container-logout100-form-btn">
						<button  name="logout" class="logout100-form-btn" type="submit" value="logout">
							logout
						</button>
					</div>
			</form>
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