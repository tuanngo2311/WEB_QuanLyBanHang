<%@page import="com.poly.models.User"%>
<%@page import="com.poly.dao.UserDao"%>
<%@ page pageEncoding="utf-8"%>

<!doctype html>

<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="http://demos.creative-tim.com/material-dashboard-pro/assets/img/apple-icon.png" />
<link rel="icon" type="image/png"
	href="http://demos.creative-tim.com/material-dashboard-pro/assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Update user</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Canonical SEO -->
<link rel="canonical"
	href="https://www.creative-tim.com/product/material-dashboard-pro" />
<!--  Social tags      -->
<meta name="keywords"
	content="material dashboard, bootstrap material admin, bootstrap material dashboard, material design admin, material design, creative tim, html dashboard, html css dashboard, web dashboard, freebie, free bootstrap dashboard, css3 dashboard, bootstrap admin, bootstrap dashboard, frontend, responsive bootstrap dashboard, premiu material design admin">
<meta name="description"
	content="Material Dashboard PRO is a Premium Material Bootstrap Admin with a fresh, new design inspired by Google's Material Design.">
<!-- Schema.org markup for Google+ -->
<meta itemprop="name"
	content="Material Dashboard PRO by Creative Tim | Premium Bootstrap Admin Template">
<meta itemprop="description"
	content="Material Dashboard PRO is a Premium Material Bootstrap Admin with a fresh, new design inspired by Google's Material Design.">
<meta itemprop="image"
	content="http://s3.amazonaws.com/creativetim_bucket/products/51/opt_mdp_thumbnail.jpg">
<!-- Twitter Card data -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@creativetim">
<meta name="twitter:title"
	content="Material Dashboard PRO by Creative Tim | Premium Bootstrap Admin Template">
<meta name="twitter:description"
	content="Material Dashboard PRO is a Premium Material Bootstrap Admin with a fresh, new design inspired by Google's Material Design.">
<meta name="twitter:creator" content="@creativetim">
<meta name="twitter:image"
	content="http://s3.amazonaws.com/creativetim_bucket/products/51/opt_mdp_thumbnail.jpg">
<!-- Open Graph data -->
<meta property="fb:app_id" content="655968634437471">
<meta property="og:title"
	content="Material Dashboard PRO by Creative Tim | Premium Bootstrap Admin Template" />
<meta property="og:type" content="article" />
<meta property="og:url"
	content="http://www.creative-tim.com/product/material-dashboard-pro" />
<meta property="og:image"
	content="http://s3.amazonaws.com/creativetim_bucket/products/51/opt_mdp_thumbnail.jpg" />
<meta property="og:description"
	content="Material Dashboard PRO is a Premium Material Bootstrap Admin with a fresh, new design inspired by Google's Material Design." />
<meta property="og:site_name" content="Creative Tim" />
<!-- Bootstrap core CSS     -->
<link
	href="${pageContext.request.contextPath}/examples/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link
	href="${pageContext.request.contextPath}/examples/assets/css/material-dashboard.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/examples/cssInsert/Form.css"
	rel="stylesheet" />
<style>
table.dataTable>thead>tr>th, table.dataTable>tbody>tr>th, table.dataTable>tfoot>tr>th,
	table.dataTable>thead>tr>td, table.dataTable>tbody>tr>td, table.dataTable>tfoot>tr>td
	{
	padding: 15px !important;
	outline: 0;
}
</style>
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link
	href="${pageContext.request.contextPath}/examples/assets/css/demo.css"
	rel="stylesheet" />
<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
</head>

<body>
<%
                User user2 = (User) session.getAttribute("userlogined");
                if (user2 != null) {
                   
                }else{
                    response.sendRedirect(request.getContextPath()+"/login.jsp"); 
                }
            %> 
	<div class="wrapper">
		<div class="sidebar" data-active-color="rose"
			data-background-color="black"
			data-image="${pageContext.request.contextPath}/examples/assets/img/sidebar-3.jpg">
			<!--
    Tip 1: You can change the color of active element of the sidebar using: data-active-color="purple | blue | green | orange | red | rose"
    Tip 2: you can also add an image using data-image tag
    Tip 3: you can change the color of the sidebar with data-background-color="white | black"
