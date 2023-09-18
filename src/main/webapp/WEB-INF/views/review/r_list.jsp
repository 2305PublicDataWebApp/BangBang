<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<div class="header">헤더</div>
	<div class="container">
	<div class="banner">배너</div>
		<div class="main">
			<input class="enroll" type="button" value="글작성">
			<table>
				<thead>
					<tr>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>축제</th>
						<th>대전빵축제후기</th>
						<th>11</th>
						<th>2023-4-6</th>
					</tr>
					<tr>
						<th>여행지</th>
						<th>경주다녀왓으요</th>
						<th>12</th>
						<th>333</th>
					</tr>
					<tr>
						<th>축제</th>
						<th>종강파티</th>
						<th>13</th>
						<th>3333333</th>
					</tr>
					<tr>
						<th>축제</th>
						<th>종강예예</th>
						<th>34</th>
						<th>333</th>
					</tr>
					<tr>
						<th>여행지</th>
						<th>제주도 후기</th>
						<th>56</th>
						<th>ㄷㄷㄷ</th>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="bottom">
			<div class="paging">페이징처리부분</div>
			<div class="search">
				<form action="/rsearch.do" method="get">
					<select name="reviewSearch">
						<option value = "all">전체</option>
						<option value = "title">제목</option>
						<option value = "content">내용</option>
						<option value = "writer">작성자</option>
					</select>
					<input type="text" name="rsearchKeyword" placeholder="검색어를 입력하세요">
					
				</form>
			</div>
		</div>
	</div>
	<div class="footer">푸터</div>
	</body>
</html>