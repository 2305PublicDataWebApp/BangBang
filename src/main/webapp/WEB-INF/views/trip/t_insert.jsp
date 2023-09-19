<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>게시글 등록 폼</title>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	    
	    
	    <link rel="stylesheet" href="/resources/css/trip/t_insert.css">
<!-- 		<script src="/js/summernote/summernote-lite.js"></script> -->
<!-- 		<script src="/js/summernote/lang/summernote-ko-KR.js"></script> -->
<!-- 		<link rel="stylesheet" href="/css/summernote/summernote-lite.css"> -->
	</head>
	<body>
	    <header>
	
	    </header>
	    <main>
	        <div id="main-container">
	            <div id="form">
	                <div id="title">
	                    <div style="margin:20px 0 20px 20px;">
	                        <span>게시글 등록</span>
	                        <img src="./resources/images/logo.png" alt="발도장로고"> 
	                    </div>
	                </div>
	                <div style="margin: 40px auto; max-width: 700px;">
						<form action="#" method="post">
	                        <ul>
	                            <li>
	                                <label for="">여행지이름</label>
	                                <input type="text" id="" name="t-name"><br>
	                            </li>
	                            <li>
	                                <label for="">주소</label>
	                                <input type="text" id="" name="t-addr"><br>
	                            </li>
	                            <li>
	                                <label for="">한줄소개</label>
	                                <input type="text" id="" name="t-one"><br>
	                            </li>
	                            <li>
	                                <label for="">썸네일</label>
	                                <input type="text" id="" name="t-thum">
	                                <button>파일찾기</button><br>                            
	                            </li>
	                            <li>
	                                <label for="">첨부파일</label>
	                                <input type="text" id="" name="t-file">
	                                <button>파일찾기</button><br>
	                            </li>
	                            <li>
	                                <label for="">상세주소</label>
	                                <input type="text" id="" name="t-info-addr"><br>
	                            </li>
	                            <li>
	                                <label for="">홈페이지</label>
	                                <input type="text" id="" name="t-homepage"><br>
	                            </li>
	                            <li>
	                                <label for="">이용시간</label>
	                                <input type="text" id="" name="t-time"><br>
	                            </li>
	                            <li>
	                                <label for="">이용금액</label>
	                                <input type="text" id="" name="t-price"><br>
	                            </li>
	                            <li>
	                                <label for="">상세정보</label>
	                                <textarea id="summernote" name="t-info"></textarea>
<!-- 	                                <input type="text" id="" name="t-info"><br> -->
	                            </li>
	                            <script>
								    // 메인화면 페이지 로드 함수
								    $(document).ready(function () {
								        $('#summernote').summernote({
								            placeholder: '내용을 작성하세요',
								            height: 400,
								            maxHeight: 400
								        });
								    });
								</script>
							</ul>
							<button>등록</button>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </main>
	    <footer>
	
	    </footer>
	</body>
</html>