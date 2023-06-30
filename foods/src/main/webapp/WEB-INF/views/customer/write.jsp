<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<Title>고객문의 등록</Title>
<!--공통적은 파일을 include 폴더에 넣어 두고 필요할 때마다 include로 연결해서 사용 -->
<%@ include file="../include/member_header.jsp"%>
<!-- 해당파일을 연결 -->
<script>
	$(document).ready(function() {
		$("#btnSave").click(function() { //var 들어오는 값에 따라 자동으로 데이터형이 변환
			var customerTitle = $("#customerTitle").val(); //제목의 내용을 저장
			var content = $("#customerContent").val(); //내용을 저장
			if (customerTitle == "") { //제목을 입력하지 않았으면
				alert("제목을 입력하세요."); //메세지 창
				document.form1.customerTitle.focus(); //위치로 이동
				return;
			}
			if (content == "") { //내용이 없으면
				alert("내용을 입력하세요");
				document.form1.customerContent.focus();
				return;
			}
			//제목과 내용이 존재하면
			document.form1.submit(); //폼을 전송
		}

		);

	});
</script>
</head>
<body>
	<!-- 처음 실행되는 화면  -->
	<!-- JSTL-if, foreach 등 자바명령어를 태그화 시켜놓은 형식 -->
	<!-- EL-전달받은 변수(값)을 쉽게 처리하는 형식 $ 대괄호안에 변수명을 기재 %=변수 대신-->
	<%@ include file="../include/member_menu.jsp"%>
	<!-- 해당파일을 연결 -->
	<!-- TODO: 로그인이 안된 상태에서 글쓰기 버튼을 누르면 메세지창 출력 후 로그인 이동 -->
	<%@ include file="../sessionCheck.jsp"%>
	<div class="container px-5 my-5">
		<div class="text-center mb-5">
			<h2 class="display-5 fw-bolder mb-0">
				<span class="text-gradient d-inline">게시글 등록</span>
			</h2>
		</div>
		<div class="row gx-5 justify-content-center">
			<div
				class="col-lg-11 col-xl-9 col-xxl-8 card shadow border-0 rounded-4 p-5">
				<!-- TODO: 입력폼 작업(스크립트에서 유효성 검사를 진행해서 전달) -->

				<form class="form-control" name="form1" method="post"
					action="${path}/customer/write">
					<div class="m-3 font-weight-bold">
						<span style="float: right;" class="fw-bolder">작성자 :
							${sessionScope.memberName}</span>
					</div>
					<div>
						<input type="hidden" name="customerWriter"
							value="${sessionScope.memberId}">
					</div>
					<div>
						<label for="comment" class="m-3">Title</label> <input
							name="customerTitle" id="customerTitle" class="form-control p-3"
							id="comment">
						<!-- customerVO를 참고해서 이름 지정 -->
					</div>
					<div>
						<label for="comment" class="m-3">Content </label>
						<textarea name="customerContent" id="customerContent" cols="80"
							rows="4" class="form-control p-3" id="comment"></textarea>
					</div>

					<div class="m-3">
						<button type="button" id="btnSave" class="btn btn-primary">확인</button>
						<button type="reset" class="btn btn-danger">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/member_footer.jsp"%>
</body>
</html>