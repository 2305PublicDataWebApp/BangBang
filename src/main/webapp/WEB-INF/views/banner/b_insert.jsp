<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>배너등록</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel='stylesheet' href='/resources/css/admin/a_header.css'>
	<link rel="stylesheet" href="/resources/css/user/footer.css">
	<script type="text/javascript" src="./resources/js/validation.js"></script>
	</head>
	<body>
	
	<!-- header -->
    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    
    
<%-- <jsp:include page="menu.jsp"/> --%>
<!-- 	<div class="jumbotron"> -->
<!-- 		<div class="container"> -->
<!-- 			<h1 class="display-3"> -->
<!-- 				HEADER -->
<!-- 			</h1> -->
<!-- 		</div> -->
<!-- 	</div> -->


	<main class="i_main" style="width: 1130px; margin: 0 auto; background-color: white;">
		<br><br><br>	

    <div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3>배너 등록<img src="/resources/images/logo.png" style="width: 35px; height: 35px; margin-right: 370px;" class="float-right"></h3>
				<hr style="width: 1100px"><br><br>
			</div>
			<div class="col-md-6 text-right">
				<!-- <img src="/img/logo.png" style="width: 30px; height: 30px;" class="float-right"> -->
			</div>
		</div>
	</div>
	
	<div class="container">
		<form name="newProduct" action="/banner/insert.do" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">배너명</label>
				<div class="col-sm-10">
					<input type="text" id="bannerName" name="bannerName" class="form-control"><br>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">배너영역</label>
				<div class="col-sm-10">
					<select id="bannerArea" name="bannerArea" class="form-control" onchange="updateBannerSize()">
						<option value="select">영역을 선택해주세요.</option>
						<option value="main_b">메인 배너</option>
						<option value="trip_b">여행지 추천 배너</option>
					</select><br>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">배너크기</label>
				<div class="col-sm-10">
					<input type="text" id="bannerSize" name="bannerSize" class="form-control"><br>
				</div>
			</div>

			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이미지</label>
				<div class="col-sm-10">
					<div class="form-control">
<!-- 						<input type="file" onchange="readURL(this);">  -->
					<img id="preview" style="width:100px; height:100px;" />
					</div><br>
					
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">링크 URL</label>
				<div class="col-sm-10">
					<input type="text" name="linkUrl" class="form-control"><br>
				</div>
			</div>
	
			<!-- 나머지 입력 필드도 같은 방식으로 수정 -->
	
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이미지 파일</label>
				<div class="col-sm-10">
					<input type="file" name="fielUpload" onchange="readURL(this);" class="form-control"><br>
				</div>
			</div>
	
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">사용여부</label>
				<div class="col-sm-10">
					<div class="form-check">
						<input type="radio" name="bStatusYn" value="Y" class="form-check-input">
						<label class="form-check-label">사용함</label>
					</div>
					<div class="form-check">
						<input type="radio" name="bStatusYn" value="N" class="form-check-input">
						<label class="form-check-label">사용 안함</label>
					</div>
				</div>
			</div><br>
	
			<div class="form-group row">
				<div class="col-sm-10 offset-sm-2">
					<input type="submit" class="btn btn-primary" value="등록"  style="background-color: #FFFACD; color: black; width: 100%;">
				</div>
			</div>
		</form>
	</div>
	

	</main>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>	

<!-- 	<br><br><br>	 -->
<!-- 	<div class="jumbotron" style="margin: 0;"> -->
<!-- 		<div class="container"> -->
<!-- 			<h1 class="display-3"> -->
<!-- 				FOOTER -->
<!-- 			</h1> -->
<!-- 		</div> -->
<!-- 	</div> -->



    <script>
        function updateBannerSize() {
        var selectElement = document.getElementById("bannerArea");
        var bannerSize = document.getElementById("bannerSize");
        var unitPrice = document.getElementById("bannerSize");

        if (selectElement.value === "main_b") {
            unitPrice.value = "420*210";
        } else if (selectElement.value === "trip_b") {
            unitPrice.value = "100*100";
        } else {
            unitPrice.value = "";
        }
    }

    // 초기화 시 호출
    updateBannerSize();
    
    
    
    
    function readURL(input) {
    	  if (input.files && input.files[0]) {
    	    var reader = new FileReader();
    	    reader.onload = function(e) {
    	      document.getElementById('preview').src = e.target.result;
    	    };
    	    reader.readAsDataURL(input.files[0]);
    	  } else {
    	    document.getElementById('preview').src = "";
    	  }
    	}
    
    </script>

	</body>
</html>