-->
			<div class="logo">
				<a href="dashboard.jsp" class="simple-text">
					DashBorad </a>
			</div>
			<div class="logo logo-mini">
				<a href="dashboard.jsp" class="simple-text"> DB </a>
			</div>
			<div class="sidebar-wrapper">

				<ul class="nav">
					<li><a href="./dashboard.jsp"> <i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>


					<li class="active"><a data-toggle="collapse"
						href="datatables.net.html#tablesExamples" aria-expanded="true">
							<i class="material-icons">grid_on</i>
							<p>
								Tables <b class="caret"></b>
							</p>
					</a>
						<div class="collapse in" id="tablesExamples">
							<ul class="nav">
								<li><a
									href="${pageContext.request.contextPath}/tables/show_user.jsp">Danh
										sách Users</a></li>
								<li><a
									href="${pageContext.request.contextPath}/tables/add_user.jsp">Thêm
										mới Users</a></li>
								<hr>
								<li><a
									href="${pageContext.request.contextPath}/tables/show_product.jsp">Danh
										sách Products</a></li>
								<li><a
									href="${pageContext.request.contextPath}/tables/add_product.jsp">Thêm
										mới Products</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-minimize">
						<button id="minimizeSidebar"
							class="btn btn-round btn-white btn-fill btn-just-icon">
							<i class="material-icons visible-on-sidebar-regular">more_vert</i>
							<i class="material-icons visible-on-sidebar-mini">view_list</i>
						</button>
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="">
							Update User Tables </a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="datatables.net.html#pablo"
								class="dropdown-toggle" data-toggle="dropdown"> <i
									class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
							</a></li>

							<li><a href="datatables.net.html#pablo"
								class="dropdown-toggle" data-toggle="dropdown"> <i
									class="material-icons">person</i>
									<p class="hidden-lg hidden-md">Profile</p>
							</a></li>
							<li class="separator hidden-lg hidden-md"></li>
						</ul>
						<form class="navbar-form navbar-right" role="search">
							<div class="form-group form-search is-empty">
								<input type="text" class="form-control" placeholder="Search">
								<span class="material-input"></span>
							</div>
							<button type="submit"
								class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i>
								<div class="ripple-container"></div>
							</button>
						</form>
					</div>
				</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-header-icon"
									data-background-color="purple">
									<i class="material-icons">assignment</i>
								</div>
								<div class="card-content">
									<h4 class="card-title">Update User Tables</h4>
									<div class="toolbar">
										<button class="btn btn-info">New</button>
										<!--        Here you can write extra buttons/actions for the toolbar              -->
									</div>
									<div class="material-datatables">
										<table id="datatables"
											class="table table-striped table-no-bordered table-hover"
											cellspacing="0" width="100%" style="width: 100%">
											<thead>

											</thead>
											<tbody>
											<%-- Phần nội dung giữa --%>
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                          //  out.print(id+ "  ");
                            UserDao dao = new UserDao();
                            User user = dao.findById(id);
                            
                       %>
												<form action="../UserController" method="get">
												<div>ID:<%= user.getId()%><br></div>
												
												<input type="hidden" name="id" value="<%= user.getId()%>"></input>
													<tr>
														<div class="row">
															<div class="col-25">
																<label for="fname">Username</label>
															</div>
															<div class="col-75">
																<input type="text" id="fname" name="username" value="<%= user.getUsername()%>" 
																	placeholder="Username">
															</div>
														</div>

														<div class="row">
															<div class="col-25">
																<label for="fname">Password</label>
															</div>
															<div class="col-75">
																<input type="text" id="fname" name="password" value="<%= user.getPassword()%>"
																	placeholder="Password">
															</div>
														</div>

														<div class="row">
															<div class="col-25">
																<label for="fname">Fullname</label>
															</div>
															<div class="col-75">
																<input type="text" id="fname" name="fullname" value="<%= user.getFullname()%>"
																	placeholder="Fullname">
															</div>
														</div>

														<div class="row">
															<div class="col-25">
																<label for="fname">Email</label>
															</div>
															<div class="col-75">
																<input type="text" id="fname" name="email" value="<%= user.getEmail()%>"
																	placeholder="Email">
															</div>
														</div>

														<div class="row">
															<div class="col-25">
																<label for="fname">Phone</label>
															</div>
															<div class="col-75">
																<input type="text" id="fname" name="phone" value="<%= user.getPhone()%>"
																	placeholder="Phone">
															</div>
														</div>
														
														<% int role = user.getRole();%>
														<div class="row">
															<div class="col-25">
																<label for="fname">Role</label>
															</div>
															<div class="col-75">
																<input type="radio" id="fname" name="role" value="1"
																<% if (role == 1) {
			                                                       out.print("checked");
			                                                    }%> >
																</input> 
																<span class="badge badge-primary shadow-primary m-1"
																	style="font-size: 14px; background: #414d0b">Admin
																</span>
																
																
																<input type="radio" id="fname" name="role" value="0"
																<% if (role == 0) {
			                                                       out.print("checked");
			                                                    }%> >
																</input> 
																<span
																	class="badge badge-primary shadow-primary m-1"
																	style="font-size: 14px; background: #545b62">User
																</span>
															</div>
														</div>
														<input class="inputSubmit" type="submit" id="EXE_UPDATE_user" name="_type" value="EXE_UPDATE">
													</tr>
													
												</form>
											</tbody>
										</table>
									</div>
								</div>
								<!-- end content-->
							</div>
							<!--  end card  -->
						</div>
						<!-- end col-md-12 -->
					</div>
					<!-- end row -->
				</div>
			</div>
			<footer class="footer">
				<div class="container-fluid">
					<p class="copyright pull-right">
						&copy;
						<script>
							document.write(new Date().getFullYear())
						</script>
						FPT, Polytechnic
					</p>
				</div>
			</footer>
		</div>
	</div>
	<div class="fixed-plugin">
		<div class="dropdown show-dropdown">
			<a href="datatables.net.html#" data-toggle="dropdown"> <i
				class="fa fa-cog fa-2x"> </i>
			</a>
			<ul class="dropdown-menu">
				<li class="header-title">Sidebar Filters</li>
				<li class="adjustments-line"><a href="javascript:void(0)"
					class="switch-trigger active-color">
						<div class="badge-colors text-center">
							<span class="badge filter badge-purple" data-color="purple"></span>
							<span class="badge filter badge-blue" data-color="blue"></span> <span
								class="badge filter badge-green" data-color="green"></span> <span
								class="badge filter badge-orange" data-color="orange"></span> <span
								class="badge filter badge-red" data-color="red"></span> <span
								class="badge filter badge-rose active" data-color="rose"></span>
						</div>
						<div class="clearfix"></div>
				</a></li>
				<li class="header-title">Sidebar Background</li>
				<li class="adjustments-line"><a href="javascript:void(0)"
					class="switch-trigger background-color">
						<div class="text-center">
							<span class="badge filter badge-white" data-color="white"></span>
							<span class="badge filter badge-black active" data-color="black"></span>
						</div>
						<div class="clearfix"></div>
				</a></li>
				<li class="adjustments-line"><a href="javascript:void(0)"
					class="switch-trigger">
						<p>Sidebar Mini</p>
						<div class="togglebutton switch-sidebar-mini">
							<label> <input type="checkbox" unchecked="">
							</label>
						</div>
						<div class="clearfix"></div>
				</a></li>
				<li class="adjustments-line"><a href="javascript:void(0)"
					class="switch-trigger">
						<p>Sidebar Image</p>
						<div class="togglebutton switch-sidebar-image">
							<label> <input type="checkbox" checked="">
							</label>
						</div>
						<div class="clearfix"></div>
				</a></li>
				<li class="header-title">Images</li>
				<li class="active"><a class="img-holder switch-trigger"
					href="javascript:void(0)"> <img
						src="${pageContext.request.contextPath}/examples/assets/img/sidebar-1.jpg"
						alt="" />
				</a></li>
				<li><a class="img-holder switch-trigger"
					href="javascript:void(0)"> <img
						src="${pageContext.request.contextPath}/examples/assets/img/sidebar-2.jpg"
						alt="" />
				</a></li>
				<li><a class="img-holder switch-trigger"
					href="javascript:void(0)"> <img
						src="${pageContext.request.contextPath}/examples/assets/img/sidebar-3.jpg"
						alt="" />
				</a></li>
				<li><a class="img-holder switch-trigger"
					href="javascript:void(0)"> <img
						src="${pageContext.request.contextPath}/examples/assets/img/sidebar-4.jpg"
						alt="" />
				</a></li>
				<li class="button-container">
					<div class="">
						<a
							href="http://www.creative-tim.com/product/material-dashboard-pro"
							target="_blank" class="btn btn-rose btn-block">Buy Now</a>
					</div>
					<div class="">
						<a href="http://www.creative-tim.com/product/material-dashboard"
							target="_blank" class="btn btn-info btn-block">Get Free Demo</a>
					</div>
				</li>
				<li class="header-title">Thank you for 95 shares!</li>
				<li class="button-container">
					<button id="twitter" class="btn btn-social btn-twitter btn-round">
						<i class="fa fa-twitter"></i> &middot; 45
					</button>
					<button id="facebook" class="btn btn-social btn-facebook btn-round">
						<i class="fa fa-facebook-square"> &middot;</i>50
					</button>
				</li>
			</ul>
		</div>
	</div>
