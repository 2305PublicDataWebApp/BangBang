<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내가 쓴 게시글</title>
	    <link rel="stylesheet" href="/resources/css/user/my_board_search.css">
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
	    <header>
	        <nav>
	            <!-- 로고 -->
	            <div class="logo">
	                방방곡곡 발도장
	                <img class="logo-img" width="35px" src="/resources/images/user/logo.png" alt="로고">
	            </div>
	
	            <i class="fa fa-bars"></i>
	
	            <!-- 네비게이션 -->
	            <ul class="navBar">
	                <li class="tab">여행지</li>
	                <li class="tab">매거진</li>
	                <li class="tab">공지사항</li>
	                <a href="#"><img class="login-img" src="/resources/images/user/login.png" alt="로그인"></a>
	            </ul>
	
	        </nav>
	        <!-- 헤더 text -->
	        <div class="header-content">
	            <div class="content">
	
	                <!-- 헤더 text -->
	                <h1>대한민국 <span>방방곡곡</span> <br> 어디든지!</h1>
	                <p>
	                    방방곡곡 발도장은 국내 여행 정보를 제공해드리는 <br> 지식공유 플랫폼입니다.
	                </p>
	
	                <!-- 검색창 -->
	                <div class="search">
	                    <i class="fa fa-search"></i>
	                    <input value="여행지 검색">
	                    <button>search</button>
	                </div>
	
	            </div>
	            <!----content--->
	            <div></div>
	            <!-- 헤더 이미지 -->
	            <!-- <img style="width: 1200px" class="header-img" src="./resources/images/img20.png"> -->
	            <!-- <img style="width: 900px;" src="./resources/images/img3.png"> -->
	            
	        </div>
	
	    </header>
	    
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
	                <br><br><br><br><br><br>
	
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
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                        </tr>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                        </tr>
	                        </tr>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                        </tr>
	                        </tr>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                        </tr>
	                        </tr>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                        </tr>
	                        </tr>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                        </tr>
	                        </tr>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                        </tr>
	                        </tr>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                        </tr>
	                        </tr>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                        </tr>
	                        </tr>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
	                            <td>
	                                d
	                            </td>
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
	    <footer class="footer">
	        <!-- 로고 -->
	        <div class="footer-title">
	            <span class="footer-text">방방곡곡 발도장</span>
	            <img class="footer-logo" src="/resources/images/user/logo.png" alt="로고">
	        </div>
	        <!-- 정보 -->
	        <div class="footer-content">
	            <div class="footer-content-detail">
	                <span class="detail-title">
	                    회사명
	                </span>
	                <span class="detail-content">
	                    방방곡곡 발도장
	                </span>
	            </div>
	            <div class="footer-content-detail">
	                <span class="detail-title">
	                    이메일
	                </span>
	                <span class="detail-content">
	                    bangbang@goggog.com
	                </span>
	            </div>
	            <div class="footer-content-detail">
	                <span class="detail-title">
	                    대표자
	                </span>
	                <span class="detail-content">
	                    김대표
	                </span>
	            </div>
	            <span class="footer-content-detail">
	                <span class="detail-title-service">
	                    고객센터
	                </span>
	                <span class="detail-content">
	                    0503-4444-2222
	                    <br>
	                    <small>운영시간 : 9:00 - 16:00</small>
	                </span>
	            </span>
	        </div>
	    </footer>
	
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