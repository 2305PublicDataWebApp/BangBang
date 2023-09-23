<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<link rel="stylesheet" href="/resources/css/user/find_id.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
	</head>
	<body>
        <!-- main -->
        <main class="mid-container">
            <!-- 상단 텍스트 -->
            <div class="introduce">
                <img src="/resources/images/logo.png" width="50px"><br><br>
                <h2>방방곡곡 발도장에 오신것을 환영합니다.</h2>
                <small>방방곡곡 발도장은 국내 여행 정보를 제공해드리는 지식공유 플랫폼입니다.</small>
            </div>

            <!-- 아이디 찾기 폼 -->
            <div class="find-id-box">
                <h2>아이디 찾기</h2>
                <form action="/find_id.do" method="post">

                    <!-- 이름 입력 -->
                    <div class="user-box">
                        <input type="text" name="userName" required="">
                        <label>이름</label>
                    </div>

                    <!-- 이메일 입력 -->
                    <div class="user-box">
                        <input type="email" name="userEmail" required="">
                        <label>이메일</label>
                    </div>
                    
                    <!-- 확인 버튼 -->
                    <div class="btn-container">
                        <input type="submit" class="btn-3d red" value="확인">
                    </div>
                </form>
            </div>
        </main>
	</body>
</html>