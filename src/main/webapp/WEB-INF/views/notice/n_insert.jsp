<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항등록</title>
		<link rel="stylesheet" href="/resources/css/notice/n_insert.css">
		<link rel="stylesheet" href="/resources/css/user/header.css">
		<link rel="stylesheet" href="/resources/css/user/footer.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
	</head>
	<body>
    	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    	<div class="container">
    		<div class="center">
    			<div class="noticesubject">
    				<span>공지 등록</span>
    			</div>
    			<hr>
    			<form action="/notice/n_insert.do" method="post">
    				<table class="noticeform" >
    					<tr>
    						<td class="title">제목</td>
    						<td>
    							<input class="title2" type="text" name="noticeTitle">
    						</td>
    					</tr>
    					<tr>
    						<td class="content">내용</td>
    						<td>
    							<textarea cols="120" rows="30" name="noticeContent"></textarea>
    						</td>
    					</tr>
    				</table>
    				<div>
    					<input class="button" type="submit" value="등록하기">
    				</div>
    			</form>
    		</div>
    	</div>
    	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>