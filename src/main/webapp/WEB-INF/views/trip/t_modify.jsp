<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>게시글 수정 폼</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_modify.css">
	    <link rel="stylesheet" href="/resources/css/user/footer.css">
	    <link rel="stylesheet" href="/resources/css/user/header.css">
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
	    <main>
	        <div id="main-container">
	            <div id="form">
	                <div id="title">
	                    <div style="margin-bottom: 20px;">
	                        <span>게시글 수정</span>
	                        <img id="logo-img" src="/resources/images/logo.png" alt="발도장로고"> 
	                    </div>
	                </div>
	                <div style="margin: 40px auto; max-width: 700px;">
	                    <form action="/trip/t_modify.do" method="post">
	                    	<input type="hidden" name="tripNo" value="${trip.tripNo }">
	                    	<input type="hidden" name="tAdminId" value="${trip.tAdminId }">
	                        <ul>
	                        	<li class="insert-li">
	                                <label for="type">게시글 타입</label>
	                                <input type="text" id="type" name="tripType" value="${trip.tripType }"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="tTitle">여행지이름</label>
	                                <input type="text" id="tTitle" name="tripTitle" value="${trip.tripTitle }"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="addr">주소</label>
	                                <input type="text" id="addr" name="tripAddr" value="${trip.tripAddr }"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="oneInfo">한줄소개</label>
	                                <input type="text" id="oneInfo" name="tripSummary" value="${trip.tripSummary }"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="thum">썸네일</label>
	                                <input type="file" id="thum" name="uploadFile" value="${trip.tripFilepath }">
	                                <button>파일찾기</button><br>                            
	                            </li>
	                            <li class="insert-li">
	                                <label for="infoaddr">상세주소</label>
	                                <input type="text" id="infoaddr" name="tripInfoAddr" value="${trip.tripInfoAddr }"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="home">홈페이지</label>
	                                <input type="text" id="home" name="tripHomePage" value="${trip.tripHomePage }"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="time">이용시간</label>
	                                <input type="text" id="time" name="tripTime" value="${trip.tripTime }"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="price">이용금액</label>
	                                <input type="text" id="price" name="tripPrice" value="${trip.tripPrice }"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="content">상세정보</label>
	               					<textarea wrap="hard" rows="10" cols="55" id="content" name="tripContent"></textarea>
<!-- 	                                <input type="text" id="info" name="tinfo" value=""><br> -->
	                            </li>
	                        </ul>
	                        <div id="btn-div">
								<button id="btnbtn">등록</button>
							</div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </main>
	    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	    <script>
// 		    $(document).ready(function () {
// 		        $('#summernote').summernote({
// 		            placeholder: '내용을 작성하세요',
// 					value: "${trip.tripContent }",
// 		            height: 400,
// 		            maxHeight: 400
// 		        });
// 		    });
	    </script>
	</body>
</html>