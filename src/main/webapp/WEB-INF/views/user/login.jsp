<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인</title>
		<link rel="stylesheet" href="/resources/css/user/login.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
		
    </head>
	<body>
        <!-- main -->
        <main class="mid-container">
            <!-- 상단 텍스트 -->
            <div class="introduce">
                <img src="/resources/images/user/logo.png" width="50px"><br><br>
                <h2>방방곡곡 발도장에 오신것을 환영합니다.</h2>
                <small>방방곡곡 발도장은 국내 여행 정보를 제공해드리는 지식공유 플랫폼입니다.</small>
            </div>
            <!-- 로그인 폼 -->
            <div class="login-box">
                <h2>로그인</h2>
                <form action="/user/login.do" method="post">

                    <!-- 아이디 입력 -->
                    <div class="user-box">
                        <input type="text" name="userId" required="">
                        <label>아이디</label>
                    </div>

                    <!-- 비밀번호 입력 -->
                    <div class="user-box">
                        <input type="password" name="userPw" required="">
                        <label>비밀번호</label>
                    </div>
                    
                    <!-- 로그인 버튼 -->
                    <div class="btn-container">
                        <input type="submit" class="btn-3d red" value="로그인">
                    </div>
                </form>
                <!-- 회원가입 링크 -->
                <div class="a-container">
                    <a href="#" class="a-3d green">회원가입</a>
                </div>
                <br>

                <div class="admin-login">
                    <!-- 관리자 로그인 -->
                    <a href="#" class="admin-login-ink">관리자 로그인</a><br>
                    <!-- 아이디 / 비밀번호 찾기 -->
                    <a href="#" class="find-ink">아이디 찾기</a> | <a href="#" class="find-ink">비밀번호 찾기</a>
                </div>
            </div>
        </main>
    </body>
</html>