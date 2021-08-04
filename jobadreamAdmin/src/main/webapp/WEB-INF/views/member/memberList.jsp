<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../common/header.jsp"/>


  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!--부트스트랩 -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />

    <!-- 제이쿼리주소 -->
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"
    ></script>

    <!-- 나눔스퀘어 폰트적용 -->
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css"
    />
    <style>
      div {
        box-sizing: border-box;
      }
      /* 섹션1 */
      .content {
        width: 90%;
        height: 830px;
        margin: auto;
        margin-top: 20px;
      }
      .member {
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
        <div class="member" id="mb">
          회원관리 리스트
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
              <a class="dropdown-item" href="#">전체회원</a>
              <a class="dropdown-item" href="#">가입회원</a>
              <a class="dropdown-item" href="#">정지회원</a>
              <a class="dropdown-item" href="#">탈퇴회원</a>
            </div>
          </div>
        </div>
        <!-- 목록리스트 시작 -->
        <div class="body-list" id="by-l">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">NO.</th>
                <th scope="col">아이디</th>
                <th scope="col">이름</th>
                <th scope="col">이메일</th>
                <th scope="col">가입일</th>
                <th scope="col">포인트</th>
                <th scope="col">회원상태</th>
                <th scope="col">상태변경</th>
              </tr>
            </thead>
            <tbody>
         <%--    <c:forEach items="${memberList}" var="member"> --%>
	              <tr>	<%-- 넘버 --%>
		                <td scope="row"> ${member.memberNo} </td>
		                
		                <%--아이디 --%>
		                <td>${member.memberId}</td>
		                <%-- 이름--%>
		                <td>${member.memberName}</td>
		                <%--이메일 --%>
		                <td>${member.memberEmail}</td>
		                <%-- 회원가입일--%>
		                <td>${member.enrollDate}</td>
		                <%--포인트 --%>
		                <td>${member.memberPoint}</td>
		                <%--회원상태 --%>
		                <td>${member.memberStatus}</td>
		                <%--상태변경--%>
		                <td><a href="#" class="btn btn-primary btn-sm" onclick="updteStatus(${member.memberNo}, this);">정지</a></td>

	              
	              
	              </tr>
        	<%-- </c:forEach> --%>
            </tbody>
          </table>
        </div>
        <!-- 목록리스트 끝 -->
     <%---------------------- Pagination start----------------------%>
			<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
			
			<c:set var="pageURL" value="list"  />
			
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
