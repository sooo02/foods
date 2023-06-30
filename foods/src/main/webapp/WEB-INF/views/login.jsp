<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원등록</title>
<%@ include file="./include/member_header.jsp" %> <!-- 해당파일을 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$("document").ready(
		function(){
			$("#btnLogin").click(
				function(){					
					var memberId = $("#memberId").val(); //id가 memberId인 태그의 value값을 읽어온다.
					var memberPw = $("#memberPw").val();
					
					if(memberId == ""){ //null 값이 없는 상태, "" 내용이 비어 있는 상태
						alert("아이디를 입력하세요.");
						$("#memberId").focus(); //focus는 해당태그로 커서를 이동
						return; //이후작업 생략하고 종료
					}
					if(memberPw == ""){
						alert("비밀번호를 입력하세요.");
						$("#memberPw").focus();
						return;
					}
					document.form1.action = "${path}/loginCheck";
					document.form1.submit(); //action이 있으면 submit 동작
					
				}		
			);
			
		}		
	);
</script>
</head>
<body>
<%@ include file="./include/member_menu.jsp" %> <!-- 해당파일을 연결 -->
<div class="container px-5 my-5">
  <h2 style="text-align:center">로그인</h2>
  <section class="w-100 p-3 d-flex justify-content-center pb-4">

  <form name="form1" method="post" action="${path}/loginCheck"  style="width: 22rem;">
    <div class="mb-3 mt-3">
      <label for="memberId">아이디:</label>
      <input type="text" class="form-control" id="memberId" placeholder="Enter Id" name="memberId" width="400px">
    </div>
    <div class="mb-3">
      <label for="memberPw">패스워드:</label>
      <input type="password" class="form-control" id="memberPw" placeholder="Enter password" name="memberPw" width="400px">
    </div>
     <div class="form-check mb-3">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox" name="remember"> Remember me
    </label>
  </div>
    <button type="submit" class="btn btn-primary">로그인</button>
  </form>
  </section>
</div>

		<%@ include file="./include/member_footer.jsp"%>
</body>
</html>