<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기게시판등록</title>
		<link rel="stylesheet" href="/resources/css/user/footer.css">
		<script src="/resources/summernote/summernote-lite.js"></script>
		<script src="/resources/summernote/summernote-ko-KR.js.js"></script>
		<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	</head>
	<body>
    	<header>
    		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    	</header>
    	
    	<div class="container">
    		<div class="main">
    			<div class="reviewsubject">
    				<span>후기 등록</span>
    			</div>
    			<hr>
    			<div class="reviewform">
    				<form action="/review/r_insert.do" method="post">
    					<ul>
    						<li>
    							<label>유형</label>
    							여행지<input type="radio" name="reviewtype" value="L">
    							축제<input type="radio" name="reviewtype" value="F">
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
    						<input type="submit" value="등록">
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