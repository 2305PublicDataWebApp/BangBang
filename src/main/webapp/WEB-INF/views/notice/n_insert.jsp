<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="../resources/css/noticeInsert.css">
	</head>
	<body>
    <div class="header">header</div>
    <div class="banner"> <!--배너사진-->
	사진
    </div>
        <div class="container"> <!-- 전체배경을 먹이기 위한 컨테이너-->
            <div class="top"><!-- 공지사항 등록이란 글자..대충-->
                <div class="noticetitle">
                    <h2>공지사항</h2>
                </div>
                <hr>
            </div>
            <!-- <div class="mid"> 내용들어가기 -->
                <table class="noticeform">
                    <tr>
                        <td>제목</td>
                        <td>
                            <input type="text" style="width:400px;height:40px;">
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea rows="20" cols="100" ></textarea>
                        </td>
                    </tr>
                </table>
           
            <div class="bottom">
                <div class="enroll">
                    <input type="button" value="작성하기">
                </div>
            </div>
        </div>
    <div class="footer">footer</div>
	</body>
</html>