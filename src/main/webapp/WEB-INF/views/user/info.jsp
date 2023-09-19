<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <link rel="stylesheet" href="/resources/css/user/info.css">
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
	
	            <!-- ***** 마이페이지 ***** 메뉴 -->
	            <div class="menu-mypage">
	
	                <span class="menu-box-text">마이페이지</span>
	                <br><br>
	                <hr>
	                
					<!-- ***** 마이페이지 ***** 메뉴 -->
					<jsp:include page="/WEB-INF/views/include/mypage_menu.jsp"></jsp:include>
					
					<!-- 개인정보 조회 -->
	                <span class="menu-box-text">개인 정보 조회</span>
	                <br><br>
	                <hr>
	                
	                <div class="info">
					<input type="hidden" name="userId" value="userId">
	                    <!-- 아이디 -->
	                    <div class="info-detail">
	                        <span class="info-id">아이디</span>
	                        <span class="info-id-detail">${ user.userId }</span>
	                    </div>
	
	                    <!-- 비밀번호 -->
	                    <div class="info-detail">
	                        <span class="info-pw">비밀번호</span>
	                        <span class="info-pw-detail">${ user.userPw }</span>
	                    </div>
	
	                    <!-- 이름 -->
	                    <div class="info-detail">
	                        <span class="info-name">이름</span>
	                        <span class="info-name-detail">${ user.userName }</span>
	                    </div>
	
	                    <!-- 닉네임 -->
	                    <div class="info-detail">
	                        <span class="info-nickname">닉네임</span>
	                        <span class="info-nickname-detail">${ user.userNickname }</span>
	                    </div>
	
	                    <!-- 이메일 -->
	                    <div class="info-detail">
	                        <span class="info-email">이메일</span>
	                        <span class="info-email-detail">${ user.userEmail }</span>
	                        
	                    </div>
	
	                    <!-- 휴대폰 -->
	                    <div class="info-detail">
	                        <span class="info-phone">휴대폰</span>
	                        <span class="info-phone-detail">${ user.userPhone }</span>
	                    </div>
	
	                    <!-- 생년월일 -->
	                    <div class="info-detail">
	                        <span class="info-birth">생년월일</span>
	                        <span class="info-birth-detail">${ user.userBirth }</span>
	                    </div>
	                </div>
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
	        
	        let profile = document.querySelector('.profile');
	
	        // 스크롤 이벤트 리스너
	        window.addEventListener('scroll', () => {
	            // 스크롤 위치
	            let scrollY = window.scrollY;
	
	            // 프로필을 고정할 위치
	            let fixedPosition = 500;
	
	            // 프로필이 고정될 때 상단으로부터의 거리
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