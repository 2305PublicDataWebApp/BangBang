<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="header">header</div>
		<div class="banner">배너공간</div>
		<div class="container">
			<div class="main">
				<div class="top">
					<div class="title">
						<h3>후기게시판</h3>
					</div>
				</div>
				<div class="mid">
					<div class="button">
						<div class="modify">
							<input type="button" value="수정">
						</div>
						<div class="delete">
							<input type="button" value="삭제">
						</div>
					</div>
					<hr>
					<div class="content">
					</div>
				</div>
				<div class="bottom">
					<div class="golist">
						<input type="button" value="목록으로">
					</div>
				</div>
			</div>
		</div>
		<div class="footer">footer</div>
	</body>
</html>