<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	    
	    <!-- main -->
	    <main class="main">
	        <div class="main-container">
	
	            <!-- *****마이페이지 ***** 프로필 -->
	            <jsp:include page="/WEB-INF/views/include/profile.jsp"></jsp:include>
	
	            <div class="menu-mypage">
	
	                <span class="menu-box-text">마이페이지</span>
	                <br><br>
					<!-- ***** 마이페이지 ***** 메뉴 -->
					<jsp:include page="/WEB-INF/views/include/mypage_menu.jsp"></jsp:include>
	            </div>
	        </div>
	    </main>
	
	    <!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	
	    <!-- js -->
	    <!-- 프로필 이미지 변경 버튼 -->
		<script>
// 		    document.getElementById('profile-image').addEventListener('change', function(event) {
// 		        const fileInput = event.target;
// 		        const selectedFile = fileInput.files[0];
		
// 		        if (selectedFile) {
// 		            // 선택한 파일을 업로드하거나 다른 처리를 수행할 수 있습니다.
// 		            // 이곳에서 선택한 파일(selectedFile)을 서버로 업로드하는 등의 작업을 수행합니다.
// 		            // 예를 들어, Ajax 요청을 사용하여 서버에 파일을 업로드할 수 있습니다.
// 		        }
// 		    });
		</script>
	    
	    <script>
	    <!-- 헤더 랜덤 이벤트 효과 -->
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
	        <!-- 프로필 이미지 미리보기 -->
	        // 파일 선택 시 이미지 미리 보기 함수
// 	        document.getElementById('profile-image-input').addEventListener('change', function (event) {
// 	            var profileImg = document.getElementById('profile-img');
// 	            var file = event.target.files[0];
// 	            var reader = new FileReader();

// 	            reader.onload = function (e) {
// 	                profileImg.src = e.target.result;
// 	            };

// 	            if (file) {
// 	                reader.readAsDataURL(file);
// 	            } else {
// 	                profileImg.src = '/resources/images/logo.png'; // 기본 이미지 설정
// 	            }
// 	        });
	    </script>
	</body>
</html>