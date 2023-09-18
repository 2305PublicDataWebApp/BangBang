<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
    <div class="header">header</div>
    <div class="container"> <!-- 전체배경을 먹이기 위한 컨테이너-->
    <div class="banner"> <!--배너사진-->
    </div>
        <div class="main"> <!-- 내용이 들어가기 위한 메인 -->
            <div class="top"> <!-- 제목단락 -->
                <div class="title">
                    <h3>[안내]공지사항입니다.</h3>
                </div> <!--제목내용-->
            </div>
            <div class="mid"> <!-- 내용, 수정과 삭제버튼-->
                <div class="button"> <!-- 수정과 삭제 버튼이 들어갑니다-->
                    <div class="modify"> <!-- 수정버튼(관리자만 보임)-->
                        수정버튼!
                        <c:if test="${adminId ne null }">
                            <input type="button" value="수정">
                        </c:if>
                    </div>9
                    <div class="remove"> <!-- 삭제버튼(관리자만 보임) -->
                        삭제버튼!
                        <c:if test="${adminId ne null }">
                            <input type="button" value="삭제">
                        </c:if>
                    </div>
                </div>
                <hr>
                <div class="content">
                    <h5>이것은 공지사항임니다ㅏㅏㅏㅏㅏㅏ</h5>
                </div><!-- 글 내용-->
            </div>
            <div class="bottom"> <!-- 목록가기위한 버튼넣을곳 -->
                <div class="list"> <!-- 목록으로 보냄 -->
                    <input type="button" value="목록으로">
                </div>
            </div>
        </div>
    </div>
    <div class="footer">footer</div>

	</body>
</html>