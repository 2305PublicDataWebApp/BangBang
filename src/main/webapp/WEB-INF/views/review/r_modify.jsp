<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기게시판 수정</title>
		<link rel="stylesheet" href="/resources/css/user/footer.css">
	</head>
	<body>
    	<header>
    		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    	</header>
    	
    	<div class="container">
    		<div class="main">
    			<div class="reviewsubject">
    				<span>후기 수정</span>
    			</div>
    			<hr>
    			<div class="reviewform">
    				<form action="/review/r_modify.do" method="post">
    					<ul>
    						<li>
    							<label>유형</label>
    							여행지<input type="radio" name="reviewtype" value="01">
    							축제<input type="radio" name="reviewtype" value="02">
    						</li>
    						<li>
    							<label>제목</label>
    							<input type="text" name="reviewtitle" style="width:400px;height:40px";>
    						</li>
							<li>
								<label>작성자</label>
								<span>${userId }</span>
							</li>
							<li>
								<label>내용</label>
    							<textarea name="content" id="summernote" value="summernote"></textarea>
							</li>
    					</ul>
    					<div class="button">
    						<input type="submit" value="수정">
    					</div>
    				</form>
    			</div>
    		</div>
    	</div>
    	
    	<footer>
    		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
    	</footer>
	</body>
</html>