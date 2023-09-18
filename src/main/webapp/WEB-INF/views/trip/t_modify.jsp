<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>게시글 수정 폼</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_modify.css">
	</head>
	<body>
	    <header>
	
	    </header>
	    <main>
	        <div id="main-container">
	            <div id="form">
	                <div id="title">
	                    <div style="margin-bottom: 20px;">
	                        <span>게시글 등록</span>
	                        <img src="/resources/images/main/logo.png" alt="발도장로고"> 
	                    </div>
	                </div>
	                <div style="margin: 40px auto; max-width: 700px;">
	                    <form action="" method="get">
	                        <ul>
	                            <li>
	                                <label for="">여행지이름</label>
	                                <input type="text" id="" name="t-name" value=""><br>
	                            </li>
	                            <li>
	                                <label for="">주소</label>
	                                <input type="text" id="" name="t-addr" value=""><br>
	                            </li>
	                            <li>
	                                <label for="">한줄소개</label>
	                                <input type="text" id="" name="t-one" value=""><br>
	                            </li>
	                            <li>
	                                <label for="">썸네일</label>
	                                <input type="text" id="" name="t-thum" value="">
	                                <button>파일찾기</button><br>                            </li>
	                            <li>
	                                <label for="">첨부파일</label>
	                                <input type="text" id="" name="t-file" value="">
	                                <button>파일찾기</button><br>
	                            </li>
	                            <li>
	                                <label for="">상세정보</label>
	                                <input type="text" id="" name="t-info" value=""><br>
	                            </li>
	                            <li>
	                                <label for="">상세주소</label>
	                                <input type="text" id="" name="t-info-addr" value=""><br>
	                            </li>
	                            <li>
	                                <label for="">홈페이지</label>
	                                <input type="text" id="" name="t-homepage" value=""><br>
	                            </li>
	                            <li>
	                                <label for="">이용시간</label>
	                                <input type="text" id="" name="t-time" value=""><br>
	                            </li>
	                            <li>
	                                <label for="">이용금액</label>
	                                <input type="text" id="" name="t-price" value=""><br>
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