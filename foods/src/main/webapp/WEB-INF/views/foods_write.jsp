<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<!--공통적은 파일을 include 폴더에 넣어 두고 필요할 때마다 include로 연결해서 사용 -->
<%@ include file="./include/member_header.jsp" %> <!-- 해당파일을 연결 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
  .form_section {
    margin-bottom: 20px;
  }
   .btn_section img { margin:20px 0;}
   
  .btn_section {
    margin-top: 20px;
  } #foodsImg {
    margin-top: 20px;
  }

</style>

</head>

<body>
<!-- 처음 실행되는 화면  -->
<!-- JSTL-if, foreach 등 자바명령어를 태그화 시켜놓은 형식 -->
<!-- EL-전달받은 변수(값)을 쉽게 처리하는 형식 $ 대괄호안에 변수명을 기재 %=변수 대신-->
<%@ include file="./include/member_menu.jsp" %> <!-- 해당파일을 연결 -->
<div class="container px-5 my-5">
<h2 style="text-align:center">상품 등록</h2>
<section class="w-100 p-3 d-flex justify-content-center pb-4">
 <div class="mb-3 mt-3">
  <form name="form1" method="post" action="fileupload" autocomplete="off" enctype="multipart/form-data" style="width: 22rem;">
    <div class="mb-3 mt-3">
      <label for="foodsName">상품명 :</label>
      <input type="text" class="form-control" id="foodsName" placeholder="" name="foodsName">
    </div>
    <div class="mb-3">
      <label for="cateCode">상품 카테고리 :</label>
      <input type="text" class="form-control" id="cateCode" placeholder="" name="cateCode">
    </div>
    <div class="mb-3 mt-3">
      <label for="foodsPrice">상품 가격 :</label>
      <input type="text" class="form-control" id="foodsPrice" placeholder="" name="foodsPrice">
    </div>
    <div class="mb-3">
      <label for="foodsDetail">상품 설명 :</label>
      <input type="text" class="form-control" id="foodsDetail" placeholder="" name="foodsDetail">
    </div>
    
    <div class="mb-3">
      <label for="foodsReply">상품 평점 :</label>
      <input type="text" class="form-control" id="foodsReply" placeholder="" name="foodsReply">
    </div>
     <span class ="btn_section">
       <button type="submit" class="btn btn-primary" >상품 등록</button>
    </span>
       <div class="mb-3">
      <input type="file" id="foodsImg" name="file" onchange="setThumbnail(event);">
          </div>
          
        <div id="image_container">
       </div>
          <script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>
       
  </form>
</div>
</section>
</div>
<%@ include file="./include/member_footer.jsp"%>
</body>
</html>