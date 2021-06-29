<%@ page pageEncoding="utf-8"%>
<%@page import="com.poly.models.User"%>
<!doctype jspl>
<jspl lang="en">
<head>
<title>Index Admin</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<!-- Bootstrap core CSS     -->
<link
	href="${pageContext.request.contextPath}/examples/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link
	href="${pageContext.request.contextPath}/examples/assets/css/material-dashboard.css"
	rel="stylesheet" />
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
				<a href="tables/dashboard.jsp" class="simple-text">
					DashBoard </a>
			</div>
			<div class="sidebar-wrapper">
				<div class="user">
					<div class="photo">
						<img
							src="${pageContext.request.contextPath}/examples/assets/img/faces/avatar.jpg" />
					</div>
					<div class="info" name="txtLogout">
						<a data-toggle="collapse"
							href="datatables.net.jspl#collapseExample" class="collapsed">
							
							<%
				                User user2 = (User) session.getAttribute("userlogined");
				                if (user2 != null) 
				                    out.print("Xin chào: " + user2.getUsername());
				                else
				                    response.sendRedirect(request.getContextPath()+"/login.jsp"); 
				            %> 
							
							<b class="caret"></b>
						</a>
						<div class="collapse" id="collapseExample">
							<ul class="nav">
								<li><a style="cursor:pointer">My Profile</a></li>
								<li><a style="cursor:pointer">Edit Profile</a></li>
								<li><a name="logoutAD" href="<%= request.getContextPath()%>/logout.jsp">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
				<ul class="nav">
					<li class="active"><a href="tables/dashboard.jsp"> <i
							class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a>
					<li><a data-toggle="collapse" name="txtDashboard"
						href="dashboard.jsp#tablesExamples"> <i class="material-icons">grid_on</i>
							<p>
								Tables <b class="caret"></b>
							</p>
					</a>
						<div class="collapse" id="tablesExamples">
							<ul class="nav">
								<li><a name="showUser"
									href="${pageContext.request.contextPath}/tables/show_user.jsp">Danh
										sách Users</a></li>
								<li><a name="addUser"
									href="${pageContext.request.contextPath}/tables/add_user.jsp">Thêm
										mới User</a></li>
								<hr>
								<li><a name="showProduct"
									href="${pageContext.request.contextPath}/tables/show_product.jsp">Danh
										sách Product</a></li>
								<li><a name="addProduct"
									href="${pageContext.request.contextPath}/tables/add_product.jsp">Thêm
										mới Product</a></li>
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
						<a class="navbar-brand" href="dashboard.jsp#"> Dashboard </a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="dashboard.jsp#pablo" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
							</a></li>
							<li class="dropdown"><a href="dashboard.jsp#"
								class="dropdown-toggle" data-toggle="dropdown"> <i
									class="material-icons">notifications</i> <span
									class="notification">5</span>
									<p class="hidden-lg hidden-md">
										Notifications <b class="caret"></b>
									</p>
							</a>
								<ul class="dropdown-menu">
									<li><a href="dashboard.jsp#">Mike John responded to
											your email</a></li>
									<li><a href="dashboard.jsp#">You have 5 new tasks</a></li>
									<li><a href="dashboard.jsp#">You're now friend with
											Andrew</a></li>
									<li><a href="dashboard.jsp#">Another Notification</a></li>
									<li><a href="dashboard.jsp#">Another One</a></li>
								</ul></li>
							<li><a href="dashboard.jsp#pablo" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="material-icons">person</i>
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


				<h3>Manage Listings</h3>
				<br>
				<div class="row">
					<div class="col-md-4">
						<div class="card card-product">
							<div class="card-image" data-header-animation="true">
								<a href="dashboard.jsp#pablo"> <img class="img"
									src="${pageContext.request.contextPath}/examples/assets/img/card-2.jpeg">
								</a>
							</div>
							<div class="card-content">
								<div class="card-actions">
									<button type="button"
										class="btn btn-danger btn-simple fix-broken-card">
										<i class="material-icons">build</i> Fix Header!
									</button>
									<button type="button" class="btn btn-default btn-simple"
										rel="tooltip" data-placement="bottom" title="View">
										<i class="material-icons">art_track</i>
									</button>
									<button type="button" class="btn btn-success btn-simple"
										rel="tooltip" data-placement="bottom" title="Edit">
										<i class="material-icons">edit</i>
									</button>
									<button type="button" class="btn btn-danger btn-simple"
										rel="tooltip" data-placement="bottom" title="Remove">
										<i class="material-icons">close</i>
									</button>
								</div>
								<h4 class="card-title">
									<a href="dashboard.jsp#pablo">Cozy 5 Stars Apartment</a>
								</h4>
								<div class="card-description">The place is close to
									Barceloneta Beach and bus stop just 2 min by walk and near to
									"Naviglio" where you can enjoy the main night life in
									Barcelona.</div>
							</div>
							<div class="card-footer">
								<div class="price">
									<h4>$899/night</h4>
								</div>
								<div class="stats pull-right">
									<p class="category">
										<i class="material-icons">place</i> Barcelona, Spain
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card card-product">
							<div class="card-image" data-header-animation="true">
								<a href="dashboard.jsp#pablo"> <img class="img"
									src="${pageContext.request.contextPath}/examples/assets/img/card-3.jpeg">
								</a>
							</div>
							<div class="card-content">
								<div class="card-actions">
									<button type="button"
										class="btn btn-danger btn-simple fix-broken-card">
										<i class="material-icons">build</i> Fix Header!
									</button>
									<button type="button" class="btn btn-default btn-simple"
										rel="tooltip" data-placement="bottom" title="View">
										<i class="material-icons">art_track</i>
									</button>
									<button type="button" class="btn btn-success btn-simple"
										rel="tooltip" data-placement="bottom" title="Edit">
										<i class="material-icons">edit</i>
									</button>
									<button type="button" class="btn btn-danger btn-simple"
										rel="tooltip" data-placement="bottom" title="Remove">
										<i class="material-icons">close</i>
									</button>
								</div>
								<h4 class="card-title">
									<a href="dashboard.jsp#pablo">Office Studio</a>
								</h4>
								<div class="card-description">The place is close to Metro
									Station and bus stop just 2 min by walk and near to "Naviglio"
									where you can enjoy the night life in London, UK.</div>
							</div>
							<div class="card-footer">
								<div class="price">
									<h4>$1.119/night</h4>
								</div>
								<div class="stats pull-right">
									<p class="category">
										<i class="material-icons">place</i> London, UK
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card card-product">
							<div class="card-image" data-header-animation="true">
								<a href="dashboard.jsp#pablo"> <img class="img"
									src="${pageContext.request.contextPath}/examples/assets/img/card-1.jpeg">
								</a>
							</div>
							<div class="card-content">
								<div class="card-actions">
									<button type="button"
										class="btn btn-danger btn-simple fix-broken-card">
										<i class="material-icons">build</i> Fix Header!
									</button>
									<button type="button" class="btn btn-default btn-simple"
										rel="tooltip" data-placement="bottom" title="View">
										<i class="material-icons">art_track</i>
									</button>
									<button type="button" class="btn btn-success btn-simple"
										rel="tooltip" data-placement="bottom" title="Edit">
										<i class="material-icons">edit</i>
									</button>
									<button type="button" class="btn btn-danger btn-simple"
										rel="tooltip" data-placement="bottom" title="Remove">
										<i class="material-icons">close</i>
									</button>
								</div>
								<h4 class="card-title">
									<a href="dashboard.jsp#pablo">Beautiful Castle</a>
								</h4>
								<div class="card-description">The place is close to Metro
									Station and bus stop just 2 min by walk and near to "Naviglio"
									where you can enjoy the main night life in Milan.</div>
							</div>
							<div class="card-footer">
								<div class="price">
									<h4>$459/night</h4>
								</div>
								<div class="stats pull-right">
									<p class="category">
										<i class="material-icons">place</i> Milan, Italy
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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


<!--  Charts Plugin -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/bootstrap-notify.js"></script>
<!--   Sharrre Library    -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jquery.sharrre.js"></script>

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
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/jasny-bootstrap.min.js"></script>
<!-- Material Dashboard javascript methods -->
<script
	src="${pageContext.request.contextPath}/examples/assets/js/material-dashboard.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/examples/assets/js/demo.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		// Javascript method's body can be found in assets/js/demos.js
		demo.initDashboardPageCharts();

		demo.initVectorMap();
	});
</script>

</jspl>