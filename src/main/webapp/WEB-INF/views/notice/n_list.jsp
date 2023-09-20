<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항리스트</title>
    	<link rel="stylesheet" href="../resources/css/n_list.css">
    	<link rel="stylesheet" href="/resources/css/user/header.css">
    	<link rel="stylesheet" href="/resources/css/user/footer.css">
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		</header>

		<div class="container">
			<div class="main">
				<div class="noticetitle">
					<span>공지사항</span>
				</div>
				<hr>
				<table class="noticetable">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="{nList }" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<c:url var="detailUrl" value="/notice/n_detail.do">
								<c:param name="noticeNo" value="${notice.noticeNo }" />
							</c:url>
							<td><a href="${detailUrl }">${notice.noticeTitle }</a></td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeDate }"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<div class="paging">
					<c:if test="${nInfo.nStartNavi != 1}">
						<c:url var="preUrl" value="/notice/n_list.do">
							<c:param name="page" value="${nInfo.nStartNavi -1 }" />
						</c:url>
						<a href="${preUrl }">[이전]</a>
					</c:if>
					<c:forEach begin="${nInfo.nStartNavi }" end="${nEndNavi }" var = "n">
						<c:url var="pageUrl" value="notice/n_list.do">
							<c:param name="page" value="${n }"></c:param>
						</c:url>
						<a href="${pageUrl }">${n }</a>&nbsp;
					</c:forEach>
					<c:if test="${nInfo.nEndNavi != nInfo.nNaviTotalCount }">
						<c:url var="nextUrl" value="/notice/n_list.do">
							<c:param name="page" value="${nInfo.nEndNavi +1 }" />
						</c:url>
						<a href="${nextUrl }">[다음]</a>
					</c:if>
				</div>
				</table>
				<div class="bottom">
					<div>
						<c:if test="${adminId ne null }">
							<button type="button" onclick="showRegisterNForm()">글쓰기</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</footer>
		<script>
			function showRegisterNForm(){
				location.href="/notice/n_insert.do"
			}
		</script>
	</body>
</html>