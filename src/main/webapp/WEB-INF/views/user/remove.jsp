<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 탈퇴</title>
        <link rel="stylesheet" href="/resources/css/user/remove.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
    </head>
	<body>
	<!-- main -->
        <main class="mid-container">
        	<form action="/user/remove.do" method="post">
        		<input type="hidden" name="userId" value="${ userId }">
        		
	            <!-- 상단 텍스트 -->
	            <div class="introduce">
	                <img src="/resources/images/logo.png" width="50px"><br><br>
	                <h2>회원 탈퇴 시 아래와 같이 처리됩니다.</h2>
	            </div>
	
	            <!-- 회원 탈퇴 안내 -->
	            <div class="remove-box">
	                <span class="remove-anno">
	                    회원 탈퇴일로부터 계정과 닉네임을 포함한 계정 정보는 <br>
	                    즉시 삭제되며 더 이상 복구할 수 없게 됩니다.<br>
	                    <br>
	                    작성된 게시물은 삭제되지 않으며, 방방곡곡 발도장으로<br>
	                    소유권이 귀속됩니다. 게시물 삭제가 필요한 경우에는<br>
	                    사이트 하단 안내되어 있는 고객센터로 문의해 주시기 바랍니다.
	                </span>
	                <br><br>
	
	                <!-- 로그인 버튼 -->
	                <div class="btn-container">
	                    <input type="submit" class="btn-3d red" value="예, 탈퇴하겠습니다.">
	                </div>
	
	                <!-- 탈퇴 취소 -->
	                <div class="a-container">
	                    <a href="/user/mypage.do?userId=${ userId }" class="a-3d green">취소</a>
	                </div>
	                <br>
	            </div>
            </form>
        </main>
	</body>
</html>