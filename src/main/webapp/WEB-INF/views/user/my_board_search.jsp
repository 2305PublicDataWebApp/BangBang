<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내가 쓴 게시글</title>
	    <link rel="stylesheet" href="/resources/css/user/my_board.css">
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
	
	                <!-- 내가 쓴 게시글 -->
	                <span class="menu-box-text">내가 쓴 게시글</span>
	                <br><br>
	                <hr>
	                <br><br>
	                <table>
	                    <colgroup>
	                        <col style="width: 10%">
	                        <col style="width: 15%">
	                        <col style="width: 55%">
	                        <col style="width: 20%">
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <th>
	                                No
	                            </th>
	                            <th>
	                                카테고리
	                            </th>
	                            <th>
	                                제목
	                            </th>
	                            <th>
	                                작성일
	                            </th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td>d</td>
	                            <td>d</td>
	                            <td>d</td>
	                            <td>d</td>
	                        </tr>
	                    </tbody>
	                    <tfoot>
	                        <tr>
	                            <td>
	                                <select name="" id="">
	                                    <option>전체</option>
	                                    <option>제목</option>
	                                    <option>내용</option>
	                                </select>
	                            </td>
	                            <td colspan="3">
	                                <input type="text" name="searchBaord">
	                                <button>검색</button>
	                            </td>
	                        </tr>
	                    </tfoot>
	                </table>
	
	                <!-- 페이징 -->
	                <br>
	                <div class="pageing">
	                    [이전] 1 2 3 4 5 [다음]
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
	        
// 	        let profile = document.querySelector('.profile');
	
// 	        // 스크롤 이벤트 리스너
// 	        window.addEventListener('scroll', () => {
// 	            // 스크롤 위치
// 	            let scrollY = window.scrollY;
	
// 	            // 프로필을 고정할 위치 (예: 500px)
// 	            let fixedPosition = 580;
	
// 	            // 프로필이 고정될 때 상단으로부터의 거리 (예: 20px)
// 	            let fixedTop = 50;
	
// 	            // 스크롤이 특정 위치 이상으로 내려갔을 때 .profile에 position: fixed; 적용
// 	            if (scrollY >= fixedPosition) {
// 	                profile.style.position = 'fixed';
// 	                profile.style.top = `${fixedTop}px`; // 조금 아래로 내리려면 top 속성 사용
// 	            } else {
// 	                profile.style.position = 'static'; // 스크롤 위치가 작을 때는 기본 위치로 돌려놓음
// 	            }
// 	        });
	        
	        <!-- 프로필 이미지 미리보기 -->
	     	// 파일 선택 필드와 이미지 미리보기 영역에 대한 참조를 가져옵니다.
	        var imageInput = document.getElementById('profile-image');
	        var imagePreview = document.getElementById('image-preview');

	        // 파일 선택 필드의 change 이벤트를 감지하여 미리보기 업데이트
	        imageInput.addEventListener('change', function () {
	            var file = imageInput.files[0]; // 선택한 파일

	            if (file) {
	                var reader = new FileReader(); // FileReader 객체 생성

	                reader.onload = function (e) {
	                    // 파일 읽기가 완료되면 미리보기 업데이트
	                    var img = document.createElement('img'); // 이미지 엘리먼트 생성
	                    img.src = e.target.result; // 읽은 파일 데이터를 이미지 소스로 설정
	                    img.style.maxWidth = '100%'; // 이미지가 너무 크면 화면에 맞게 조절
	                    imagePreview.innerHTML = ''; // 이미지 미리보기 영역 초기화
	                    imagePreview.appendChild(img); // 이미지를 미리보기 영역에 추가
	                };

	                reader.readAsDataURL(file); // 파일을 읽어 데이터 URL로 변환하여 이미지 소스로 설정
	            } else {
	                // 파일이 선택되지 않았을 때 미리보기 영역 초기화
	                imagePreview.innerHTML = '';
	            }
	            profileForm.submit();
	        });
	    </script>
	</body>
</html>