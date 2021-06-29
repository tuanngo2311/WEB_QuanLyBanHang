
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Nhom04 - Login or Logout</title>
<link
	href="${pageContext.request.contextPath}/examples/assets/css/loginjs.css"
	rel="stylesheet" />
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/Login_v11/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Login_v11/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Login_v11/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Login_v11/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Login_v11/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Login_v11/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Login_v11/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Login_v11/css/util.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Login_v11/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-45 p-b-30">
				<form class="login100-form validate-form" action="LoginController"
					method="post">
					<span class="login100-form-title p-b-30"> Login </span>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Valid username is required: ex@abc.xyz">
						<input class="input100" type="text" name="txtName" value=""
							placeholder="Username or Email"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<span class="lnr lnr-envelope"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Password is required">
						<input class="input100" type="password" name="txtPass" value=""
							placeholder="Password"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <span class="lnr lnr-lock"></span>
						</span>
					</div>

					<div class="contact100-form-checkbox m-l-4">
						<input class="input-checkbox100" id="ckb1" type="checkbox"
							name="remember-me"> <label class="label-checkbox100"
							for="ckb1"> Remember me </label>
					</div>

					<div class="container-login100-form-btn p-t-25">
						<button type="submit" name="btnLogin" class="login100-form-btn">Login</button>
					</div>
					<div class="text-center w-full ">
						<span style="color: #f02849;font-size:16px;" >
							
								<%
	                                String message = request.getParameter("message");
	                                if (message != null) {
	                                    out.print(message);
	                                }
                                %>
							
						</span>
					</div>
		
					<div class="text-center w-full p-t-42 p-b-22">
						<span class="txt1"> Or login with </span>
					</div>

					<a href="#" class="btn-face m-b-10"> <i
						class="fa fa-facebook-official"></i> Facebook
					</a> <a href="#" class="btn-google m-b-10"> <img
						src="${pageContext.request.contextPath}/Login_v11/images/icons/icon-google.png"
						alt="GOOGLE"> Google
					</a>

					<div class="text-center w-full p-t-50">
						<span class="txt1"> Not a member? </span> <a class="txt1 bo1 hov1"
							href="register.jsp"> Sign up now </a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/Login_v11/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/Login_v11/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/Login_v11/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/Login_v11/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/Login_v11/js/main.js"></script>
</body>
</html>