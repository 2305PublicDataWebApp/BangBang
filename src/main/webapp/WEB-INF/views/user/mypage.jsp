<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
	    <link rel="stylesheet" href="/resources/css/user/mypage.css">
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
	    <jsp:include page="/WEB-INF/views/include/header/header.jsp"></jsp:include>
	    
	    <!-- main -->
	    <main class="main">
	        <div class="main-container">
	
	            <!-- *****마이페이지 ***** 프로필 -->
	            <div class="profile-box">
	                <div class="profile">
	                    <!-- 프로필 사진 -->
	                    <div class="mypage-profile">
	                        <img class="mypage-profile-img" src="/resources/images/user/profile_1.jpg" alt="프로필">
	                    </div>
	
	                    <!-- 프로필 텍스트 -->
	                    <div class="mypage-profile-area">
	                        <span class="mypage-profile-text">환영합니다!</span><br><br>
	                        <span class="mypage-profile-text">닉네임님</span>
	                        <!-- 프로플 변경 버튼 -->
	                        <button class="profile-img-change">프로필 이미지 설정 ></button>
	                    </div>
	                </div>
	            </div>
	
	            <!-- ***** 마이페이지 ***** 메뉴 -->
	            <div class="menu-mypage">
	
	                <span class="menu-box-text">마이페이지</span>
	                <br><br>
	                <hr>
	                <br><br>
	                <div class="menu-box">
	                    <div class="menu-box-top">
	                        <!-- 개인 정보 조회 -->
	                        <div class="menu-info">
	                            <a href="#"><img class="menu-icon" src="/resources/images/user/info.png" alt="개인 정보 조회"></a><br>
	                            <span id="info-text">개인 정보 조회</span>
	                        </div>
	                        <!-- 개인 정보 수정 -->
	                        <div class="menu-info-modify">
	                            <a href="#"><img class="menu-icon" src="/resources/images/user/modify.png" alt="개인 정보 수정"></a><br>
	                            <span id="modify-text">개인 정보 수정</span>
	                        </div>
	    
	                    </div>
	                    <div class="menu-box-bottom">
	                        <!-- 내가 쓴 게시글 -->
	                        <div class="menu-info-board">
	                            <a href="#"><img class="menu-icon" src="/resources/images/user/board.png" alt="내가 쓸 게시글"></a><br>
	                            <span id="my-board">내가 쓴 게시글</span>
	                        </div>
	                        <!-- 댓글 쓴 게시글 -->
	                        <div class="menu-info-comment">
	                            <a href="#"><img class="menu-icon" src="/resources/images/user/reply.png" alt="댓글 쓴 게시글"></a><br>
	                            <span id="my-reply">댓글 쓴 게시글</span>
	                        </div>
	                        <!-- 회원 탈퇴 -->
	                        <div class="menu-info-remove">
	                            <a href="#"><img class="menu-icon" src="/resources/images/user/remove.png" alt="탈퇴"></a><br>
	                            <span id="info-remove">회원 탈퇴</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	        </div>
	    </main>
	
	    <!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer/footer.jsp"></jsp:include>
	
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