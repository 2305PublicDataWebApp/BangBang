<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항리스트</title>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    	<link rel="stylesheet" href="../resources/css/n_list.css">
    	<link rel="stylesheet" href="/resources/css/user/footer.css">
	</head>
	<body>
		<header>header</header>

		<div class="container">
			<div class="banner">배너</div>
			<div class="main">
				<h2>공지사항</h2>
				<hr>
				<div class="noticelist">
					<c:forEach var="notice" items="${nList }" varStatus="i">
						<div class="que">
						<span>
							<label>제목</label>
							<span>${notice.noticeTitle }</span>
						</span>
						</div>
						<div class="anw">
							<label>내용</label>
							<span>${notice.noticeContent }</span>
						</div>
					</c:forEach>
				</div>
				<div class="bottom">
					<a href="#" id="load">MORE</a>
					<div>
						<button type="button" onclick="showRegisterNForm()">글쓰기</button>
					</div>
				</div>
			</div>
		</div>
		
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer/footer.jsp"></jsp:include>
		</footer>
	    <script>
        	$(".que").click(function() {
            	$(this).next(".anw").stop().slideToggle(300);
            	$(this).toggleClass('on').siblings().removeClass('on');
            	$(this).next(".anw").siblings(".anw").slideUp(300);
        	});
        </script>
        <script>
        	$('.list > div.que').hide();
     		$(".list > div.que").slice(0, 5).css("display", "block"); 
    		$("#load").click(function(e){
        		e.preventDefault();
        		$(".list >div.que:hidden").slice(0, 5).fadeIn(200).css('display', 'block'); // 클릭시 more 갯수 지저정
        		if($(".list >div.que:hidden").length == 0){ // 컨텐츠 남아있는지 확인
            		$('#load').fadeOut(100); // 컨텐츠 없을 시 버튼 사라짐
        		}
    		});
        </script>
        <script>
        	function showRegisterNForm(){
        		location.href="/notice/n_insert.do";
        	}
        </script>
	</body>
</html>