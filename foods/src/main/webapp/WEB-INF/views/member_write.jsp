<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원등록</title>
<!--공통적은 파일을 include 폴더에 넣어 두고 필요할 때마다 include로 연결해서 사용 -->
<%@ include file="./include/member_header.jsp" %> <!-- 해당파일을 연결 -->

</head>
<body>
<!-- 처음 실행되는 화면  -->
<!-- JSTL-if, foreach 등 자바명령어를 태그화 시켜놓은 형식 -->
<!-- EL-전달받은 변수(값)을 쉽게 처리하는 형식 $ 대괄호안에 변수명을 기재 %=변수 대신-->
<%@ include file="./include/member_menu.jsp" %> <!-- 해당파일을 연결 -->
<div class="container px-5 my-5">
<h2 style="text-align:center">회원가입</h2>
<section class="w-100 p-3 d-flex justify-content-center pb-4">
  <div class="mb-3 mt-3">
  <form name="form1" method="post" action="${path}/member/write" style="width: 22rem;">
    <div class="mb-3 mt-3">
      <label for="memberId">아이디:</label>
      <input type="text" class="form-control" id="memberId" placeholder="Enter Id" name="memberId">
    </div>
    <div class="mb-3">
      <label for="memberPw">패스워드:</label>
      <input type="text" class="form-control" id="memberPw" placeholder="Enter password" name="memberPw">
    </div>
    <div class="mb-3 mt-3">
      <label for="memberName">이름:</label>
      <input type="text" class="form-control" id="memberName" placeholder="Enter name" name="memberName">
    </div>
    <div class="mb-3">
      <label for="memberEmail">이메일:</label>
      <input type="text" class="form-control" id="memberEmail" placeholder="Enter email" name="memberEmail">
    </div>
    <button type="submit" class="btn btn-primary">회원가입</button>
  </form>
</div>
</section>
</div>
<%@ include file="./include/member_footer.jsp"%>
</body>
</html>