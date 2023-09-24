<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>배너등록</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	   	<link rel="stylesheet" href="/resources/css/banner/bannerList.css">
	   	<link rel="stylesheet" href="/resources/css/user/header.css">
	   	<link rel="stylesheet" href="/resources/css/user/footer.css">
	   	<link rel="stylesheet" href="/resources/css/reset.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  		<script type="text/javascript" src="./resources/js/validation.js"></script>
	</head>
	<body style="background: #F2F2F2;">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<div class="container">
		<div class="center">
			<div class="row">
				<div class="col-md-6">
					<h3>배너 등록<img src="/resources/images/logo.png" style="width: 37px; height: 37px; margin-right: 340px;" class="float-right"></h3>
					<hr style="width: 1030px"><br><br>
				</div>
				<div class="col-md-6 text-right">
					<!-- <img src="/img/logo.png" style="width: 30px; height: 30px;" class="float-right"> -->
				</div>
			</div>
		<form name="newProduct" action="/banner/insert.do" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">배너명</label>
				<div class="col-sm-10">
					<input type="text" id="bannerName" name="bannerName" class="form-control" required=""><br>
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">배너영역</label>
				<div class="col-sm-10">
					<select id="bannerArea" name="bannerArea" class="form-control" onchange="updateBannerSize()" required="">
						<option value="select" required="">영역을 선택해주세요.</option>
						<option value="main_b" required="">메인 배너</option>
						<option value="trip_b" required="">여행지 추천 배너</option>
					</select><br>
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">배너크기</label>
				<div class="col-sm-10">
					<input type="text" id="bannerSize" name="bannerSize" class="form-control" required=""><br>
				</div>
			</div>
	
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이미지</label>
				<div class="col-sm-10">
					<div class="form-control">
						<img id="preview" style="width:830px; height:100px;" />
					</div><br>
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">링크 URL</label>
				<div class="col-sm-10">
					<input type="text" name="linkUrl" class="form-control" placeholder="http://www.naver.com/" required=""><br>
				</div>
			</div>
	
			<!-- 나머지 입력 필드도 같은 방식으로 수정 -->
	
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이미지 파일</label>
				<div class="col-sm-10">
					<input type="file" name="fileUpload" onchange="readURL(this);" class="form-control" required=""><br>
				</div>
			</div>
	
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">사용여부</label>
				<div class="col-sm-10">
					<div class="form-check">
						<input type="radio" name="bStatusYn" value="Y" class="form-check-input" required="">
						<label class="form-check-label">사용함</label>
					</div>
					<div class="form-check">
						<input type="radio" name="bStatusYn" value="N" class="form-check-input" required="">
						<label class="form-check-label">사용 안함</label>
					</div>
				</div>
			</div><br>
	
			<div class="form-group row">
				<div class="col-sm-10 offset-sm-2">
					<input type="submit" class="btn btn-primary" value="등록"  style="background-color: #FFFACD; color: black; width: 100%; border-color: black;">
				</div>
			</div>
		</form>
		</div>
	</div>
		
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
				
	<script>
	
	function updateBannerSize() {
        var selectElement = document.getElementById("bannerArea");
        var bannerSize = document.getElementById("bannerSize");
        var unitPrice = document.getElementById("bannerSize");

        if (selectElement.value === "main_b") {
            unitPrice.value = "1516*400";
        } else if (selectElement.value === "trip_b") {
            unitPrice.value = "1684*80";
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