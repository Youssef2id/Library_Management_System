<%@page import="beans.Book"%>
<%@page import="beans.Student"%>
<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>List Books</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
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
									<th class="cell100 column7"></th>
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
									<td class="cell100 column7">
										<form class="login100-form validate-form">
											<div class="container-login100-form-btn1">
												<button name="edit" class="login100-form-btn" type="submit" value="<%=b[i].getId()%>">
													edit
												</button>
											</div>
											<div class="container-login100-form-btn1">
												<button name="delete" class="red-btn" value="<%=b[i].getId()%>">
													Delete
												</button>
											</div>
											
										</form>
									 </td>
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
		<div class='container-login100'>
				<div class='wrap-login100'>
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

		<%
		if (request.getParameter("delete") != null)
		{
			Book.delete_delete_db(Integer.parseInt(request.getParameter("delete")));
			response.sendRedirect("/Project_2019/list_books/list_books.jsp");
		}
		if (request.getParameter("edit") != null)
		{
			String url = "/Project_2019/edit_book/edit_book.jsp?id=" + request.getParameter("edit");
			response.sendRedirect(url);
			
		}
		%>
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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