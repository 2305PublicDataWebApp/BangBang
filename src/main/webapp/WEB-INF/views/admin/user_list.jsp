<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>전체회원조회</title>
	<link rel='stylesheet' href='/resources/css/admin/memberList.css'>
<!--     <script src='https://unpkg.com/vue@2.5.17/dist/vue.js'></script> -->
	</head>
	<body>
<header style="text-align: center;">
    <br><br>
    <h1>헤더</h1>
  </header>
  <hr>
  <br><br><br><br>

    <div id="boardTable" class="board-list">
    
	<form action="/admin/searchUserList.do" method="get">
		
	        <div class="filter input-group mb-3">
	        <select name="searchCondition">
				<option value="all">전체</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>   
			</select> 
	        <input class="form-control" type="text" placeholder="검색"/>
	        <input type="submit" value="검색">
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
        <nav aria-label="Page navigation example">
            <div class="current-page-area">
          </div>
         	<c:if test="${pInfo.startNavi != 1 }">
			<c:url var="prevUrl" value="/admin/list.do">
			<c:param name="page" value=""></c:param>
			</c:url>
            <ul class="pagination justify-content-center">
            <li class="page-item" ><a class="page-link" href="${prevUrl }">Prev</a></li>
            </c:if>
            
            <c:forEach begin="${aInfo.startNavi }" end="${aInfo.endNavi }" var="p">
			<c:url var="pageUrl" value="/admin/list.do">
			<c:param name="page" value="${p }"></c:param>
			</c:url>
            <li class="page-item" ><a class="page-link" href="${pageUrl }">${p }</a></li>
            </c:forEach>
            
            <c:if test="${aInfo.endNavi != aInfo.naviTotalCount }">
			<c:url var="nextUrl" value="/admin/list.do"> 
			<c:param name="page" value="${aInfo.endNavi + 1 }"></c:param>
			</c:url>
            <li class="page-item" ><a class="page-link" href="${nextUrl }">Next</a></li>
            </c:if>
            
            </ul>
        </nav>
        </div>


        <br><br><br><br>
        <hr>
        <footer style="text-align: center;">  
            <h1>푸터</h1>
        </footer>
    
        <script>

        </script>	
	</body>
</html>