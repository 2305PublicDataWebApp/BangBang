<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>배너 리스트</title>
	<link rel="stylesheet" href="/resources/css/banner/bannerList.css">
	<link rel='stylesheet' href='/resources/css/banner/b_header.css'>
	<link rel="stylesheet" href="/resources/css/user/footer.css">
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>

	</head>
<body>
	<!-- header -->
    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    
    
   <main class="b_main">
    <app-container>
      <app-panel>
          <img class="banner-img" src="/resources/images/main/dirud.png" class="d-block w-100" alt="벚꽃" 
          style="width: 100%; height: 250px; height: 33.5%;">
      </app-panel>
    
      <app-panel>
         <h2>BANNER LIST <span id="visibleCount">발도장 로고</span><span id="nonVisibleCount"></span></h2>
      
         <list-item>
	         <list-cell><input type="checkbox" id="tableHeader01" name="RowCheck" value="${bannerNo }"></list-cell>
	         <list-cell>선택</list-cell>
	         <list-cell>배너명</list-cell>
	         <list-cell>배너위치</list-cell>
	         <list-cell>파일명</list-cell>
         </list-item>
           
         <panel-list id="myList">
         	<c:forEach var="banner" items="${bList }" varStatus="i">
       			<list-item data-co="1" data-id="1" class="active">
                     <list-cell><input type="checkbox" id="" name="RowCheck" value="${banner.bannerNo }"></list-cell>
                     <list-cell>${i.count }</list-cell>
                     <list-cell>${banner.bannerName }</list-cell>
                     <list-cell>${banner.bannerArea }</list-cell>
                     <list-cell>${banner.bannerFileName }</list-cell>
                </list-item>
            </c:forEach>
       	 </panel-list>

         <div class="paging" style="margin-left: 360px; margin-top: 25px;">
           <a href="/banner/insert.do" class="btn btn-prev" style="width: 80px;">등록</a>
           <a href="#" class="btn btn-next" onclick="deleteValue();"  style="width: 80px;">삭제</a>
         </div>



         <div class="paging">
         	<c:if test="${pInfo.startNavi != 1 }">
				<c:url var="prevUrl" value="/banner/bList.do">
					<c:param name="page" value=""></c:param>
				</c:url>
             	<a href="${prevUrl }" class="btn btn-prev">PREV</a>
             </c:if>
             
	       	<c:forEach begin="${bInfo.startNavi }" end="${bInfo.endNavi }" var="p">
				<c:url var="pageUrl" value="/banner/bList.do">
					<c:param name="page" value="${p }"></c:param>
				</c:url>
	            <a href="${pageUrl }" class="btn active">${p }</a>&nbsp;
	        </c:forEach>
             
            <c:if test="${bInfo.endNavi != bInfo.naviTotalCount }">
				<c:url var="nextUrl" value="/banner/bList.do"> 
					<c:param name="page" value="${bInfo.endNavi + 1 }"></c:param>
				</c:url>
             	<a href="${nextUrl }:;" class="btn btn-next">NEXT</a>
             </c:if>  
         </div>

          <panel-arrow>
	          <panel-corner-top-left></panel-corner-top-left>
	          <panel-corner-top-right></panel-corner-top-right>
	          <panel-corner-bottom-left></panel-corner-bottom-left>
	          <panel-corner-bottom-right></panel-corner-bottom-right>
          </panel-arrow>
	      </app-panel>
	  
	      <app-panel>
            <img class="banner-img" src="/resources/images/main/dirud.png" class="d-block w-100" alt="벚꽃" 
          style="width: 100%; height: 250px; height: 33.5%;">
       </app-panel>
  	</app-container>
   </main>
   
   <!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>	
	

 <script type="text/javascript">

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