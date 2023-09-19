<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>개인 정보 수정</title>
	    <link rel="stylesheet" href="/resources/css/user/modify.css">
	    <link rel="stylesheet" href="/resources/css/reset.css">
	    <link rel="stylesheet" href="/resources/css/user/header.css">
	    <link rel="stylesheet" href="/resources/css/user/footer.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Bacasime+Antique&family=Rajdhani&family=Roboto+Mono&family=Roboto:wght@300&family=Tilt+Prism&display=swap" rel="stylesheet">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	</head>
	<body>
		<!-- header -->
	    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	    
	    <!-- main -->
	    <main class="main">
	        <div class="main-container">
	
	            <!-- *****마이페이지 ***** 프로필 -->
	            <jsp:include page="/WEB-INF/views/include/profile.jsp"></jsp:include>
	
	            
	            <div class="menu-mypage">
	
	                <span class="menu-box-text">마이페이지</span>
	                <br><br>
	                <hr>
	                
					<!-- ***** 마이페이지 ***** 메뉴 -->
					<jsp:include page="/WEB-INF/views/include/mypage_menu.jsp"></jsp:include>
	                
	                <!-- 개인정보 수정 -->
	                <span class="menu-box-text">개인 정보 수정</span>
	                <br><br>
	                <hr>
	                
	                <form action="user/modify.do" method="post">
	                    <div class="info">

							<!-- 아이디 -->
	                        <ul class="info-detail">
	                        	<li>
	                        	<label for="userId" class="info-id">아이디 </label>
	                        	<input type="text" name="userId" id="userId" class="info-id-detail" value="${ user.userId }" readonly>
	                        	</li>
	                        </ul>
	
	                        <!-- 비밀번호 -->
	                        <ul class="info-detail">
		                        <li>
		                            <label for="userPw" class="info-pw">비밀번호</label>
		                            <input type="password" name="userPw" class="info-pw-detail" value="${ user.userPw }">
		                        </li>
	                        </ul>

	                        <!-- 비밀번호 확인 -->
	                        <ul class="info-detail">
	                        	<li>
	                            	<label for="userPwRe" class="info-pwRe">비밀번호 확인</label>
	                            	<input type="password" name="userPwRe" id="userPwRe" class="info-pwRe-detail" value="${ user.userPwRe }">
	                        	</li>
	                        </ul>
	
	                        <!-- 이름 -->
	                        <ul class="info-detail">
	                        	<li>
	                            	<label for="userName" class="info-name">이름</label>
	                            	<input type="text" name="userName" id="userName" class="info-name-detail" value="${ user.userName }" readonly>
	                        	</li>
	                        </ul>

	                        <!-- 닉네임 -->
	                        <ul class="info-detail">
		                        <li>
		                        	<label for="userNickname" class="info-nickname">닉네임</label>
		                            <input type="text" name="userNickname" id="userNickname" class="info-nickname-detail" value="${ user.userNickname }">
		                            
		                            <!-- 닉네임 중복확인 -->
                                	<button class="btn-nickname yellow mini">중복확인</button>
		                        </li>
	                        </ul>

	
	                        <!-- 이메일 -->
	                        <ul class="info-detail">
		                        <li>
		                            <label for="userEmail" class="info-email">이메일</label>
		                            <input type="text" name="userEmail" id="userEmail" class="info-email-detail" value="${ user.userEmail }">
	                            	
	                            	<!-- 이메일 중복확인 -->
	                                <button class="btn-email yellow mini">중복확인</button>
		                        </li>
	                        </ul>
	                            
	
	                        <!-- 휴대폰 -->
	                        <ul class="info-detail">
		                        <li>
		                            <label for="userPhone" class="info-phone">휴대폰</label>
		                            <input type="text" name="userPhone" id="userPhone" class="info-phone-detail" value="${ user.userPhone }" readonly>
		                        </li>
	                        </ul>
	
	                        <!-- 생년월일 -->
	                        <ul class="info-detail">
		                        <li>
		                            <label for="userBirth" class="info-birth">생년월일</label>
		                            <input type="date" name="userBirth" class="info-birth-detail" value="${ user.userBirth }" readonly>
		                        </li>
	                        </ul>
	
	                        <!-- 수정 버튼 -->
	                        <br>
	                        <div class="btn-container">
	                        	<input type="submit" class="btn-3d red" value="확인">
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </main>
	    
	   	<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	
	    <!-- js -->
	    <!-- 헤더 랜덤 이벤트 효과 -->
	    <script>
	        let header = document.querySelector('header');
	        let bars = document.querySelector('.fa-bars');
	        let navBar = document.querySelector('.navBar');
	
	
	        function circle() {
	
	            let div = document.createElement('div');
	            div.classList.add('circle');
	
	            let left = Math.floor(Math.random() * 100);
	            let top = Math.floor(Math.random() * 100);
	
	            div.style.left = left + '%';
	            div.style.top = top + '%';
	
	            header.appendChild(div);
	
	
	            setTimeout(function () {
	                header.removeChild(div)
	            }, 3500)
	
	
	        }
	
	
	        setInterval(function () {
	            circle()
	        }, 700);
	
	
	        let bolean = true;
	        bars.addEventListener("click", () => {
	            if (bolean == true) {
	                navBar.style.height = "40vmin";
	                bars.classList.replace("fa-bars", "fa-remove");
	                bolean = false;
	            } else {
	                navBar.style.height = "0%";
	                bars.classList.replace("fa-remove", "fa-bars");
	                bolean = true;
	            }
	        })
	        
	    </script>
	    <script>
	        let profile = document.querySelector('.profile');
	
	        // 스크롤 이벤트 리스너
	        window.addEventListener('scroll', () => {
	            // 스크롤 위치
	            let scrollY = window.scrollY;
	
	            // 프로필을 고정할 위치 (예: 500px)
	            let fixedPosition = 580;
	
	            // 프로필이 고정될 때 상단으로부터의 거리 (예: 20px)
	            let fixedTop = 50;
	
	            // 스크롤이 특정 위치 이상으로 내려갔을 때 .profile에 position: fixed; 적용
	            if (scrollY >= fixedPosition) {
	                profile.style.position = 'fixed';
	                profile.style.top = `${fixedTop}px`; // 조금 아래로 내리려면 top 속성 사용
	            } else {
	                profile.style.position = 'static'; // 스크롤 위치가 작을 때는 기본 위치로 돌려놓음
	            }
	        });
	    </script>
	</body>
</html>