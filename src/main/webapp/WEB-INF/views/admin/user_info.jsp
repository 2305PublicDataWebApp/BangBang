<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원상세조회</title>
    	<link rel="stylesheet" href="/resources/css/banner/bannerList.css">
    	<link rel="stylesheet" href="/resources/css/user/header.css">
    	<link rel="stylesheet" href="/resources/css/user/footer.css">
    	<link rel="stylesheet" href="/resources/css/reset.css">
    	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    	<link rel="stylesheet" href="/resources/css/admin/a_info.css">
	    <link rel="stylesheet" href="/resources/css/reset.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Bacasime+Antique&family=Rajdhani&family=Roboto+Mono&family=Roboto:wght@300&family=Tilt+Prism&display=swap" rel="stylesheet">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

		<div class="container">
			<div class="center">
	            <div class="bannertitle">
					<span>회원정보조회</span>
				</div>
				<hr>
				
				<div class="infoDiv">
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
		                    
							<!--가입일 -->
		                    <div class="info-detail">
		                        <span class="info-reg-date">가입일</span>
		                        <span class="info-reg-date-detail">${ user.userRegDate }</span>
		                    </div>
		                    
							<!--회원여부 -->
		                    <div class="info-detail">
		                        <span class="info-user-yn">회원여부</span>
		                        <span class="info-user-yn-detail">${ user.userYn }</span>
		                    </div> 
	               	</div>				
				</div>

               	
               	<div>
					<input type="hidden" name="userId" value="${ userId }">
	                <div class="a_user_btn" style=" float: right;" >
<!-- 		                <form action="/admin/uRemove.do" method="get">   -->
		                
		                   		<c:url var="uListUrl" value="/admin/list.do"></c:url>  	
				                <button class="uButton"  onclick="showUserList('${uListUrl}');" style="font-family: 'TheJamsil5Bold'; background-color: #FFFACD; color: black; border-color: black;">목록</button>	
			                	
			                	<c:url var="uDelUrl" value="/admin/uRemove.do">
									<c:param name="userId" value="${user.userId }"></c:param>
								</c:url>        
								<button class="uButton" type="submit" onclick="deleteUser('${uDelUrl}');" style="font-family: 'TheJamsil5Bold'; background-color: #FFFACD; color: black; border-color: black;">탈퇴</button>
							
								<c:url var="uModifyUrl" value="/admin/uModify.do">
									<c:param name="userId" value="${user.userId }"></c:param>
								</c:url> 
								<button class="uButton"  onclick="uModify('${uModifyUrl}');" style="font-family: 'TheJamsil5Bold'; background-color: #FFFACD; color: black; border-color: black;">수정</button>
		<%-- 	                <a href="/admin/uModify.do?userId=${ user.userId }" style="width=30px" >수정</a> --%>
		<%-- 	                <a type="submit" href="/admin/uRemove.do?userId=${ user.userId }" style="margin-left: 10px;">탈퇴</a>    --%>
		<!-- 	                <a href="/admin/list.do" style="margin-left: 10px;">목록</a>        -->
<!-- 		                  </form>  -->
	                </div>
				</div>
				
			</div>
		</div>
		
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
	        
	        
	        function uModify(uModifyUrl){
				location.href= uModifyUrl;
			}
	        function deleteUser(uDelUrl){
				location.href= uDelUrl;
			}
	        function showUserList(uListUrl){
				location.href= uListUrl;
			}
	    </script>
	</body>
</html>