</body>
<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery-3.1.1.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery-ui.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/examples/assets/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/examples/assets/js/material.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/examples/assets/js/perfect-scrollbar.jquery.min.js"
	type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/moment.min.js"></script>
<!--  Charts Plugin -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/chartist.min.js"></script>
<!--  Plugin for the Wizard -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/bootstrap-notify.js"></script>
<!--   Sharrre Library    -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery.sharrre.js"></script>
<!-- DateTimePicker Plugin -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<!-- Select Plugin -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/sweetalert2.js"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/material-dashboard.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/demo.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#datatables').DataTable(
						{
							"pagingType" : "full_numbers",
							"lengthMenu" : [ [ 10, 25, 50, -1 ],
									[ 10, 25, 50, "All" ] ],
							responsive : true,
							language : {
								search : "_INPUT_",
								searchPlaceholder : "Search records",
							}

						});

				var table = $('#datatables').DataTable();

				// Edit record
				table.on('click', '.edit', function() {
					$tr = $(this).closest('tr');

					var data = table.row($tr).data();
					alert('You press on Row: ' + data[0] + ' ' + data[1] + ' '
							+ data[2] + '\'s row.');
				});

				// Delete a record
				table.on('click', '.remove', function(e) {
					$tr = $(this).closest('tr');
					table.row($tr).remove().draw();
					e.preventDefault();
				});

				//Like record
				table.on('click', '.like', function() {
					alert('You clicked on Like button');
				});

				$('.card .material-datatables label').addClass('form-group');
			});
</script>

</html>