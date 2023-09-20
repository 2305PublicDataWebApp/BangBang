<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>게시글 등록 폼</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_insert.css">
	    
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	    <!-- 썸머노트를 위한 import -->
		<script src="../resources/js/summernote/summernote-lite.js"></script>
		<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css">
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
	                        <img src="/resources/images/logo.png" alt="발도장로고"> 
	                    </div>
	                </div>
	                <div style="margin: 40px auto; max-width: 700px;">
						<form action="/trip/t_insert.do" method="post">
	                        <ul>
	                        	<li>
	                                <label for="type">게시글 타입</label>
	                                <input type="text" id="type" name="ttype"><br>
	                            </li>
	                            <li>
	                                <label for="title">여행지이름</label>
	                                <input type="text" id="title" name="tname"><br>
	                            </li>
	                            <li>
	                                <label for="addr">주소</label>
	                                <input type="text" id="addr" name="taddr"><br>
	                            </li>
	                            <li>
	                                <label for="oneInfo">한줄소개</label>
	                                <input type="text" id="oneInfo" name="tone"><br>
	                            </li>
	                            <li>
	                                <label for="thum">썸네일</label>
	                                <input type="text" id="thum" name="tthum">
	                                <button>파일찾기</button><br>                            
	                            </li>
	                            <li>
	                                <label for="file">첨부파일</label>
	                                <input type="text" id="file" name="tfile">
	                                <button>파일찾기</button><br>
	                            </li>
	                            <li>
	                                <label for="infoaddr">상세주소</label>
	                                <input type="text" id="infoaddr" name="tinfoaddr"><br>
	                            </li>
	                            <li>
	                                <label for="home">홈페이지</label>
	                                <input type="text" id="home" name="thomepage"><br>
	                            </li>
	                            <li>
	                                <label for="time">이용시간</label>
	                                <input type="text" id="time" name="ttime"><br>
	                            </li>
	                            <li>
	                                <label for="price">이용금액</label>
	                                <input type="text" id="price" name="tprice"><br>
	                            </li>
	                            <li>
	                                <label for="summernote">상세정보</label>
	                                <textarea id="summernote" name="tinfo"></textarea>
<!-- 	                                <input type="text" id="" name="t-info"><br> -->
	                            </li>
	                            <script>
								    // 메인화면 페이지 로드 함수
// 								    $(document).ready(function(){
// 										$('#summernote').summernote({
// 											height : 300,
// 											width : 700,
// 											lang : "ko-KR",
// 											callbacks:{
// 												onImageUpload : function(files){
// 													uploadSummernoteImageFile(files[0],this);
// 												},
// 												onPaste: function(e){
// 													var clipboardData = e.originalEvent.clipboardData;
// 													if(clipboardData && clipboardData.items && clipboardData.items.length){
// 														var item = clipboardData.items[0];
// 														if(item.kind === 'file' && item.type.indexOf('image/') !== -1){
// 															e.preventDefault();
// 														}
// 													}
// 												},
// 											}
// 										});
// 							            // 섬머노트에디터 이미지 업로드 시 동작			
// 										function uploadSummernoteImageFile(file,editor){
// 											data = new FormData();
// 											data.append("file",file);
// 											$.ajax({
// 												data:data,
// 												type:"POST",
// 												url:"/review/uploadSummernoteImageFile",
// 												dataType:"JSON",
// 												contentType:false,
// 												processData:false,
// 												success:function(data){
// 													$(editor).summernote("insertImage",data.url);
// 												}
// 											});
// 										}
// 									});
// 								    $(document).ready(function() {
// 							            //여기 아래 부분
// 							            $('#summernote').summernote({
// 							                height: 300,                 // 에디터 높이
// 							                minHeight: null,             // 최소 높이
// 							                maxHeight: null,             // 최대 높이
// 							                focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
// 							                lang: "ko-KR",					// 한글 설정
// 							                placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
							                
// 							            });
// 							        });
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