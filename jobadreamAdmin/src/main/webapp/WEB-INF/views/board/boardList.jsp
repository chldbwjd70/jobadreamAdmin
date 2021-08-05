<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
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
  <c:set var="pageURL" value="memberList"  />
<c:set var="searchStr" value="${category }&st=${st}"  />
    <div class="container">
      <div class="content">
        <div class="board" id="no-b">
          게시판 리스트
          <div class="btn-group">
            <button
              type="button"
              class="btn btn-primary dropdown-toggle"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              조회
            </button>
            <div class="dropdown-menu line-height-normal">
              <a class="dropdown-item" href="${pageURL}">전체보기</a>
              <a class="dropdown-item" href=""${pageURL}?st=1">가게알바</a>
              <a class="dropdown-item" href=""${pageURL}?st=2">돌봄산책</a>
              <a class="dropdown-item" href=""${pageURL}?st=3">청소/심부름</a>
              <a class="dropdown-item" href=""${pageURL}?st=4">배달알바</a>
              <a class="dropdown-item" href=""${pageURL}?st=5">기타</a>
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
                <th scope="col">금액</th>
                <th scope="col">작성자</th>
                <th scope="col">상태</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${boardList}" var="board">
              <tr> <%-- 넘버 --%>
                <th scope="row"> ${board.boardNo}</th>
                <%--카테고리 --%>
                <td>${board.categoryCode}</td>
                <%-- 제목 --%>
                <td><a href="#">${board.boardTitle}</a></td>
                <%-- 구이름(장소) --%>
                <td>${board.boardPlace}</td>
                <%--금액(페이) --%>
                <td>${board.boardPay}</td>
                <%--이름 --%>
                <td>${board.memberName}</td>
                <%--게시글상태 --%>
                <td>${board.boardStatus}</td>
                <%-- 작성일--%>
                <td>${board.createDate}</td>
              </tr>
         	</c:forEach>
            </tbody>
          </table>
        </div>
        <!-- 목록리스트 끝 -->
       <%---------------------- Pagination start----------------------%>
			<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
			

			
			<c:set var="prev" value="${pageURL}?cp=${pagination.prevPage}${searchStr}" />
			<c:set var="next" value="${pageURL}?cp=${pagination.nextPage}${searchStr}" />
			
			
			<div class="my-5">
				<ul class="pagination">
				
					<%-- 현재 페이지가 10페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > pagination.pageSize }">
						<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
					</c:if>
					
					<%-- 현재 페이지가 2페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > 2 }">
						<li><a class="page-link" href="${pageURL}?cp=${pagination.currentPage - 1}${searchStr}">&lt;</a></li>
					</c:if>
					
					
				
					<%-- 페이지 목록 --%>
					<c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
						
							<c:choose>
								<c:when test="${p == pagination.currentPage }">
									<li class="page-item active"><a class="page-link">${p}</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a class="page-link" href="${pageURL}?cp=${p}${searchStr}">${p}</a></li>
								</c:otherwise>
							</c:choose>						
					</c:forEach>
					
					<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
					<c:if test="${pagination.currentPage < pagination.maxPage }">
						<li><a class="page-link" href="${pageURL}?cp=${pagination.currentPage + 1}${searchStr}">&gt;</a></li>
					</c:if>
					
					<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
					<c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
						<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
					</c:if>

				</ul>
			</div>
			<%---------------------- Pagination end----------------------%>
		
      </div>
    </div>
  </body>
</html>
