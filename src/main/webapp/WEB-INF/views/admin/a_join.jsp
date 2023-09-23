<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 회원가입</title>
        <link rel="stylesheet" href="/resources/css/admin/a_join.css">
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
            
            <!-- 회원가입 폼 -->
            <div class="join-box">
                <h2>관리자 회원가입</h2>
                <span><prv>*</prv> 필수입력사항</span><br><br>
                <form action="a_join.do" method="post" onsubmit="return validateForm();">

                    <!-- 아이디 입력 -->
                    <div class="user-box">
                        <input type="text" name="adminId" required="">
                        <label>아이디 *</label>
                    </div>

                    <!-- 비밀번호 입력 -->
                    <div class="user-box">
                        <input type="password" name="adminPw" required="">
                        <label>비밀번호 *</label>
                    </div>

                    <!-- 비밀번호 확인 -->
                    <div class="user-box">
                        <input type="password" name="adminPwRe" required="">
                        <span id="passwordMatchError" style="color: red;"></span>
                        <label>비밀번호 확인 *</label>
                    </div>

                    <!-- 이메일 입력 -->
                    <div class="user-box">
                        <div class="user-box-email">
                            <input type="text" name="adminEmail" required="">
                            <label>이메일 *</label>
                        </div>
                        <!-- 이메일 중복확인 -->
                        <div class="btn-email yellow mini">
                            <button>중복확인</button>
                        </div>
                    </div>

                    <!-- 회원가입 버튼 -->
                    <div class="btn-container">
                        <input type="submit" class="btn-3d red" value="회원가입">
                    </div>
                </form>
            </div>
        </main>
		<script>
		    function validateForm() {
		        var adminPw = document.getElementsByName("adminPw")[0].value;
		        var adminPwRe = document.getElementsByName("adminPwRe")[0].value;
		
		        // 비밀번호와 비밀번호 확인이 다를 경우
		        if (adminPw !== adminPwRe) {
		            document.getElementById("passwordMatchError").innerHTML = "비밀번호와 일치하지 않습니다.";
		            return false; // 폼 제출 중단
		        }
		
		        // 다를 경우를 대비하여 초기화
		        document.getElementById("passwordMatchError").innerHTML = "";
		        return true;
		    }
		</script>
	</body>
</html>