<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<body class="d-flex flex-column h-100">
<div style="text-align: center;">
	<!-- 구역나누기, 그룹나누기, 부분적인 작업공간을 나눌때 -->
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-success py-3">
		<div class="container px-5">
			<a class="navbar-brand" href="${path}/"><span class="fw-bolder">My foods</span></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-bolder">
					<li class="nav-item"><a class="nav-link text-white" href="${path}/">Home</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="${path}/shop">SHOP</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="${path}/food/list">AI식단분석</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="${path}/customer/list">고객문의</a></li>
				</ul>
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-bolder">
					<c:choose>
						<c:when test="${sessionScope.memberId == null}">
							<!-- 섹션에 아이디가 없으면 로그인이 안된상태 if-->
							<li class="nav-item"><a class="nav-link text-white" href="${path}/login">로그인</a></li>
							<li class="nav-item"><a class="nav-link text-white" href="${path}/member/write">회원가입</a></li>
						</c:when>
						<c:when test="${sessionScope.admin== 1}">
							<!-- admin으로 로그인했을때-->
							<li class="nav-item"><span class="nav-link text-white">관리자 로그인중입니다.</span></li>
							<li class="nav-item"><a class="nav-link text-white" href="${path}/loginout">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link text-white" href="${path}/member/list">회원관리</a></li>
							<!-- localhost:8080/member/list로 접속 -->
							<li class="nav-item"><a class="nav-link text-white" href="${path}/foods/list">상품관리</a></li>
						</c:when>
						<c:otherwise>
							<!-- 일반회원 로그인이 된 상태 else-->
							<li class="nav-item"><span class="nav-link">${sessionScope.memberId}회원님이 로그인중입니다.</span></li>
							<li class="nav-item"><a class="nav-link text-white" href="${path}/member/list">Mypage</a></li>
							<li class="nav-item"><a class="nav-link text-white" href="${path}/loginout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</div>
</body>

