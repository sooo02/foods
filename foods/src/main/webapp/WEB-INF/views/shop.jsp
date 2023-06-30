<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <title>영양제 목록</title>
      <%@ include file="./include/member_header.jsp"%>
    </head>
    
    <body>
    <%@ include file="./include/member_menu.jsp"%>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">영양제 추천</h1>
                    <p class="lead fw-normal text-white-50 mb-0">영양제 상품</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        
        <section class="py-5">
       
            <div class="container px-4 px-lg-5 mt-5">
             
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="row" items="${list}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/imgUpload/${row.foodsImg}"  alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <%-- <span class="star-point">${row.foodsName}</span> --%>
                                    <h4 class="fw-bolder">${row.foodsName}</h4>
                                    <!-- Product price-->
                                    <h5>${row.cateCode}</h5>
                                 <h6>평점 : ★${row.foodsReply}</h6>
                                </div>
                            </div>
                            
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${path}/shop/view?foodsId=${row.foodsId}">${row.foodsName} 상세 보기</a></div>
                               
                            </div>
                        </div>
                    </div>
               </c:forEach> 
            </div>
           </div>
        </section>
        
        <!-- Footer-->
        <%@ include file="./include/member_footer.jsp"%>
    </body>
</html>