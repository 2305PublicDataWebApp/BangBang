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
	                <hr id="menu-hr">
	                
					<!-- ***** 마이페이지 ***** 메뉴 -->
					<jsp:include page="/WEB-INF/views/include/mypage_menu.jsp"></jsp:include>
	
	                <!-- 내가 쓴 게시글 -->
	                <div class="my-board">
		                <span class="menu-box-text">내 게시글 조회</span>
		                <br><br>
		                <hr id="menu-board-hr">
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
		                                작성날짜
		                            </th>
		                        </tr>
		                    </thead>
		                    <tbody>
								<!-- list 데이터는 items에 넣었고, var에서 설정한 변수로 list 데이터에서 -->
								<!-- 꺼낸 값을 사용하고 i의 값은 varStatus로 사용 -->
								<c:forEach var="board" items="${ bList }" varStatus="i">
								</c:forEach>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                        <tr>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                            <td>d</td>
		                        </tr>
		                    </tbody>
		                    <tfoot class="search-content">
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
		                <div class="page">
		                    [이전] 1 2 3 4 5 [다음]
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
	        
	    </script>
	</body>
</html>