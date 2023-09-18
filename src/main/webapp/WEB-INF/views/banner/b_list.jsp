<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>배너 리스트</title>
	<link rel="stylesheet" href="/resources/css/admin/bannerList.css">
	</head>
	<body>
<app-container>
        <app-panel>
            <!-- <app-logo>header</app-logo> -->
            <app-class>HEADER</app-class>
            <!-- <app-user>First LastName</app-user> -->
        </app-panel>
        

        <!-- <header>
            <h1>Header Title</h1>
            <small>Header Subtitle</small>
        </header> -->

        <app-panel>
            <h2>BANNER LIST <span id="visibleCount">발도장 로고</span><span id="nonVisibleCount"></span></h2>
        
            <list-item>
            <list-cell><input type="checkbox" id="tableHeader01" name="table-header" value="1"></list-cell>
            <list-cell>선택</list-cell>
            <list-cell>배너명</list-cell>
            <list-cell>배너위치</list-cell>
            <list-cell>파일명</list-cell>
<!--             <list-cell>Email</list-cell> -->
            </list-item>
            <panel-list id="myList">
            <c:forEach var="banner" items="${bList }" varStatus="i">
            		<list-item data-co="1" data-id="1" class="active">
                        <list-cell><input type="checkbox" id="" name="table-row" value=""></list-cell>
                        <list-cell>${i.count }</list-cell>
                        <list-cell>${banner.bannerName }</list-cell>
                        <list-cell>${banner.bannerArea }</list-cell>
                        <list-cell>${banner.bannerFileName }</list-cell>
<!--                         <list-cell>Sincere@april.biz</list-cell> -->
                    </list-item>
               </c:forEach>
                    </panel-list>

        
        
                <div class="paging" style="margin-left: 430px; margin-top: 25px;">
                    <a href="/banner/insert.do" class="btn btn-prev" style="width: 80px;">등록</a>
                    <a href="#" class="btn btn-next" style="width: 80px;">삭제</a>
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


            <!-- <app-panel-scroll>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
            </app-panel-scroll> -->
            <panel-arrow>
            <panel-corner-top-left></panel-corner-top-left>
            <panel-corner-top-right></panel-corner-top-right>
            <panel-corner-bottom-left></panel-corner-bottom-left>
            <panel-corner-bottom-right></panel-corner-bottom-right>
            </panel-arrow>
        </app-panel>

        
        
        <app-panel>
            <!-- <app-logo>header</app-logo> -->
            <app-class>FOOTER</app-class>
            <!-- <app-user>First LastName</app-user> -->
        </app-panel>
        <!-- <app-panel>
            <app-author>footer</app-author>
            <app-class>center</app-class>
            <app-version>v0.001</app-version>
        </app-panel> -->
        </app-container>

        <script>
            /* init */
    var notiRowEl = '.notice-list > tbody > tr';
    var pageBtnEl = '.paging .btn';
    var noticeTotal = $(notiRowEl).length;
    var showRow = 10;
    var lastIdx = 1;
    
    if (noticeTotal > 0) {
        $(notiRowEl).each(function(i){
            $(this).children('.no').html(noticeTotal - i);
        });
        $(pageBtnEl).not('.btn-prev, .btn-next').eq(0).addClass('active');
        $(pageBtnEl + '.btn-prev').addClass('disabled');
    }
    if (noticeTotal > showRow) {
        var pagingCount = Math.ceil(noticeTotal / showRow);
        for (var i = 2; i <= pagingCount; i++) {
            $(pageBtnEl + '.btn-next').before('<a href="javascript:;" class="btn">' + i + '</a>');
            lastIdx = i;
        }
        $(notiRowEl).hide();
        $(notiRowEl + ':hidden').slice(0, showRow).show();
    } else {
        $(pageBtnEl + '.btn-next').addClass('disabled');
    }
    
    /* page button click event */
    $(document).on('click', pageBtnEl, function(){
        var thisIdx = $(this).index();
        var activeIdx = $(pageBtnEl + '.active').index();
        var thisClass = $(this).attr('class').replace(/ /g, '').replace('btn', '').replace('active', '').replace('disabled', '');
        $(pageBtnEl).removeClass('active');
        if (thisClass === '') {
            listShow(thisIdx);
        } else {
            if (thisClass === 'btn-prev') {
                if (activeIdx > 1) {
                    listShow(activeIdx - 1);
                } else {
                    $(pageBtnEl).eq(activeIdx).addClass('active');
                }
            }
            if (thisClass === 'btn-next') {
                if (activeIdx < lastIdx) {
                    listShow(activeIdx + 1);
                } else {
                    $(pageBtnEl).eq(activeIdx).addClass('active');
                }
            }
        }
    });
    var listShow = function(idx){
        $(pageBtnEl).eq(idx).addClass('active');
        $(notiRowEl).hide();
        $(notiRowEl + ':hidden').slice((idx - 1) * 10, showRow * idx).show();
        $(pageBtnEl).removeClass('disabled');
        if (idx === lastIdx) $(pageBtnEl + '.btn-next').addClass('disabled');
        if (idx === 1) $(pageBtnEl + '.btn-prev').addClass('disabled');
    };
        </script>	
	</body>
</html>