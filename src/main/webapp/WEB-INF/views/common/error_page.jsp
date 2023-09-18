<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>서비스 실패</title>
	</head>
	<body>
		${ error }
		<script>
			const result = "${ msg }";
			const urt = "${ url }";
			alert(result);
		</script>
	</body>
</html>