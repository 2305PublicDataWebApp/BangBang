<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
    <nav>
        <!-- 로고 -->
        <div class="logo">
        	<a class="logo-text" href="/index.jsp">
	            <span class="logo-text">방방곡곡 발도장</span> <img id="header-logo" src="/resources/images/logo.png" alt="로고">
            </a>
        </div>
        <i class="fa fa-bars"></i>
        <!-- 네비게이션 -->
        <ul class="navBar">
            <a class="logo-text" href="/trip/t_list.do"><li class="tab">여행지</li></a>
            <a class="logo-text" href="/review/r_list.do"><li class="tab">여행후기</li></a>
            <a class="logo-text" href="/notice/n_list.do"><li class="tab">공지사항</li></a>
            <!-- 로그인 세션 없을 경우 -->
            <c:if test="${ userId eq null && adminId eq null }">
	            <a href="/user/login.do">
	            	<img class="login-img" src="/resources/images/user/login.png" alt="로그인">
	            </a>
            </c:if>
            <!-- 로그인 세션 저장되어 있을 경우 -->
            <c:if test="${ userId ne null && adminId eq null}">
	            <a href="/user/mypage.do?userId=${ userId }">
	            	<img class="login-img" src="/resources/images/user/mypage.png" alt="마이페이지">
	            </a>
            </c:if>
            <!-- 어드민 로그인 -->
            <c:if test="${ adminId ne null && userId eq null}">
            	<a class="logo-text" href="/banner/bList.do"><li class="tab">배너관리</li></a>
	            <a class="logo-text" href="/admin/list.do"><li class="tab">회원관리</li></a>
<!-- 	            <a class="logo-text" href="/admin/a_logout.do"><li class="tab-logout">로그아웃</li></a> -->
	            <a href="/admin/a_logout.do">
	            	<img class="tab-logout" src="/resources/images/admin/adminLogout.png" alt="로그아웃">
	            </a>
            </c:if>
           


        </ul>
    </nav>
            
    <!-- 헤더 text -->
    <div class="header-content">
        <div class="content">

            <!-- 헤더 text -->
            <h1 style="font-family: 'TheJamsil5Bold';">대한민국 <span>방방곡곡</span> <br> 어디든지!</h1>
            <p style="font-family: 'SUITE-Regular'; font-size: 20px;">
                방방곡곡 발도장은 국내 여행 정보를 제공해드리는 <br> 지식공유 플랫폼입니다.
            </p>

            <!-- 검색창 -->
            <div class="search">
                <i class="fa fa-search"></i>
                <input style="font-family: 'SUITE-Regular'; font-size: 15px;" value="여행지 검색">
                <button>search</button>
            </div>

        </div>
        <!----content--->
        <div></div>
        <!-- 헤더 이미지 -->
        <!-- <img style="width: 1200px" class="header-img" src="./resources/images/img20.png"> -->
        <!-- <img style="width: 900px;" src="./resources/images/img3.png"> -->
        
    </div>

</header>