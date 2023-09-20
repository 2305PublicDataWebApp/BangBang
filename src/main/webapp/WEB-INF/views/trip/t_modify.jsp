<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>게시글 수정 폼</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_modify.css">
	    
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
	    <header>
	
	    </header>
	    <main>
	        <div id="main-container">
	            <div id="form">
	                <div id="title">
	                    <div style="margin-bottom: 20px;">
	                        <span>게시글 수정</span>
	                        <img src="/resources/images/logo.png" alt="발도장로고"> 
	                    </div>
	                </div>
	                <div style="margin: 40px auto; max-width: 700px;">
	                    <form action="/trip/t_modify.do" method="post">
	                    	<input type="hidden" name="tripNo" value="${trip.tripNo }">
	                        <ul>
	                        	<li>
	                                <label for="type">게시글 타입</label>
	                                <input type="text" id="type" name="ttype" value="${trip.tripType }"><br>
	                            </li>
	                            <li>
	                                <label for="title">여행지이름</label>
	                                <input type="text" id="title" name="tname" value="${trip.tripTitle }"><br>
	                            </li>
	                            <li>
	                                <label for="addr">주소</label>
	                                <input type="text" id="addr" name="taddr" value="${trip.tripAddr }"><br>
	                            </li>
	                            <li>
	                                <label for="oneInfo">한줄소개</label>
	                                <input type="text" id="oneInfo" name="tone" value="${trip.tripSummary }"><br>
	                            </li>
	                            <li>
	                                <label for="thum">썸네일</label>
	                                <input type="text" id="thum" name="tthum" value="${trip.tripNo }">
	                                <button>파일찾기</button><br>                            
	                            </li>
	                            <li>
	                                <label for="file">첨부파일</label>
	                                <input type="text" id="file" name="tfile" value="${trip.tripNo }">
	                                <button>파일찾기</button><br>
	                            </li>
	                            <li>
	                                <label for="infoaddr">상세주소</label>
	                                <input type="text" id="infoaddr" name="tinfoaddr" value="${trip.tripInfoAddr }"><br>
	                            </li>
	                            <li>
	                                <label for="home">홈페이지</label>
	                                <input type="text" id="home" name="thomepage" value="${trip.tripHomePage }"><br>
	                            </li>
	                            <li>
	                                <label for="time">이용시간</label>
	                                <input type="text" id="time" name="ttime" value="${trip.tripTime }"><br>
	                            </li>
	                            <li>
	                                <label for="price">이용금액</label>
	                                <input type="text" id="price" name="tprice" value="${trip.tripPrice }"><br>
	                            </li>
	                            <li>
	                                <label for="summernote">상세정보</label>
	                                <textarea id="summernote" name="tinfo" value="${trip.tripContent }"></textarea><br>
<!-- 	                                <input type="text" id="info" name="tinfo" value=""><br> -->
	                            </li>
	                        </ul>
	                        <button>등록</button>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </main>
	    <footer>
	
	    </footer>
	</body>
</html>