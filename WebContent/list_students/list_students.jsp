<%@page import="beans.Student"%>
<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>List Students</title>
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
									<th class="cell100 column1">Name</th>
									<th class="cell100 column2">First Name</th>
									<th class="cell100 column3">CIN</th>
									<th class="cell100 column4">Level</th>
									<th class="cell100 column5">Birthday</th>
									<th class="cell100 column6">Email</th>
									<th class="cell100 column7"></th>
								</tr>
							</thead>
						</table>
					</div>
<%
	Student s[] = null;
	if (request.getParameter("find_cin") != null)
	{
		s = Student.recupererTout(request.getParameter("find_cin"));
		if (s.length == 0)
			out.println("STUDENT NOT FOUND");
	}
	else
		s = Student.recupererTout();
	int i = 0;

	while (i < s.length)
	{
%>
					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<tr class="row100 body">
									<td class="cell100 column1"><%=s[i].getName()%></td>
									<td class="cell100 column2"><%=s[i].getFirst_name()%></td>
									<td class="cell100 column3"><%=s[i].getCin()%></td>
									<td class="cell100 column4"><%=s[i].getLevel()%></td>
									<td class="cell100 column5"><%=s[i].getBirthday()%></td>
									<td class="cell100 column6"><%=s[i].getEmail()%></td>
									<td class="cell100 column7">
										<form class="login100-form validate-form">
											<div class="container-login100-form-btn1">
												<button name="edit" class="login100-form-btn" type="submit" value="<%=s[i].getCin()%>">
													edit
												</button>
											</div>
											<div class="container-login100-form-btn1">
												<button name="delete" class="red-btn" value="<%=s[i].getCin()%>">
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
		</div>
	</div>
		<div class='limiter'>
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
		<%
		if (request.getParameter("delete") != null)
		{
			Student.delete_student_db(request.getParameter("delete"));
			response.sendRedirect("/Project_2019/list_students/list_students.jsp");
		}
		if (request.getParameter("edit") != null)
		{
			String url = "/Project_2019/edit_student/edit_student.jsp?id=" + request.getParameter("edit");
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