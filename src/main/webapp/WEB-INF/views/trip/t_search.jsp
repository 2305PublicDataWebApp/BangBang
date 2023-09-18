<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>여행지 추천 게시판</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_list.css">
	</head>
	<body>
	    <header>
	    </header>
	    <main>
	        <div class="banner">
	            <img class="banner-img" src="/resources/images/main/dirud.png" class="d-block w-100" alt="벚꽃">
	        </div>
	        <div>
	            <div id="list">
	                <div id="select">
	                    <form action="/trip/search.do" method="get">
	                        <select name="searchCondition">
								<option value="all">전체</option>
								<option value="trip">여행지</option>
								<option value="festival">지역축제</option>
								<option value="content">테마</option>
								<option value="by-member">구성원별</option>
							</select>
	                        <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
							<input type="submit" value="검색">
	                    </form>
	                </div>
	                <div id="list-item">
	                    <!-- forEach문으로 10개 만들기 -->
	                    <div id="item-container">
	                        <div id="img-div">
	                            <img class="banner-img" src="/resources/images/trip/불국사.png" alt="">
	                        </div>
	                        <div id="info-li">
	                            <ul>
	                                <li class="trip-title">어딜까</li>
	                                <li class="trip-addr">경상남도 어딘가</li>
	                                <li class="trip-one">불국사는 아닌데 어딘지 모름</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div id="item-container">
	                        <div id="img-div">
	                            <img class="banner-img" src="/resources/images/trip/불국사.png" alt="">
	                        </div>
	                        <div id="info-li">
	                            <ul>
	                                <li class="trip-title">어딜까</li>
	                                <li class="trip-addr">경상남도 어딘가</li>
	                                <li class="trip-one">불국사는 아닌데 어딘지 모름</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div id="item-container">
	                        <div id="img-div">
	                            <img class="banner-img" src="/resources/images/trip/불국사.png" alt="">
	                        </div>
	                        <div id="info-li">
	                            <ul>
	                                <li class="trip-title">어딜까</li>
	                                <li class="trip-addr">경상남도 어딘가</li>
	                                <li class="trip-one">불국사는 아닌데 어딘지 모름</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div id="item-container">
	                        <div id="img-div">
	                            <img class="banner-img" src="/resources/images/trip/불국사.png" alt="">
	                        </div>
	                        <div id="info-li">
	                            <ul>
	                                <li class="trip-title">어딜까</li>
	                                <li class="trip-addr">경상남도 어딘가</li>
	                                <li class="trip-one">불국사는 아닌데 어딘지 모름</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <!-- 여기까지-------- -->
	                </div>
	                
	                <div style="display: flex; justify-content: right;">
	                    <button style="padding: 3px 8px; margin: 5px 10px;">등록</button>
	                </div>
	                <div style="display: flex; justify-content: center;">
	                    <div id="page">
	                        <a href="#">[이전]</a>
	                        <!-- sts에서 페이징 처리하기 -->
	                        <a href="#">1</a>
	                        <a href="#">2</a>
	                        <a href="#">3</a>
	                        <!-- ------------- -->
	                        <a href="#">[다음]</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </main>
	    <footer>
	    </footer>
	</body>
</html>