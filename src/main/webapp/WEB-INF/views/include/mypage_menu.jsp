<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <br><br>
<div class="menu-box">
	<div class="menu-box-top">
	
		<!-- 개인 정보 조회 -->
		<div class="menu-info">
			<a href="/user/info.do?userId=${ user.userId }"><img class="menu-icon" src="/resources/images/user/info.png" alt="개인 정보 조회"></a><br>
			<span id="info-text">개인 정보 조회</span>
		</div>
		
		<!-- 개인 정보 수정 -->
		<form action="/user/modify.do" method="post">
			<div class="menu-info-modify">
				<a href="/user/check_pw.do?userId=${ user.userId }"><img class="menu-icon" src="/resources/images/user/modify.png" alt="개인 정보 수정"></a><br>
				<span id="modify-text">개인 정보 수정</span>
			</div>
		</form>
		
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
		    <a href="/user/remove.do?userId=${ userId }"><img class="menu-icon" src="/resources/images/user/remove.png" alt="탈퇴"></a><br>
		    <span id="info-remove">회원 탈퇴</span>
		</div>
	</div>
</div>
 <br><br><br><br><br><br>
 