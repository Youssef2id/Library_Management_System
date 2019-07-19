<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="beans.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Required meta tags-->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Colorlib Templates">
	<meta name="author" content="Colorlib">
	<meta name="keywords" content="Colorlib Templates">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor1/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor1/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor1/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor1/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main1.css">
	<!-- Title Page-->
	<title>Update The Stock Of a Book</title>

	<!-- Icons font CSS-->
	<link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
	<link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
	<!-- Font special for pages-->
	<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	<!-- Vendor CSS-->
	<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
	<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

	<!-- Main CSS-->
	<link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
	<div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
		<div class="wrapper wrapper--w780">
			<div class="card card-3">
				<div class="card-heading"></div>
				<div class="card-body">
					<h2 class="title">Update The Stock Of a Book</h2>
					<form method="POST" action="/Project_2019/added_book/added_book.jsp">
						
						<div class="input-group">
							<input class="input--style-3" type="number" min="1" placeholder="Book Id" name="id">
						</div>

						<div class="input-group">
							<input class="input--style-3" type="number" min="0" placeholder="Nuber Of Books" name="stock">
						</div>

						<div class="p-t-10">
							<button class="btn btn--pill btn--green" type="submit">Update Stock</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	<br>
	<br>
	<br>
	<h2 class="title"  align="center">List Of Available Books</h2>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Book Id</th>
									<th class="cell100 column2">Name</th>
									<th class="cell100 column3">Edition Number</th>
									<th class="cell100 column4">Stock</th>
									<th class="cell100 column5">Date</th>
								</tr>
							</thead>
						</table>
					</div>
				<%
					Book b[] = null;
					if (request.getParameter("find_id") != null)
					{
						b = Book.recupererTout(Integer.parseInt(request.getParameter("find_id")));
						if (b.length == 0)
							out.println("BOOK NOT FOUND");
					}
					else
						b = Book.recupererTout();
					int i = 0;
					
					while (i < b.length)
					{
				%>
					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<tr class="row100 body">
									<td class="cell100 column1"><%=b[i].getId()%></td>
									<td class="cell100 column2"><%=b[i].getName()%></td>
									<td class="cell100 column3"><%=b[i].getNumber()%></td>
									<td class="cell100 column4"><%=b[i].getStock()%></td>
									<td class="cell100 column5"><%=b[i].getDate()%></td>
									
								</tr>
								</tbody>
								</table>
							</div>
<%
 i++;
}
%>
				</div>
			</div>
		</div>
	
			<div class='container-login100'>
				<div class='wrap-login100 p-b-220'>
					<form class='login100-form validate-form' action='/Project_2019/menu/menu.jsp'>
						<div class='container-login100-form-btn'>
							<button class='login100-form-btn'>
								Return To The Menu
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/datepicker/moment.min.js"></script>
	<script src="vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="js/global.js"></script>
	
	
	<!--===============================================================================================-->	
	<script src="vendor1/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor1/bootstrap/js/popper.js"></script>
	<script src="vendor1/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor1/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor1/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
<!-- end document-->