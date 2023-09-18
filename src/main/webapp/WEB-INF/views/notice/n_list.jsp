<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="../resources/css/noticeList.css">
</head>
<body>
	<div class="header">header</div>


	<div class="banner">
		<!--배너사진-->
	</div>


	<div class="container">
		<!-- 전체배경을 먹이기 위한 컨테이너-->
		<div class="top">
			<!--메뉴+검색-->
			<div class="menu">
				<h2>공지사항</h2>
			</div>
			<hr>
		</div>


		<div class="mid">
			<!--리스트+등록버튼-->
			<div class="noticelist">
				<div class="que">
					<span>첫번째 공지사항</span>
					<div class="arrow-wrap">
						<span class="arrow-top">↑</span> <span class="arrow-bottom">↓</span>
					</div>

				</div>
				<div class="anw">
					<span>햄버거 먹어요.</span>
				</div>
				<div class="que">
					<span>두번째 공지사항</span>
				</div>
				<div class="anw">
					<span>피자 먹어요.</span>
				</div>
				<div class="que">
					<span>세번째 공지사항</span>
				</div>
				<div class="anw">
					<span>치킨 먹어요.</span>
				</div>
				<div class="que">
					<span>네번째 공지사항</span>
				</div>
				<div class="anw">
					<span>보쌈 먹어요.</span>
				</div>
				<div class="que">
					<span>다섯번째 공지사항</span>
				</div>
				<div class="anw">
					<span>고기 먹어요.</span>
				</div>
				<div class="que">
					<span>여섯번째 공지사항</span>
				</div>
				<div class="anw">
					<span>고기 먹어요.</span>
				</div>
				<div class="que">
					<span>일곱째 공지사항</span>
				</div>
				<div class="anw">
					<span>고기 먹어요.</span>
				</div>
			</div>
		</div>
		<div class="bottom">
			<!--페이징-->
			<div class="paging">
				<input type="button" value="다음">
			</div>
			<div class="btn-container">
				<input type="submit" class="btn-3d red" value="등록">
			</div>
		</div>
	</div>
	</div>
	<div class="footer">footer</div>
	    <script>
        $(".que").click(function() {
            $(this).next(".anw").stop().slideToggle(300);
            $(this).toggleClass('on').siblings().removeClass('on');
            $(this).next(".anw").siblings(".anw").slideUp(300);
        });
        </script>
</body>
</html>