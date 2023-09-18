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
	</head>
	<body>
		<header>header</header>

		<div class="container">
			<div class="banner">배너</div>
			<div class="main">
				<h2>공지사항</h2>
				<hr>
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
				<div class="bottom">
					<a href="#" id="load">MORE</a>
					<div>
						<input type="submit" value="등록">
					</div>
				</div>
			</div>
		</div>
		
		<footer>footer</footer>
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
	</body>
</html>