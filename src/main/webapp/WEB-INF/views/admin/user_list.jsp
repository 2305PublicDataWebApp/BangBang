<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>전체회원조회</title>
    	<link rel='stylesheet' href='/resources/css/admin/memberList.css'>
    	<link rel="stylesheet" href="/resources/css/banner/bannerList.css">
    	<link rel="stylesheet" href="/resources/css/user/header.css">
    	<link rel="stylesheet" href="/resources/css/user/footer.css">
    	<link rel="stylesheet" href="/resources/css/reset.css">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
			      <input type="submit" value="검색" style="background-color: #FFFACD; color: black; border-color: black; width: 90px;">
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
            	<c:forEach items="${user }" var="uOne" varStatus="i">
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
        <div aria-label="Page navigation example" class="page">
	        <c:url var="prevUrl" value="/admin/list.do">
				<c:param name="page" value=""></c:param>
			</c:url>
            <div class="current-page-area"></div>
          	<ul class="pagination justify-content-center">
	         	<c:if test="${aInfo.startNavi != 1 }">
					<li class="page-item" ><a class="page-link" href="${prevUrl }" style="background-color: #FFFACD; color: black; border-color: black;">Prev</a></li>
	            </c:if>
            
	            <c:forEach begin="${aInfo.startNavi }" end="${aInfo.endNavi }" var="p">
					<c:url var="pageUrl" value="/admin/list.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
	            	&nbsp;&nbsp;&nbsp;<li class="page-item" ><a class="page-link" href="${pageUrl }" style="background-color: #FFFACD; color: black; border-color: black;">${p }</a></li>&nbsp;&nbsp;&nbsp;
	            </c:forEach>
            
	            <c:if test="${aInfo.endNavi != aInfo.naviTotalCount }">
					<c:url var="nextUrl" value="/admin/list.do"> 
						<c:param name="page" value="${aInfo.endNavi + 1 }"></c:param>
					</c:url>
	            	<li class="page-item" ><a class="page-link" href="${nextUrl }" style="background-color: #FFFACD; color: black; border-color: black;">Next</a></li>
	            </c:if>
            </ul>
        </div>     
<!--         <nav aria-label="Page navigation example"> -->
<%-- 	        <c:url var="prevUrl" value="/admin/list.do"> --%>
<%-- 				<c:param name="page" value=""></c:param> --%>
<%-- 			</c:url> --%>
<!--             <div class="current-page-area"></div> -->
<!--           	<ul class="pagination justify-content-center"> -->
<%-- 	         	<c:if test="${aInfo.startNavi != 1 }"> --%>
<%-- 					<li class="page-item" ><a class="page-link" href="${prevUrl }">Prev</a></li> --%>
<%-- 	            </c:if> --%>
            
<%-- 	            <c:forEach begin="${aInfo.startNavi }" end="${aInfo.endNavi }" var="p"> --%>
<%-- 					<c:url var="pageUrl" value="/admin/list.do"> --%>
<%-- 						<c:param name="page" value="${p }"></c:param> --%>
<%-- 					</c:url> --%>
<%-- 	            	<li class="page-item" ><a class="page-link" href="${pageUrl }">${p }</a></li> --%>
<%-- 	            </c:forEach> --%>
            
<%-- 	            <c:if test="${aInfo.endNavi != aInfo.naviTotalCount }"> --%>
<%-- 					<c:url var="nextUrl" value="/admin/list.do">  --%>
<%-- 						<c:param name="page" value="${aInfo.endNavi + 1 }"></c:param> --%>
<%-- 					</c:url> --%>
<%-- 	            	<li class="page-item" ><a class="page-link" href="${nextUrl }">Next</a></li> --%>
<%-- 	            </c:if> --%>
			</div>
		</div>
		
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
			
			
		<script>
	
		</script>
	</body>
</html>