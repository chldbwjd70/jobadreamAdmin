<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
        width: 1200px;
     
        margin: auto;
        margin-top: 20px;
      }
      .report {
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
        height: 650px;
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
    <div class="container">
      <div class="content">
        <div class="report" id="rp">
          신고
          <div class="btn-group">
            <nav aria-label="...">
              <ul class="pagination pagination-sm">
                <li class="page-item active" aria-current="page">
                  <span class="page-link">게시판</span>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">채팅</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">이용내역</a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- 목록리스트 시작 -->
        <div class="body-list" id="by-l">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">N0.</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">처리여부</th>
                <th scope="col">상세보기</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>부적절한글 신고합니다!!!</td>
                <td>최유정</td>
                <td>2021-07-24</td>
                <td>N</td>
                <td><a href="#" class="btn btn-primary btn-sm">상세보기</a></td>
              </tr>
           
            </tbody>
          </table>
        </div>
        <!-- 목록리스트 끝 -->
        <%---------------------- Pagination start----------------------%>
			<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>



			<c:set var="prev"
				value="${pageURL}?cp=${pagination.prevPage}${searchStr}" />
			<c:set var="next"
				value="${pageURL}?cp=${pagination.nextPage}${searchStr}" />


			<div class="my-5">
				<ul class="pagination">

					<%-- 현재 페이지가 10페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > pagination.pageSize }">
						<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
					</c:if>

					<%-- 현재 페이지가 2페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > 2 }">
						<li><a class="page-link"
							href="${pageURL}?cp=${pagination.currentPage - 1}${searchStr}">&lt;</a></li>
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
									href="${pageURL}?cp=${p}${searchStr}">${p}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
					<c:if test="${pagination.currentPage < pagination.maxPage }">
						<li><a class="page-link"
							href="${pageURL}?cp=${pagination.currentPage + 1}${searchStr}">&gt;</a></li>
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
