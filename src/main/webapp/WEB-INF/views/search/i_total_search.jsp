<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>검색 게시판</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_search.css">
	</head>
	<body>
	    <header>
	    </header>
	    <main>
	        <!-- <div class="banner">
	            <img class="banner-img" src="../goggog/resources/images/dirud.png" class="d-block w-100" alt="벚꽃">
	        </div> -->
	        <div id="main-container">
	            <div id="list">
	                <div id="select">
	                    <span>전체</span>
	                    <span>여행지</span>
	                    <span>여행후기</span>
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
	                
	                <!-- <div style="display: flex; justify-content: right;">
	                    <button style="padding: 3px 8px; margin: 5px 10px;">등록</button>
	                </div> -->
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