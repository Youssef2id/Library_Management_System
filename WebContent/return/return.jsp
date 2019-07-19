<%@page import="beans.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
    <link href="css/main1.css" rel="stylesheet" />
  </head>
  <body>
    <div class="s003">
      <form action="/Project_2019/return/return.jsp">
        <div class="inner-form">
          <div class="input-field second-wrap">
            <input id="search" type="text" placeholder="Student Cin" name="search"/>
          </div>
          <div class="input-field third-wrap">
            <button class="btn-search" type="submit">
              <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
              </svg>
            </button>
          </div>
        </div>
      </form>
    </div>
    
    <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100" style="margin-bottom: -120;">
				<div class="table100 ver1 m-b-110">
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
	if (request.getParameter("search") != null)
	{
		s = Student.recupererTout(request.getParameter("search"));
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
										<form class="login100-form validate-form" action="/Project_2019/return/return_page_2.jsp">
											<div class="container-login100-form-btn1">
												<button name="cin" class="login100-form-btn" type="submit" value="<%=s[i].getCin()%>">
													Select
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
    <script src="js/extention/choices.js"></script>
    <script>
      const choices = new Choices('[data-trigger]',
      {
        searchEnabled: false,
        itemSelectText: '',
      });

    </script>
  </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
