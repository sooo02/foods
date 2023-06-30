<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Foods</title>
<!--공통적은 파일을 include 폴더에 넣어 두고 필요할 때마다 include로 연결해서 사용 -->
<%@ include file="./include/member_header.jsp"%>
<!-- 해당파일을 연결 -->
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- 처음 실행되는 화면  -->
		<!-- JSTL-if, foreach 등 자바명령어를 태그화 시켜놓은 형식 -->
		<!-- EL-전달받은 변수(값)을 쉽게 처리하는 형식 $ 대괄호안에 변수명을 기재 %=변수 대신-->
		<%@ include file="./include/member_menu.jsp"%>
		<!-- 해당파일을 연결 -->
		<!-- Header-->
		<header class="py-5">
			<div class="container">
				<div class="row gx-5 align-items-center">
					<div class="col-xxl-5">
						<!-- Header text content-->
						<div class="text-center text-xxl-start">
							<div class=" mb-4">
								<div class="text-uppercase">woori &middot; 진격의 아이(I)들
									&middot; 프로젝트</div>
							</div>
							<div class="fs-3 fw-light text-muted">AI를 통해 당신의 건강을 확인하세요</div>
							<h1 class="display-3 fw-bolder mb-5">
								<span class="d-inline">keep your health</span>
							</h1>
							<div
								class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xxl-start mb-3">
								<a
									class="btn btn-success btn-lg px-5 py-3 me-sm-3 fs-6 fw-bolder"
									href="${path}/aiFoods">Analysis</a> <a
									class="btn btn-outline-dark btn-lg px-5 py-3 fs-6 fw-bolder"
									href="${path}/customer/list">문의하기</a>
							</div>
						</div>
					</div>
					<div class="col-xxl-7">
						<!-- Header profile picture-->
						<div class="d-flex justify-content-center mt-5 mt-xxl-0">
							<div class="profile bg-gradient-primary-to-secondary">
								<!-- TIP: For best results, use a photo with a transparent background like the demo example below-->
								<!-- Watch a tutorial on how to do this on YouTube (link)-->
								<img class="profile-img" src="resources/assets/profile.png"
									alt="..." />
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<section>
			<!-- Skillset Card-->
			<div class="card shadow border-0 rounded-4 mb-5">
				<div class="card-body p-5">
					<!-- Professional skills list-->
					<div class="mb-5">
						<div class="d-flex align-items-center mb-4">
							<div
								class="feature bg-warning bg-gradient-primary-to-secondary text-white rounded-3 me-3">
								<i class="bi bi-tools"></i>
							</div>
							<h3 class="fw-bolder mb-0">
								<span class="d-inline">Professional Skills</span>
							</h3>
						</div>
						<div class="row row-cols-1 row-cols-md-3 mb-4">
							<div class="col mb-4 mb-md-0">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">SEO/SEM
									Marketing</div>
							</div>
							<div class="col mb-4 mb-md-0">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">Statistical
									Analysis</div>
							</div>
							<div class="col">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">Web
									Development</div>
							</div>
						</div>
						<div class="row row-cols-1 row-cols-md-3">
							<div class="col mb-4 mb-md-0">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">Network
									Security</div>
							</div>
							<div class="col mb-4 mb-md-0">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">Adobe
									Software Suite</div>
							</div>
							<div class="col">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">User
									Interface Design</div>
							</div>
						</div>
					</div>
					<!-- Languages list-->
					<div class="mb-0">
						<div class="d-flex align-items-center mb-4">
							<div
								class="feature bg-warning bg-gradient-primary-to-secondary text-white rounded-3 me-3">
								<i class="bi bi-code-slash"></i>
							</div>
							<h3 class="fw-bolder mb-0">
								<span class="d-inline">Languages</span>
							</h3>
						</div>
						<div class="row row-cols-1 row-cols-md-3 mb-4">
							<div class="col mb-4 mb-md-0">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">HTML</div>
							</div>
							<div class="col mb-4 mb-md-0">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">CSS</div>
							</div>
							<div class="col">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">JavaScript</div>
							</div>
						</div>
						<div class="row row-cols-1 row-cols-md-3">
							<div class="col mb-4 mb-md-0">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">Python</div>
							</div>
							<div class="col mb-4 mb-md-0">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">Ruby</div>
							</div>
							<div class="col">
								<div
									class="d-flex align-items-center bg-light rounded-4 p-3 h-100">Node.js</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
			<!-- About Section-->
	<section class="bg-warning py-5">
		<div class="container">
			<div class="justify-content-center">

					<div class="text-center">
						<h2 class="display-5 fw-bolder"><span class=" d-inline">About Me</span></h2>
						<p class="fw-bolder">My foods는 AI가 분석한 내 식단결과에 맞춰 신뢰도 높은 개인 맞춤형 분석 결과를 제공합니다. 
						<br>식단 &amp; 영양제 토탈 맞춤 관리! 내 몸에 맞게 영양제와 음식을 간편하게 한번에 관리해보세요.
                  <br>건강한 식단 &amp; 영양제 관리를 위한 모든것! 걱정없이, 쉽고 간편하게 마이푸드로 시작하세요.<br>
                  <br><span class="bg-dark text-light">본 홈페이지의 소유권은 진격의 아이(I)들팀에게 있으며 무단 도용, 복제를 금합니다.</span>
				<br>
				<br>
				<br>
				</div>
			</div>
		</div>
	</section>

		
		<%@ include file="./include/member_footer.jsp"%>
	</main>	
</body>
</html>