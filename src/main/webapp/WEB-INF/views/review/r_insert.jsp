<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기게시판등록</title>
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

		<!-- include summernote css/js-->
		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	</head>
	<body>
    	<header>header</header>
    	
    	<div class="container">
    		<div class="banner">배너</div>
    		<div class="main">
    			<h2>후기 등록</h2>
    			<hr>
    			<form action="/review/n_insert.do" method="post">
    				<ul>
    					<li>제목</li>
    					<li>
    						<input type="text" name="reviewTitle" style="width:400px;height:40px";>
    					</li>
    				</ul>
    				<ul>
    					<textarea name="content" id="summernote" value=""></textarea>
    				</ul>
    			</form>
    		</div>
    	</div>
    	
    	<footer>
    		<jsp:include page="/WEB-INF/views/include/footer/footer.jsp"></jsp:include>
    	</footer>
    	<script>
    		$(document).ready(function() {
    	     	$('#summernote').summernote({
    	             height: 300,                 // set editor height
    	             minHeight: null,             // set minimum height of editor
    	             maxHeight: null,             // set maximum height of editor
    	             focus: true                  // set focus to editable area after initializing summernote
    	     	});
    		});

    	</script>
    	<script>
    		$(document).ready(function() {
    		  	$('#summernote').summernote();
    		});
    	</script>
	</body>
</html>