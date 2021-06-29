<%@page import="com.poly.models.User"%>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Index khách hàng</title>
</head>
<body>
	<%
		User user2 = (User) session.getAttribute("userlogined");
	if (user2 != null) {

	} else {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}
	%>
	<h1>Trang khach hang</h1>

	<li><a name="logoutKH"
		href="<%=request.getContextPath()%>/logout.jsp">Logout</a></li>

</body>
</html>