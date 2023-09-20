<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기게시판 목록</title>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		</header>
		
		<div class="container">
			<div class="main">
				<div class="noticetitle">
					<span>후기게시판</span>
				</div>
				<div>
					<form action="/review/r_search.do" method="get">
						<select name="searchCondition">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
						</select>
							<select name="reviewType">
								<option value="alltype">모든타입</option>
								<option value="location">여행지</option>
							</select>
						<input class="searchText" type="text" name="searchValue" placeholder="검색" value="${searchValue }">
						<input class="searchBtn" type="submit" value="검색">
					</form>
				</div>
				<table>
					<tr>
					</tr>
				</table>
			</div>
		</div>
		
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</footer>
	</body>
</html>