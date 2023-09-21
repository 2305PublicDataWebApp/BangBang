<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기게시판등록</title>
    	<link rel="stylesheet" href="/resources/css/user/header.css">
    	<link rel="stylesheet" href="/resources/css/user/footer.css">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	    <!-- 썸머노트를 위한 import -->
		<script src="../resources/js/summernote/summernote-lite.js"></script>
		<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css">
	</head>
	<body>
    	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    	
    	<div class="container">
    		<div class="center">
    			<div class="reviewsubject">
    				<h2><span>후기 등록</span></h2>
    			</div>
    			<hr>
    			<div class="reviewform">
    				<form action="/review/r_insert.do" method="post">
    					<ul>
    						<li>
    							<label>유형</label>
    							<select name="rtype">
    								<option value="location">여행지</option>
    								<option value="festival">축제</option>
    							</select>
    						</li>
    						<li>
    							<label>제목</label>
    							<input type="text" name="reviewTitle" style="width:400px;height:40px";>
    						</li>
							<li>
								<label>내용</label>
    							<textarea id="summernote" name="reviewContent"></textarea>
							</li>
    					</ul>
    					<div class="button">
    						<input type="submit" value="등록">
    					</div>
    				</form>
    			</div>
    		</div>
    	</div>
    	
    	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
    	<script>
    	 $(document).ready(function () {
		        $('#summernote').summernote({
		            placeholder: '내용을 작성하세요',
		            height: 400,
		            maxHeight: 400
		        });
		    });
    	</script>
	</body>
</html>