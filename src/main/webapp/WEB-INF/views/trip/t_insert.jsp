<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>게시글 등록 폼</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_insert.css">
	    <link rel="stylesheet" href="/resources/css/user/footer.css">
	    <link rel="stylesheet" href="/resources/css/user/header.css">
	    <link rel="stylesheet" href="/resources/css/reset.css">
	    
<!-- 	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<!-- 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!-- 		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<!-- 	    썸머노트를 위한 import -->
<!-- 		<script src="../resources/js/summernote/summernote-lite.js"></script> -->
<!-- 		<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script> -->
<!-- 		<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css"> -->
	</head>
	<body>
	    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	    <main>
	        <div id="main-container">
	            <div id="form">
	                <div id="title-div">
	                    <div id="insert-div">
	                        <span id="insert-span">게시글 등록</span>
	                        <img id="logo-img" src="/resources/images/logo.png" alt="발도장로고"> 
	                    </div>
	                </div>
	                <div style="margin: 40px auto; max-width: 700px;">
						<form action="/trip/t_insert.do" method="post" enctype="multipart/form-data">
	                        <ul>
	                        	<li class="insert-li">
	                                <label for="type">게시글 타입</label>
	                                <input type="text" id="type" name="tripType" required><br>
	                                <p style="margin-left: 100px;">타입은 여행지, 지역축제, 테마, 구성원별 중에서 입력해야 함</p>
	                            </li>
	                            <li class="insert-li">
	                                <label for="title">여행지이름</label>
	                                <input type="text" id="title" name="tripTitle" required><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="addr">주소</label>
	                                <input type="text" id="addr" name="tripAddr"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="oneInfo">한줄소개</label>
	                                <input type="text" id="oneInfo" name="tripSummary"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="thum">썸네일</label>
	                                <input type="file" id="thum" name="uploadFile">
	                            </li>
	                            <li class="insert-li">
	                                <label for="infoaddr">상세주소</label>
	                                <input type="text" id="infoaddr" name="tripInfoAddr"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="home">홈페이지</label>
	                                <input id="home" type="text"  name="tripHomePage"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="time">이용시간</label>
	                                <input type="text" id="time" name="tripTime"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="price">이용금액</label>
	                                <input type="text" id="price" name="tripPrice"><br>
	                            </li>
	                            <li class="insert-li">
	                                <label for="content">상세정보</label>
	                                <textarea id="tarea" wrap="hard" name="tripContent"></textarea>
<!-- 	                                <textarea id="summernote" name="tripContent"></textarea> -->
<!--  	                            	<span onclick="clickThumbnailAppend();" id="test"><button class="writeBtn" type="button">썸네일 새로고침</button></span> -->
<!-- 									<select id="thumbnailPath" name="thumbnailPath"></select> -->
	                            </li>
							</ul>
							<div id="btn-div">
								<button class="input-btn">등록</button>
							</div>
                            <script>
// 	                            $(document).ready(function(){
// 	                    			$('#summernote').summernote({
// 	                    				height : 300,
// 	                    				width : 700,
// 	                    				lang : "ko-KR",
// 	                    				callbacks:{
// 	                    					onImageUpload : function(files){
// 	                    						uploadSummernoteImageFile(files[0],this);
// 	                    					},
// 	                    					onPaste: function(e){
// 	                    						var clipboardData = e.originalEvent.clipboardData;
// 	                    						if(clipboardData && clipboardData.items && clipboardData.items.length){
// 	                    							var item = clipboardData.items[0];
// 	                    							if(item.kind === 'file' && item.type.indexOf('images/') !== -1){
// 	                    								e.preventDefault();
// 	                    							}
// 	                    						}
// 	                    					},
// 	                    				}
// 	                    			});
// 	                    // 섬머노트에디터 이미지 업로드 시 동작			
// 	                    			function uploadSummernoteImageFile(file,editor){
// 	                    				data = new FormData();
// 	                    				data.append("file",file);
// 	                    				$.ajax({
// 	                    					data:data,
// 	                    					type:"POST",
// 	                    					url:"/trip/uploadSummernoteImageFile",
// 	                    					dataType:"JSON",
// 	                    					contentType:false,
// 	                    					processData:false,
// 	                    					success:function(data){
// 	                    						$(editor).summernote("insertImage",data.url);
// 	                    					}
// 	                    				});
// 	                    			}
// 	                    		});
	                            
	                            
// 	                          //썸네일 새로고침 버튼 함수
// 	                            function clickThumbnailAppend(){
	                            	
// 	                            	//1.셀렉트 박스 하위 옵션을 먼저 모두 지워준다.
// 	                            	$("#thumbnailPath").empty();
	                            	
// 	                            	//2.썸머노트의 컨텐츠 HTML을 가져와서 큰따옴표로 분리한다.
// 	                            	var contentsHtml = $(".note-editable").html();
// 	                            	var regExSplit = /[\"]/;
// 	                            	var contentsHtmlArr = contentsHtml.split(regExSplit);
	                            	
// 	                            	//3.분리한 요소 중 이미지 저장 경로를 포함하고 있는 것을 이미지의 경로로 판단하고
// 	                            	//  이를 반복문을 사용하여 셀렉트박스의 옵션값으로 추가한다.
// 	                            	var index = 1;
// 	                            	for(var i=0; i<contentsHtmlArr.length; i++){
// 	                            		if(contentsHtmlArr[i].includes("/resources/image/")){
// 	                            			$("#thumbnailPath").append("<option value="+contentsHtmlArr[i]+">"+index+"번째 이미지"+"</option>");
// 	                            			index++;
// 	                            		}
// 	                            	}
// 	                            }

					<!-- 헤더 랜덤 이벤트 효과 -->
			        let header = document.querySelector('header');
			        let bars = document.querySelector('.fa-bars');
			        let navBar = document.querySelector('.navBar');
			
			
			        function circle() {
			
			            let div = document.createElement('div');
			            div.classList.add('circle');
			
			            let left = Math.floor(Math.random() * 100);
			            let top = Math.floor(Math.random() * 100);
			
			            div.style.left = left + '%';
			            div.style.top = top + '%';
			
			            header.appendChild(div);
			
			
			            setTimeout(function () {
			                header.removeChild(div)
			            }, 3500)
			
			
			        }
			
			
			        setInterval(function () {
			            circle()
			        }, 700);
			
			
			        let bolean = true;
			        bars.addEventListener("click", () => {
			            if (bolean == true) {
			                navBar.style.height = "40vmin";
			                bars.classList.replace("fa-bars", "fa-remove");
			                bolean = false;
			            } else {
			                navBar.style.height = "0%";
			                bars.classList.replace("fa-remove", "fa-bars");
			                bolean = true;
			            }
			        })
							</script>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </main>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>