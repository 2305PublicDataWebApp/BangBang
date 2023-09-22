<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색회원조회</title>
    	<link rel='stylesheet' href='/resources/css/admin/memberList.css'>
    	<link rel="stylesheet" href="/resources/css/banner/bannerList.css">
    	<link rel="stylesheet" href="/resources/css/user/header.css">
    	<link rel="stylesheet" href="/resources/css/user/footer.css">
    	<link rel="stylesheet" href="/resources/css/reset.css">
	</head>
	<body style="background: #F2F2F2;">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

		<div class="container">
			<div class="center">
				<h1>전체회원조회</h1>
	<hr>
	<div id="boardTable" class="board-list">
		<form action="/admin/searchUserList.do" method="get">
	        <div class="filter input-group mb-3">
	        <select name="searchCondition">
				<option value="all" <c:if test="${param.searchCondition == 'all' }">selected</c:if>>전체</option>
				<option value="name" <c:if test="${param.searchCondition == 'name' }">selected</c:if>>이름</option>
				<option value="id" <c:if test="${param.searchCondition == 'id' }">selected</c:if>>아이디</option>
				<option value="nickname" <c:if test="${param.searchCondition == 'nickname' }">selected</c:if>>닉네임</option>   
			</select> 
	        <input class="form-control" type="text" name="searchKeyword" placeholder="검색"/>
	        <input type="submit" value="검색">
	        </div>
	     </form>
     </div>
      <table class="table table-borderd  table-fixed">
          <thead>
	          <tr>
	              <th>No</th>
	              <th>아이디</th>
	              <th>회원명</th>
	              <th>닉네임</th>
	              <th>가입일</th>
	          </tr>
          </thead>
          <tbody>
          	<c:forEach items="${uList }" var="uOne" varStatus="i">
			<tr>
           		<td>${i.count }</td>
           		<td>${uOne.userId }</td>
	           		<c:url var="detailUrl" value="/admin/aInfo.do">
					<c:param name="userId" value="${uOne.userId }"></c:param>
				</c:url>
				<td><a href="${detailUrl }">${uOne.userName }</a></td>
           		<td>${uOne.userNickname }</td>
           		<td>${uOne.userRegDate }</td>
           	</tr>            	
          	</c:forEach>
          </tbody>
        </table>
        <nav aria-label="Page navigation example" style="justify-content: center;">
			<c:url var="prevUrl" value="/admin/searchUserList.do">
				<c:param name="page" value=""></c:param>
				<c:param name="searchCondition" value="${paramMap.searchCondition }"></c:param>
				<c:param name="searchKeyword" value="${paramMap.searchKeyword }"></c:param>
			</c:url>
			<div class="current-page-area"></div>
            <ul class="pagination justify-content-center">
	         	<c:if test="${aInfo.startNavi != 1 }">
		            <li class="page-item"  ><a class="page-link" href="${prevUrl }">Prev</a></li>
	            </c:if>
	         
	            <c:forEach begin="${aInfo.startNavi }" end="${aInfo.endNavi }" var="p">
					<c:url var="pageUrl" value="/admin/searchUserList.do">
						<c:param name="page" value="${p }"></c:param>
						<c:param name="searchCondition" value="${paramMap.searchCondition }"></c:param>
						<c:param name="searchKeyword" value="${paramMap.searchKeyword }"></c:param>
					</c:url>
	            	<li class="page-item"><a class="page-link" href="${pageUrl }">${p }</a></li>
	            </c:forEach>
	            <c:if test="${aInfo.endNavi != aInfo.naviTotalCount }">
					<c:url var="nextUrl" value="/admin/searchUserList.do"> 
						<c:param name="page" value="${aInfo.endNavi + 1 }"></c:param>
						<c:param name="searchCondition" value="${paramMap.searchCondition }"></c:param>
						<c:param name="searchKeyword" value="${paramMap.searchKeyword }"></c:param>
					</c:url>
		            <li class="page-item"><a class="page-link" href="${nextUrl }">Next</a></li>
	            </c:if>
            </ul>
        </nav>  
			</div>
		</div>
		
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
			
			
		<script>
	
		</script>
	</body>
</html>