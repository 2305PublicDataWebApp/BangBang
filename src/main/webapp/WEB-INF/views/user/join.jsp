<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
        <link rel="stylesheet" href="/resources/css/user/join.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        
        <!-- jquery 라이브러리 -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
            
            <div class="join-box">
                <h2>회원가입</h2>
                <span><prv>*</prv> 필수입력사항</span><br><br>

                <!-- 회원가입 폼 -->
                <form action="/user/join.do" method="post">
                    
                        <!-- 아이디 입력 -->
                    <div class="user-box">
                        <div class="user-box-id">
                            <input type="text" name="userId" required="">
                            <label>아이디 *</label>
                            
                            <!-- id ajax 중복체크 -->
                            <span class="id_ok">사용 가능한 아이디입니다.</span>
                            <span class="id_already">사용 불가능한 아이디입니다.</span>
                        </div>
                        <!-- 아이디 중복확인 -->
                        <div class="btn-id yellow mini">
                            <button>중복확인</button>
                        </div>
                    </div>

                    <!-- 비밀번호 입력 -->
                    <div class="user-box">
                        <input type="password" name="userPw" required="">
                        <label>비밀번호 *</label>
                    </div>

                    <!-- 비밀번호 확인 -->
                    <div class="user-box">
                        <input type="password" name="userPwRe" required="">
                        <label>비밀번호 확인 *</label>
                    </div>

                    <!-- 이름 입력 -->
                    <div class="user-box">
                        <input type="text" name="userName" required="">
                        <label>이름 *</label>
                    </div>

                    <!-- 닉네임 입력 -->
                    <div class="user-box">
                        <div class="user-box-nickname">
                            <input type="text" name="userNickname" required="">
                            <label>닉네임 *</label>
                        </div>
                        <!-- 닉네임 중복확인 -->
                        <div class="btn-nickname yellow mini">
                            <button>중복확인</button>
                        </div>
                    </div>

                    <!-- 이메일 입력 -->
                    <div class="user-box">
                        <div class="user-box-email">
                            <input type="text" name="userEmail" required="">
                            <label>이메일 *</label>
                        </div>
                        <!-- 이메일 중복확인 -->
                        <div class="btn-email yellow mini">
                            <button>중복확인</button>
                        </div>
                    </div>

                    <!-- 휴대폰 입력 -->
                    <div class="user-box">
                        <input type="text" name="userPhone" required="">
                        <label>휴대폰 *</label>
                    </div>

                    <!-- 생년월일 선택 -->
                    <div class="user-box">
                        <input type="date" name="userBirth">
                        <label>생년월일</label>
                    </div>

                    <!-- 회원가입 버튼 -->
                    <div class="btn-container">
                        <input type="submit" class="btn-3d red" value="회원가입">
                    </div>
                </form>
            </div>
        </main>
        
        <!-- js -->
        <script>
        	
        </script>
	</body>
</html>