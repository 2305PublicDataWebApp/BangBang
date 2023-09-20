<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>여행지 추천 게시판</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_list.css">
	    <link rel="stylesheet" href="/resources/css/user/footer.css">
	    <link rel="stylesheet" href="/resources/css/user/header.css">
	    <link rel="stylesheet" href="/resources/css/reset.css">
	</head>
	<body>
	   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	    <main>
	        <div>
	            <div id="list">
	                <div id="select">
	                    <form action="/trip/t_search.do" method="get">
	                        <select name="searchCondition">
								<option value="all">전체</option>
								<option value="trip">여행지</option>
								<option value="festival">지역축제</option>
								<option value="content">테마</option>
								<option value="by-member">구성원별</option>
							</select>
	                        <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
							<input type="submit" value="검색">
	                    </form>
	                </div>
	                <div id="list-item">
	                    <c:forEach begin="0" end="10" var="trip" items="${tList }" varStatus="i">
		                    <div id="item-container">
		                    	<c:url var="detailUrl" value="/trip/t_detail.do">
		                    		<c:param name="tripNo" value="${trip.tripNo }"></c:param>
		                    	</c:url>
		                        <div id="img-div">
		                            <a href="${detailUrl }"><img class="banner-img" src="/resources/images/main/개발자.jpg" alt=""></a>
		                        </div>
		                        <div id="info-li">
		                            <ul>
		                                <li class="trip-title"><a href="${detailUrl }">${trip.tripTitle }</a></li>
		                                <li class="trip-addr">${trip.tripAddr }</li>
		                                <li class="trip-one">${trip.tripSummary }</li>
		                            </ul>
		                        </div>
		                    </div>
	                    </c:forEach>
	                </div>
	                <c:if test="${adminId ne null }">
		                <div style="display: flex; justify-content: right;">
		                    <button style="padding: 3px 8px; margin: 5px 10px;" onclick="insertTrip()">등록</button>
		                </div>
	                </c:if>
	                
	                <div style="display: flex; justify-content: center;">
	                    <div id="page">
	                        <!-- sts에서 페이징 처리하기 -->
	                    	<c:if test="${tPInfo.tStartNavi ne '1' }">
	                    		<c:url var="pageUrl" value="/trip/t_list.do">
	                    			<c:param name="page" value="${tPInfo.startNavi -1 }"></c:param>
	                    		</c:url>
		                        <a href="${pageUrl }">[이전]</a>
	                    	</c:if>
	                        <c:forEach begin="${tPInfo.tStartNavi }" end="${tPInfo.tEndNavi }" var="p">
	                        	<c:url var="pageUrl" value="/trip/t_list.do">
	                        		<c:param name="page" value="${p }"></c:param>
	                        	</c:url>
	                        	<a href="${pageUrl }">${p }</a>&nbsp;
	                        </c:forEach>
	                        <c:if test="${tPInfo.tEndNavi ne tPInfo.tNaviTotalCount }">
	                        	<c:url var="pageUrl" value="/trip/t_list.do">
	                        		<c:param name="page" value="${tPInfo.tEndNavi +1 }"></c:param>
	                        	</c:url>
		                        <a href="${pageUrl }">[다음]</a>
	                        </c:if>
	                        <!-- 페이징 처리 -->
	                    </div>
	                </div>
	            </div>
	        </div>
	    </main>
	    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	    <script>
	    	function insertTrip() {
				location.href="/trip/t_insert.do";
			}
	    </script>
	</body>
</html>