<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<div class="header">header</div>
	<div class="container">
		<div class="banner">
			사진공간
		</div>
		<div class="top">
			<div class="noticetitle">
				<h2>공지사항</h2>
			</div>
			<hr>
		</div>
		<!-- <div class="mid"> 내용들어가기 -->
		<table class="noticeform">
			<tr>
				<td>제목</td>
				<td><input type="text" style="width: 400px; height: 40px;">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="100"></textarea></td>
			</tr>
		</table>

		<div class="bottom">
			<!-- 글 쓰는 버튼 -->
			<div class="modify">
				<!--작성하기 버튼-->
				<input class="write" type="button" value="수정하기">
			</div>
		</div>
	</div>
	<div class="footer">footer</div>

	</body>
</html>