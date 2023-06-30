<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<%@ include file="./include/member_header.jsp" %> <!-- 해당파일을 연결 -->
</head>
<!-- 해당파일을 연결 -->
<script>
   $("document").ready(function() { //버튼을 눌렀는지 확인
      $("#btnWrite").click(function() {
         location.href = "${path}/foods/write"; //해당페이지로 이동
      }); //클릭했을 때
   }

   );
   function list(page) {
      location.href = "${path}/foods/list.do?curPage=" + page
            + "&searchOption-${map.searchOption}"
            + "&keyword=${map.keyword}";
   }
</script>
<body>
<%@ include file="./include/member_menu.jsp" %> <!-- 해당파일을 연결 -->
<!-- 회원 테이블 목록 -->
<div class="container px-5 my-5">
<div class="justify-content-center">
            <div class="mb-5">
<h2 style="text-align: center">상품 목록</h2>
<!-- 버튼을 클릭하면 member/write get으로 연결 -->
<div class="container px-5 my-5">


<input type="submit" class="btn btn-primary" value="상품등록" onclick="location.href='${path}/foods/write'">
<p></p>
<table  border="1" class="table table-bordered" style="width: 100%;">
         <thead>
            <tr> <!-- 행 -->
               <th style="width: 20%;">상품 이미지</th>
               <th style="width: 30%;">상품명</th>
               <th style="width: 15%;">카테고리 이름</th>
               <th style="width: 10%;">상품 가격</th>
               <th style="width: 20%;">상품 설명</th>
               <th style="width: 10%;">평점</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="row" items="${list }">
               <c:choose>
                  <c:when test="${sessionScope.admin=='1'}">
                     <tr> <!-- 반복적으로 회원정보를 출력하는 부분 -->
                        <%-- <td>${row.foodsName}</td>  --%>  <!-- memberId는 필드명, vo에서 선언한 변수명 -->
                        <td><img src="/imgUpload/${row.foodsImg}"  alt="..." /></td>
                        <td><a href="${path}/foods/view?foodsId=${row.foodsId}">${row.foodsName }</a></td> <!-- 이름을 클릭시 상세페이지로 이동, EL은 변수값을 출력 -->
                        <td>${row.cateCode }</td> 
                        <td>${row.foodsPrice }</td>
                        <td><details>
                      <summary>상세보기</summary>
                       <p> ${row.foodsDetail }</p>
                     </details>
                     <button class="btnShowDetail" style="display: none;">상세보기</button>
                       </td>
                       
                        <td>★${row.foodsReply }</td>
                     </tr>
                     </c:when>

               </c:choose>
            </c:forEach>
                     <!-- TODO : 게시물 페이징 처리 -->
                     
                  
         </tbody>
      </table>
      </div>
   </div>
   </div>
   </div>
<%@ include file="./include/member_footer.jsp"%>
</body>
<script>
    $("document").ready(function() {
        $("summary").click(function() {
            $(this).hide(); // 상세보기 버튼 숨기기
            $(this).siblings(".hidden-btn").show(); // 숨겨진 상세보기 버튼 보이기
        });

        $(".hidden-btn").click(function() {
            $(this).hide(); // 숨겨진 상세보기 버튼 숨기기
            $(this).siblings("summary").show(); // 상세보기 버튼 보이기
        });
    });
</script>
</html>