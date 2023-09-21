<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="profile-box">
	<div class="profile">
	
		<!-- 프로필 사진 등록 전 -->
		<c:if test="${ profile.profileImgRename eq null }">
			<div class="mypage-profile" id="image-preview">
				<img class="mypage-profile-img" src="../resources/images/logo.png" alt="로고">
			</div>
		</c:if>
		
		<!-- 프로필 사진 -->
		<c:if test="${ profile.profileImgRename ne null }">
			<div class="mypage-profile" id="image-preview">
				<img class="mypage-profile-img" src="../resources/puploadFiles/${profile.profileImgRename }" alt="프로필">
			</div>
		</c:if>
		
		<!-- 프로필 텍스트 -->
		<form name="profileForm" action="/profile/upload.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pUserId" value="${ userId }">
			<div class="mypage-profile-area">
				<span class="mypage-profile-text">환영합니다!</span><br><br>
				<span class="mypage-profile-text">${ user.userNickname }님</span>
				
				<!-- 프로필 변경 버튼 -->
				<input type="file" id="profile-image" name="profile-image" accept="image/*" style="display: none;">
				<label for="profile-image" class="profile-img-change">프로필 이미지 설정 ></label>
			</div>
		</form>
	</div>
</div>
 