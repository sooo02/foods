<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta charset="UTF-8">
<title>상품상세</title>
<!-- CSS에서 id(#), class(.) 사용 -->
<%@ include file="./include/member_header.jsp" %> <!-- 해당파일을 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
                  document.form1.action = "${path}/foods/update";
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
                     document.form1.action = "${path}/foods/delete";
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
<h2 style="text-align:center">상품 상세</h2>
<section class="w-100 p-3 d-flex justify-content-center pb-4">
<form name="form1" method="post" style="width: 22rem;"> <!-- member_list에서 member/write사용(get) -->
   <input type="hidden" name="foodsId" value="${dto.foodsId}">
   <div class="mb-3 mt-3">
      <label for="foodsImg"></label>
      <img src="/imgUpload/${dto.foodsImg}" alt="사진"  style="width: 100px; height: auto;" >
    </div>
    <div class="mb-3 mt-3">
      <label for="foodsName">상품명 :</label>
      <input type="text" class="form-control" id="foodsName" name="foodsName" value="${dto.foodsName}" readonly>
    </div>
    <div class="mb-3">
      <label for="cateCode">상품 카테고리 :</label>
      <input type="text" class="form-control" id="cateCode" name="cateCode" value="${dto.cateCode}">
    </div>
    <div class="mb-3 mt-3">
      <label for="foodsPrice">상품 가격 :</label>
      <input type="text" class="form-control" id="foodsPrice"name="foodsPrice" value="${dto.foodsPrice}">
    </div>
    <div class="mb-3">
      <label for="foodsDetail">상품소개 :</label>
      <input type="text" class="form-control" id="foodsDetail" name="foodsDetail" value="${dto.foodsDetail}">
    </div>
    <div class="mb-3">
      <label for="foodsReply">상품 평점 :</label>
      <input type="text" class="form-control" id="foodsReply" name="foodsReply" value="${dto.foodsReply}">
    </div>
     
    <div class="mb-3">
      <td>등록날짜</td>
         <td>
            <!-- 모양에 맞춰서 출력 -->
            <fmt:formatDate value="${dto.foodsRegDate}" pattern="yyyy-MM-dd"/>
         </td>
    </div>
    <tr>
         <td colspan="2"><input type="button" id="btnUpdate" class="btn btn-primary" value="수정">
            <input type="button" id="btnDelete" class="btn btn-danger" value="삭제">
            <div style="color:red">
               ${message}
            </div>
         </td>
         
   </tr>         
  </form>
  </section>
  </div>
<%@ include file="./include/member_footer.jsp"%>
</body>
</html>