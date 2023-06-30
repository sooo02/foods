<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원등록</title>
<!-- CSS에서 id(#), class(.) 사용 -->
<%@ include file="./include/member_header.jsp" %> <!-- 해당파일을 연결 -->
<!-- 스크립트(Javascript-DOM, ajax, json) -->
<script>
	//현재 문서의 정보를 수집
	$("document").ready(		
		function() { //메소드 생성
			//btnUpdate id를 가지고 있는 버튼을 클릭했을 때
			$("#btnUpdate").click(					
				function(){
					//제약조건(대화상자-예(참,true),아니오(거짓,false))
					if(confirm("수정하시겠습니까?")) {
						//메세지창 alert("aa") - if ~ else ~ 사용할 때 정확한 처리위치 확인
						//문서에 form1 id에 action을 지정
						document.form1.action = "${path}/member/update";
						//form1 id를 submit 처리
						document.form1.submit();
					}
				}
			
			);
		}	
	);
	$("document").ready(		
			function() { //메소드 생성
				//btnUpdate id를 가지고 있는 버튼을 클릭했을 때
				$("#btnDelete").click(					
					function(){
						if(confirm("삭제하시겠습니까?")) {
							//메세지창 alert("aa") - if ~ else ~ 사용할 때 정확한 처리위치 확인
							//문서에 form1 id에 action을 지정
							document.form1.action = "${path}/member/delete";
							//form1 id를 submit 처리
							document.form1.submit();
						}
					}
				
				);
			}	
		);	
</script>

</head>
<body>

<%@ include file="./include/member_menu.jsp" %> <!-- 해당파일을 연결 -->
<div class="container px-5 my-5">
<h2 style="text-align:center">회원정보 수정, 탈퇴</h2>
<section class="w-100 p-3 d-flex justify-content-center pb-4">
<form name="form1" method="post" style="width: 22rem;"> <!-- member_list에서 member/write사용(get) -->
    <div class="mb-3 mt-3">
      <label for="memberId">아이디:</label>
      <input type="text" class="form-control" id="memberId" placeholder="Enter Id" name="memberId" value="${dto.memberId}" readonly>
    </div>
    <div class="mb-3">
      <label for="memberPw">패스워드:</label>
      <input type="text" class="form-control" id="memberPw" placeholder="Enter password" name="memberPw" value="${dto.memberPw}">
    </div>
    <div class="mb-3 mt-3">
      <label for="memberName">이름:</label>
      <input type="text" class="form-control" id="memberName" placeholder="Enter name" name="memberName" value="${dto.memberName}">
    </div>
    <div class="mb-3">
      <label for="memberEmail">이메일:</label>
      <input type="text" class="form-control" id="memberEmail" placeholder="Enter email" name="memberEmail" value="${dto.memberEmail}">
    </div>
    <div class="mb-3">
      <td>가입날짜</td>
			<td>
				<!-- 모양에 맞춰서 출력 -->
				<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/>
			</td>
    </div>
    <tr>
			<td colspan="2"><input type="button" id="btnUpdate" class="btn btn-primary" value="수정">
				<input type="button" id="btnDelete" class="btn btn-danger" value="탈퇴">
				<div style="color:red">
					${message}
				</div>
			</td>
			
	</tr>			
  </form>
  </section>
  </div>
</div>
</div>
</div>
		<%@ include file="./include/member_footer.jsp"%>
</body>
</html>