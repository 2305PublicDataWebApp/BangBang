<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항수정</title>
		<link rel="stylesheet" href="../resouces/css/notice/n_modify.jsp">
		<link rel="stylesheet" href="/resources/css/user/header.css">
		<link rel="stylesheet" href="/resources/css/user/footer.css">
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		</header>
    	<div class="contatiner">
    		<div class="main">
    			<h2>공지사항 등록</h2>
    			<hr>
    			<form action="/notice/n_modify.do" method="post">
    				<table class="noticeform">
    					<tr>
    						<td>제목</td>
    						<td>
    							<input type="text" name="noticeTitle" value="${notice.noticeTitle }" style="width:400px;height:40px;">
    						</td>
    					</tr>
    					<tr>
    						<td>작성자</td>
    						<td><span>${adminId }</span></td>
    					</tr>
    					<tr>
    						<td>내용</td>
    						<td>
    							<textarea rows="4" cols="50" name="noticeContent">${notice.noticeContent }</textarea>
    						</td>
    					</tr>
    				</table>
    				<div>
    					<input type="submit" value="수정하기">
    				</div>
    			</form>
    		</div>
    	</div>
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</footer>
	</body>
</html>