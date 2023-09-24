<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>배너 리스트</title>
    	<link rel="stylesheet" href="/resources/css/banner/bannerList.css">
    	<link rel="stylesheet" href="/resources/css/user/header.css">
    	<link rel="stylesheet" href="/resources/css/user/footer.css">
    	<link rel="stylesheet" href="/resources/css/reset.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	</head>
	<body>
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

		<div class="container">
			<div class="center">
				<div class="bannertitle">
					<span>배너 리스트</span>
				</div>
				<hr>
				<table class="bannertable">
				<colgroup>
				<col width="45px">
				<col width="70px">
				<col width="300px">
				<col width="270px">
				<col width="500px">
				</colgroup>
				<thead>
					<tr>
						<th>선택</th>
						<th>No</th>
						<th>배너명</th>
						<th>배너위치</th>
						<th>파일명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="banner" items="${bList }" varStatus="i">
						<tr>
							<td><input type="checkbox" id="" name="RowCheck" value="${banner.bannerNo }" ></td>
							<td>${i.count }</td>
							<td>${banner.bannerName }</td>
							<td>${banner.bannerArea }</td>
							<td>${banner.bannerFileName }</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
				<hr>
				<div class="paging">
					<div>
						<c:if test="${pInfo.startNavi != 1 }">
							<c:url var="prevUrl" value="/banner/bList.do">
								<c:param name="page" value="${bInfo.endNavi - 1 }"/>
							</c:url>
	            			<a href="${prevUrl }">[이전]</a>
		            		</c:if> 
		       			<c:forEach begin="${bInfo.startNavi }" end="${bInfo.endNavi }" var="p">
							<c:url var="pageUrl" value="/banner/bList.do">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
		            		<a href="${pageUrl }">${p }</a>&nbsp;
		       		 	</c:forEach>        
		           		<c:if test="${bInfo.endNavi != bInfo.naviTotalCount }">
							<c:url var="nextUrl" value="/banner/bList.do"> 
								<c:param name="page" value="${bInfo.endNavi + 1 }"></c:param>
							</c:url>
	            			<a href="${nextUrl }">[다음]</a>
	            		</c:if> 
					</div>
				</div>
				<div>
					<div>
						<button class="button" type="button" onclick="showRegisterBanner()" style="font-family: 'TheJamsil5Bold'; background-color: #FFFACD; color: black; border-color: black;">등록</button>
						<button class="button" type="button" onclick="deleteValue();" style="font-family: 'TheJamsil5Bold'; background-color: #FFFACD; color: black; border-color: black;">삭제</button>
					</div>
				</div>
			</div>
		</div>
		
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
			
			
		<script type="text/javascript">
		
			function showRegisterBanner(){
				location.href="/banner/insert.do"
			}
			
			 $(function(){
					var chkObj = document.getElementsByName("RowCheck");
					var rowCnt = chkObj.length;
					
					$("input[name='allCheck']").click(function(){
						var chk_listArr = $("input[name='RowCheck']");
						for (var i=0; i<chk_listArr.length; i++){
							chk_listArr[i].checked = this.checked;
						}
					});
					$("input[name='RowCheck']").click(function(){
						if($("input[name='RowCheck']:checked").length == rowCnt){
							$("input[name='allCheck']")[0].checked = true;
						}
						else{
							$("input[name='allCheck']")[0].checked = false;
						}
					});
				});
				function deleteValue(){
					var url = "/banner/delete.do";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
					var valueArr = new Array();
				    var list  = $("input[name='RowCheck']");
				    for(var i = 0; i < list .length; i++){
				        if(list [i].checked){ //선택되어 있으면 배열에 값을 저장함
				            valueArr.push(list[i].value);
				        }
				    }
				    if (valueArr.length == 0){
				    	alert("선택된 글이 없습니다.");
				    }
				    else{
						var chk = confirm("정말 삭제하시겠습니까?");				 
						$.ajax({
						    url : url,                    // 전송 URL
						    type : 'GET',                // GET or POST 방식
						    traditional : true,
						    data : {
						    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
						    },
			                success: function(jdata){
			                    if(jdata == valueArr.length) {
			                        alert("삭제 성공");
			                        location.replace("/banner/bList.do");
			                    }else{
			                        alert("삭제 실패");
			                    }
			                }
						});
					}
				}
				
		</script>
	</body>
</html>