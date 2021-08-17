<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/header.jsp" />

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<style>

/* 섹션1 */
.content {
	width: 90%;
	margin: auto;
	margin-top: 20px;
}

.board {
	width: 100%;
	height: 100px;
	font-size: 40px;
	color: #45aaff;
	line-height: 100px;
}

.line-height-normal {
	line-height: 20px;
}

#lookup {
	border: none;
	background-color: #4d61c4;
	color: white;
	margin: 0px 5px 0px 5px;
	height: 25px;
	width: 80px;
	border-radius: 5px;
}

.body-list {
	width: 100%;
	text-align: center;
}

.btn {
	background-color: #4161c8;
}
/* 페이지네이션 박스 */
.pagi-nation {
	width: 100%;
	height: 80px;
}

.pagination {
	justify-content: center;
}
</style>
</head>
<body>
	<c:set var="pageURL" value="boardList" />
	<c:set var="searchStr" value="${category }&st=${st}" />
	<div class="container">
		<div class="content">
			<div class="board" id="no-b">
				게시판 리스트
				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						조회</button>
					<div class="dropdown-menu line-height-normal">
						<a class="dropdown-item" href="${pageURL}">전체보기</a> 
						<a class="dropdown-item" href="${pageURL}?st=1">가게알바</a> 
						<a class="dropdown-item" href="${pageURL}?st=2">돌봄산책</a> 
						<a class="dropdown-item" href="${pageURL}?st=3">청소/심부름</a> 
						<a class="dropdown-item" href="${pageURL}?st=4">배달알바</a> 
						<a class="dropdown-item" href="${pageURL}?st=5">기타</a>
					</div>
				</div>
			</div>
			<!-- 목록리스트 시작 -->
			<div class="body-list" id="by-l">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">N0.</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">구이름</th>
							<th scope="col">포인트</th>
							<th scope="col">작성자</th>
							<th scope="col">상태</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>

					
							<c:forEach items="${boardList}" var="board">
								<c:set var="place" value="${fn:split(board.boardPlace, ',') }" />
								<c:set var="guPlace" value="${fn:split(place[1], ' ')}" />
							<tr>
									<%-- 넘버 --%>
									<th scope="row">${board.boardNo}</th>
									<%--카테고리 --%>
									<td>${board.categoryTitle}</td>
									<%-- 제목 --%>
									<td><a href="${board.boardNo}">${board.boardTitle}</a></td>
									<%-- 구이름(장소) --%>
									<td>${guPlace[1]}</td>


									<%--금액(페이) --%>
									<td>${board.boardPay}</td>
									<%--이름 --%>
									<td>${board.memberName}</td>
									<%--게시글상태 --%>
									<td>${board.boardStatus}</td>
									<%-- 작성일--%>
									<td>
										<fmt:formatDate var="createDate"
											value="${board.createDate}" pattern="yyyy-MM-dd" /> 
										<fmt:formatDate
											var="today" value="<%=new java.util.Date()%>"
											pattern="yyyy-MM-dd" /> 
										<c:choose>
											<c:when test="${createDate != today}">
												${createDate}
											</c:when>
	
											<c:otherwise>
												<fmt:formatDate value="${board.createDate}" pattern="HH:mm" />
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
		
					</tbody>
				</table>
			</div>
			<!-- 목록리스트 끝 -->
			<%---------------------- Pagination start----------------------%>

    	<c:set var="pageURL" value="boardList" />
		<c:set var="st" value="&st=${ param.st}" />
			<c:set var="prev"
				value="${pageURL}?cp=${pagination.prevPage}${st}" />
			<c:set var="next"
				value="${pageURL}?cp=${pagination.nextPage}${st}" />


			<div class="my-5">
				<ul class="pagination">

					<%-- 현재 페이지가 10페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > pagination.pageSize }">
						<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
					</c:if>

					<%-- 현재 페이지가 2페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > 2 }">
						<li><a class="page-link"
							href="${pageURL}?cp=${pagination.currentPage - 1}${st}">&lt;</a></li>
					</c:if>



					<%-- 페이지 목록 --%>
					<c:forEach var="p" begin="${pagination.startPage}"
						end="${pagination.endPage}">

						<c:choose>
							<c:when test="${p == pagination.currentPage }">
								<li class="page-item active"><a class="page-link">${p}</a></li>
							</c:when>

							<c:otherwise>
								<li><a class="page-link"
									href="${pageURL}?cp=${p}${st}">${p}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
					<c:if test="${pagination.currentPage < pagination.maxPage }">
						<li><a class="page-link"
							href="${pageURL}?cp=${pagination.currentPage + 1}${st}">&gt;</a></li>
					</c:if>

					<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
					<c:if
						test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
						<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
					</c:if>

				</ul>
			</div>
			<%---------------------- Pagination end----------------------%>

		</div>
	</div>
</body>
</html>
