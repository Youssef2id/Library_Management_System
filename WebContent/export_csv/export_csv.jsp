<%@page import="beans.Student"%>
<%@page import="beans.Book"%>
<%@page import="beans.Borrowed"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Export DataBase</title>
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
		response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 
	 	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
		
		Borrowed bor[];
		Book b[];
		Student s[];
		
		bor = Borrowed.recupererTout();
		b = Book.recupererTout();
		s = Student.recupererTout();
		
		Student.export_csv(s);
		Book.export_csv(b);
		Borrowed.export_csv(bor);
	%>
	<script>
function myFunction() {
  alert("I am an alert box!");
	}
</script>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-10 p-b-20">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-20">
						Export DataBase 
					</span>
					<span class="login100-form-avatar">
						<img src="images/loader.gif" alt="AVATAR">
					</span>

					<div class="container-login100-form-btn1">
						<button type="submit" onclick="window.open('/Project_2019/CSV_FILES/Students.csv')" class="login100-form-btn" value="manage books">
							Export Students
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button name="choice" type="submit" onclick="window.open('/Project_2019/CSV_FILES/Books.csv')" class="login100-form-btn" value="manage students">
							Export Books
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button name="choice" type="submit" onclick="window.open('/Project_2019/CSV_FILES/Borrowed.csv')" class="login100-form-btn" value="borrow a book">
							Export Borrowed Books
						</button>
					</div>

					<div class="container-login100-form-btn">
						<button name="choice" class="login100-form-btn" value="Return">
							Return To The Menu
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>	
<%
	try {
	if (request.getParameter("choice").equals("Return"))
		response.sendRedirect("/Project_2019/menu/menu.jsp");
	} catch (NullPointerException e)
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