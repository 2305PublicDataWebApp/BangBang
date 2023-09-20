<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세보기</title>
		<link rel="stylesheet" href="/resources/css/notice/n_detail.css">
		<link rel="stylesheet" href="/resources/css/user/header.css">
		<link rel="stylesheet" href="/resources/css/user/footer.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
	</head>
	<body>
    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    
    <div class="container">
        <div class="center">
    			<div class="noticesubject">
    				<span>공지사항</span>
    			</div>
    			<div class="title">
    			<span>${notice.noticeTitle }</span>
    			</div>
    			
    			<div class="button">
    			<c:url var="noticeModiUrl" value="/notice/n_modify.do">
    				<c:param name="noticeNo" value="${notice.noticeNo }" />
    			</c:url>
    			<c:if test="${adminId ne null}">
    				<button type="button" onclick="showModifyPage('${modifyUrl }');">수정하기</button>
    			</c:if>
    			</div>
    			<hr>
    			<div>
    				<span>${notice.noticeContent }</span>
    			</div>
    			<div>
    				<button type="button" onclick="showNoticeList();">목록으로</button>
    			</div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
    <script>
    	function showNoticeList(){
    		location.href="/notice/n_list.do";
    	}
    	function showModifyPage(){
    		const noticeNo = "${notice.noticeNo }";
    		location.href="/notice/n_modify.do?noticeNo="+noticeNo;
    	}
    </script>

	</body>
</html>