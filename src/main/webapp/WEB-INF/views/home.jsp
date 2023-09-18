<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Home</title>
	</head>
	<body>
		<c:if test="${ userId ne null }">
		<form action="/user/mypage.do" method="post">
			<input type="hidden" name="userId" value="${ userId }">
			<input type="submit" id="myPageBtn" value="마이페이지">
		</form>
		</c:if>
	</body>
</html>
