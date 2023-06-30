<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<Title>고객문의 게시판</Title>
<!--공통적은 파일을 include 폴더에 넣어 두고 필요할 때마다 include로 연결해서 사용 background-image: url(../resources/assets/cu_top.png);-->
<%@ include file="../include/member_header.jsp"%>
<!-- 해당파일을 연결 -->
<script>
	$("document").ready(function() { //버튼을 눌렀는지 확인
		$("#btnWrite").click(function() {
			location.href = "${path}/customer/write"; //해당페이지로 이동
		}); //클릭했을 때
	}

	);
	function list(page) {
		location.href = "${path}/customer/list.do?curPage=" + page
				+ "&searchOption-${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>
</head>
<body>
	<!-- 처음 실행되는 화면  -->
	<!-- JSTL-if, foreach 등 자바명령어를 태그화 시켜놓은 형식 -->
	<!-- EL-전달받은 변수(값)을 쉽게 처리하는 형식 $ 대괄호안에 변수명을 기재 %=변수 대신-->
	<%@ include file="../include/member_menu.jsp"%>
	<!-- 해당파일을 연결 -->
	<div class="container px-5 my-5">
	<div class="justify-content-center">
				<div class="mb-5">
					<h1 style="text-align:center"><span>고객문의 게시판</span></h1>
				</div>

				<!-- TODO: 검색기능을 추가 -->
				<!-- TODO: 글쓰기 버튼(스크립트를 통해서 customer/write 연결) -->
				<button type="button" id="btnWrite" style="float: left;"
					class="btn btn-warning">글쓰기</button>
				<form name="form1" method="post" action="${path}/customer/list"
					style="float: right;">
					<select name="searchOption" class="form-select form-select-sm">
						<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
						<option value="all"
							<c:out value="${map.searchOption == 'all'?'selected':''}"/>>제목+이름+제목</option>
						<option value="memberName"
							<c:out value="${map.searchOption == 'memberName'?'selected':''}"/>>이름</option>
						<option value="customerContent"
							<c:out value="${map.searchOption == 'customerContent'?'selected':''}"/>>내용</option>
						<option value="customerTitle"
							<c:out value="${map.searchOption == 'customerTitle'?'selected':''}"/>>제목</option>
					</select> <input name="keyword" value="${map.keyword}"> <input
						type="submit" value="검색" class="btn btn-dark">
				</form>
				<!-- TODO: 게시물 목록 -->
				<table border="1" class="table table-striped px-5 my-5">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>회원ID</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="row" items="${map.list }">
						<!-- 조회한 내용을 출력 -->
						<tr>
							<td>${row.customerNo }</td>
							<!-- var에 선언한 변수와 customerVO에 변수를 조합해서 -->

							<!-- 추가 : 로그인 상세페이지 이동가능, 비로그인시 목록확인 -->
							<!-- 제목옆에 () 조회수를 추가 -->
							<c:choose>
								<c:when test="${sessionScope.memberId==null }">
									<td>${row.customerTitle }</td>
									<!-- 제목을 클릭하면 상세페이지로 이동 -->
								</c:when>
								<c:otherwise>

									<td><a
										href="${path}/customer/view?customerNo=${row.customerNo}">${row.customerTitle }</a></td>
									<!-- 제목을 클릭하면 상세페이지로 이동 -->
								</c:otherwise>
							</c:choose>
							<td>${row.customerWriter }</td>
							<td><fmt:formatDate value="${row.customerRegdate}"
									pattern="yyyy-MM-dd" /></td>
							<td>${row.customerCnt }</td>
						</tr>
					</c:forEach>
					<!-- TODO : 게시물 페이징 처리 -->
					<tr>
						<td colspan="5">
							<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> <c:if
								test="${map.customerPager.curBlock > 1}">
								<a href="javascript:list('1')">[처음]</a>
							</c:if> <!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> <c:if
								test="${map.customerPager.curBlock > 1}">
								<a href="javascript:list('${map.customerPager.prevPage}')">[이전]</a>
							</c:if> <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 --> <c:forEach var="num"
								begin="${map.customerPager.blockBegin}"
								end="${map.customerPager.blockEnd}">
								<!-- 현재페이지이면 하이퍼링크 제거 -->
								<c:choose>
									<c:when test="${num == map.customerPager.curPage}">
										<span style="color: red">${num}</span>&nbsp;
                        </c:when>
									<c:otherwise>
										<a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
								</c:choose>
							</c:forEach> <!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
							<c:if
								test="${map.customerPager.curBlock <= map.customerPager.totBlock}">
								<a href="javascript:list('${map.customerPager.nextPage}')">[다음]</a>
							</c:if> <!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 --> <c:if
								test="${map.customerPager.curPage <= map.customerPager.totPage}">
								<a href="javascript:list('${map.customerPager.totPage}')">[끝]</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
	</div>

	<%@ include file="../include/member_footer.jsp"%>
</body>
</html>