<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>여행지 추천 게시판</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_list.css">
	</head>
	<body>
	    <header>
	    </header>
	    <main>
	        <div class="banner">
	            <img class="banner-img" src="/resources/images/main/dirud.png" class="d-block w-100" alt="벚꽃">
	        </div>
	        <div>
	            <div id="list">
	                <div id="select">
	                    <form action="/trip/t_search.do" method="get">
	                        <select name="searchCondition">
								<option value="all" 		<c:if test="${searchCondition == 'all' 		}"	>selected</c:if>>전체</option>
								<option value="trip" 		<c:if test="${searchCondition == 'trip' 	}"	>selected</c:if>>여행지</option>
								<option value="festival" 	<c:if test="${searchCondition == 'festival' }"	>selected</c:if>>지역축제</option>
								<option value="content" 	<c:if test="${searchCondition == 'content' 	}"	>selected</c:if>>테마</option>
								<option value="by-member" 	<c:if test="${searchCondition == 'by-member'}"	>selected</c:if>>구성원별</option>
							</select>
	                        <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
							<input type="submit" value="검색">
	                    </form>
	                </div>
	                <div id="list-item">
	                    <!-- forEach문으로 10개 만들기 -->
	                    <c:forEach var="trip" items="${sTList }" varStatus="i">
		                    <div id="item-container">
		                        <div id="img-div">
		                            <a href="/trip/t_detail.do?tripNo=${trip.tripNo }"><img class="banner-img" src="/resources/images/main/개발자.jpg" alt=""></a>
		                        </div>
		                        <div id="info-li">
		                            <ul>
		                                <li class="trip-title"><a href="/trip/t_detail.do?tripNo=${trip.tripNo }">${trip.tripTitle }</a></li>
		                                <li class="trip-addr">${trip.tripAddr }</li>
		                                <li class="trip-one">${trip.tripSummary }</li>
		                            </ul>
		                        </div>
		                    </div>
	                    </c:forEach>
	                    <!-- 여기까지-------- -->
	                </div>
	                
	                <div style="display: flex; justify-content: right;">
	                    <button style="padding: 3px 8px; margin: 5px 10px;">등록</button>
	                </div>
	                <div style="display: flex; justify-content: center;">
	                    <div id="page">
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
	                    </div>
	                </div>
	            </div>
	        </div>
	    </main>
	    <footer>
	    </footer>
	</body>
</html>