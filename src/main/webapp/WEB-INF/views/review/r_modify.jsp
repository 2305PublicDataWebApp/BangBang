<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기게시판 수정</title>
		<link rel="stylesheet" href="/resources/css/review/r_modify.css">
		<link rel="stylesheet" href="/resources/css/user/header.css">
		<link rel="stylesheet" href="/resources/css/user/footer.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
		
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
    		<div class="secenter">
    			<div class="reviewsubject">
    				<span>후기 수정</span>
    			</div>
    			<hr>
    			<div class="reviewform">
    				<form action="/review/r_modify.do" method="post">
    					<input type="hidden" name="reviewNo" value="${review.reviewNo }">
    					<input type="hidden" name="rUserId" value="${review.rUserId }">
    					<ul>
    						<li class="one">
    							<label class="type">유형</label>
    							<input type="radio" name="reviewType" value="여행지">여행지
    							<input type="radio" name="reviewType" value="축제">축제
    						</li>
    						<li class="two">
    							<label class="sub">제목</label>
    							<input class="titbox" type="text" name="reviewtitle" value="${review.reviewTitle }" style="width:400px;height:40px";>
    						</li>
							<li>
    							<textarea id="summernote" name="reviewContent"></textarea>
							</li>
    					</ul>
    					<div>
    						<input class="button" type="submit" value="수정하기">
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