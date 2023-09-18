<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>여행지 상세 페이지</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_detail.css">
	</head>
	<body>
	    <header>
	
	    </header>
	    <main>
	        <div id="main-container">
	            <div id="title">
	                    <p style="font-size: 30px; font-weight: bold; margin-bottom: 15px;">여행지 이름</p>
	                    <p style="font-size: 15px; margin-bottom: 28px;">주소</p>
	                    <p style="font-size: 20px;">간단한 한줄 소개</p>
	            </div>
	            <div id="review-btn">
	                <p>조회수
	                    <span>5</span>
	                </p>
	                <div>
	                    <button>수정</button>
	                    <button>삭제</button>
	                </div>
	            </div>
	            <div id="semi-info">
	                <div style="display: inline-block; width: 49%;">
	                    <b style="margin-right: 20px;">주소</b>
	                    <span>공덕역 4번출구</span>
	                </div>
	                <div style="display: inline-block; width: 49%;">
	                    <b>홈페이지</b>
	                    <a href="www.naver.com">www.naver.com</a>
	                </div>
	                <div style="display: inline-block; width: 49%;">
	                    <b>이용시간</b>
	                    <span>-</span>
	                </div>
	                <div style="display: inline-block; width: 49%;">
	                    <b>이용금액</b>
	                    <span>-</span>
	                </div>
	            </div>
	            <div id="summer-note">
	
	            </div>
	            <div id="button">
	                <button>목록으로</button>
	            </div>
	            <div id="reply">
	                <p>댓글
	                    <span>0</span>
	                </p>
	                <form action="#" method="post" style="background-color: rgb(251, 254, 208);">
	                    <div style="background-color: rgb(251, 254, 208); width: 90%; margin: 0 auto;">
	                        <textarea rows="4" cols="100" name="replyContent"></textarea>
	                        <div style="display: flex; justify-content: right;">
	                            <button>등록</button>
	                        </div>
	                    </div>
	                </form>
	                <div>
	                    <div id="reply-list" style="border-bottom: 1px solid black;">
	                        <div style="display: inline-block; width: 30px; height: 30px;">
	                            <img src="" alt="a">
	                        </div>
	                        <span>닉네임</span>
	                        <span>등록날짜</span>
	                        <button>답글</button>
	                        <button>수정</button>
	                        <button>삭제</button>
	                        <p>배고파</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </main>
	    <footer>
	        
	    </footer>
	</body>
</html>