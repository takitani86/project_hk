<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>

<body class="layout-boxed skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Main Header(네비게이션 바) -->
		<%@ include file="../include/main_header.jsp"%>

		<!-- Left Column(사이드바) -->
		<%@ include file="../include/left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Page Header <small>Optional description</small>
				</h1>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

		<h1>상품관리</h1>
<div id="page">
					<form action="muldelProduct.do" method="post">
						<table border="1">
							<col width="10px">
							<col width="35px">
							<col width="90px">
							<col width="200px">
							<col width="60px">
							<col width="150px">
							<col width="70px">
							<col width="70px">
							<col width="70px">
							<col width="70px">
							<tr>
								<th></th>
								<th style="text-align: center;" onclick="sortNo(1)">번호</th>
								<th style="text-align: center;" onclick="sortNo(2)">상품이름</th>
								<th style="text-align: center;">이미지</th>
								<th style="text-align: center;" onclick="sortNo(3)">가격</th>
								<th style="text-align: center;">설명</th>
								<th style="text-align: center;" onclick="sortNo(4)">카테고리번호</th>
								<th style="text-align: center;" onclick="sortNo(5)">메인여부</th>
								<th style="text-align: center;" onclick="sortNo(6)">메뉴판번호</th>
								<th style="text-align: center;" onclick="sortNo(0)">수정일</th>
							</tr>
							<c:choose>
								<c:when test="${empty list}">
									<!-- request에 담은 list트가 비어있으면 이것을 실행 -->
									<tr>
										<td colspan="10">-----등록된 상품이 없습니다....-----
									</tr>
								</c:when>
								<c:otherwise>
									<!-- else면 이것을 실행 -->
									<c:forEach items="${list}" var="dto">
										<tr>
											<td><input type="checkbox" name="seqs"
												value="${dto.pro_seq}" /></td>
											<td><a href="productUpdate.do?seq=${dto.pro_seq}">${dto.pro_seq}</a></td>
											<td>${dto.pro_name}</td>
											<td><img
												src="${pageContext.request.contextPath}/resources/img/product/${dto.pro_image}"
												width=200 height=200 /></td>
											<td>${dto.pro_price}</td>
											<td>${dto.pro_desc}</td>
											<td>${dto.cat_seq}</td>
											<td>${dto.pro_option}</td>
											<td>${dto.pro_menu}</td>
											<td><fmt:formatDate value="${dto.pro_regdate}"
													pattern="yyyy-mm-dd" /></td>
											<!--날짜 보기 편한 포맷으로 변경해줌 주의사항) val에 date타입이어야함-->
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
						<div style="text-align: center;">
							<c:forEach begin="1" end="${getPcount}" step="1" var="i">
								<a href="productList.do?countProductPage=${i}&sort=${sort}"
									style="text-decoration: none;">${i}</a>
							</c:forEach>
						</div>
					</form>
					<div style="text-align:left;">
					<input type="button" value="상품추가"
						onclick="location.href='insertProductForm.do'" /> <input
						type="submit" value="상품삭제" />
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../include/main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- JS 스크립트모음 -->
	<%@ include file="../include/plugin_js.jsp"%>

	<script type="text/javascript">

// //체크박스 올체크 펑션
// function allSel(bool){
// 	var chks=document.getElementsByName("chk"); 
// 	for(var i =0;i<chks.length;i++){
// 		chks[i].checked=bool;
// 	}
// }

function sortNo(num){
	var nums=num;
	var page =<%=(String)session.getAttribute("countProductPageSession")%>;
	location.href="productList.do?countProductPage="+page+"&sort="+nums;
}

</script>

</body>
<style>
#page{text-align:center;}
</style>
</html>