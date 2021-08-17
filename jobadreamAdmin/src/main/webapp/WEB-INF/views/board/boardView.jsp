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
<title>게시판 상세조회</title>

<style>

/* 섹션1 */
.content {
	width: 1000px;
	height: 700px;
	margin: auto;
	margin-top: 80px;
}
/* 게시판상세조회 박스 */
.boardView {
	width: 100%;
	height: 100px;
	font-size: 40px;
	color: #45aaff;
	line-height: 100px;
}

.onetitle {
	width: 100%;
	height: 50px;
	position: relative;
}
/* 신고 말머리 */
.one-t1 {
	width: 20%;
	height: 100%;
	margin-right: 10px;
	float: left;
	line-height: 40px;
	font-size: 20px;
	border: 1px solid gainsboro;
}
/* 제목 */
.one-t2 {
	width: 78%;
	height: 100%;
	float: right;
	line-height: 40px;
	font-size: 20px;
	border: 1px solid gainsboro;
}
/* 구,금액,시간,아이디,작성일 박스 */
.twotitle {
	margin-top: 20px;
	width: 100%;
	height: 50px;
}
/* 구,금액,시간,아이디,작성일 내용 */
.two-t1 {
	width: 20%;
	height: 100%;
	float: left;
	text-align: center;
	line-height: 40px;
	font-size: 18px;
	border: 1px solid gainsboro;
}
/* 내용 박스*/
.viewContents {
	margin-top: 20px;
	width: 100%;
	height: 400px;
	border: 1px solid gainsboro;
}
/* 버튼 */
.end {
	margin-top: 10px;
	float: right;
}
</style>
</head>
<body>

		<div class="content">
			<div class="boardView">게시판 상세조회</div>
			<div class="onetitle">
				<%--카테고리 --%>
				<div class="one-t1">${board.categoryTitle}</div>
				<%-- 제목 --%>
				<div class="one-t2">${board.boardTitle}</div>
			</div>
			<div class="twotitle">
								<c:set var="place" value="${fn:split(board.boardPlace, ',') }" />
								<c:set var="guPlace" value="${fn:split(place[1], ' ')}" />
					
				<%-- 구 이름 --%>
				<div class="two-t1" id="t-t1">${guPlace[1]}</div>
					
				<%-- 페이--%>
				<div class="two-t1" id="t-t2">금액 :${board.boardPay}</div>
				<%-- 시간--%>
				<div class="two-t1" id="t-t3">시간 :${board.boardTime}</div>
				<%-- 아이디 --%>
				<div class="two-t1" id="t-t4">아이디 :${board.memberName}</div>
				<%-- 작성일 --%>
				<div class="two-t1" id="t-t5">
					<fmt:formatDate var="createDate" value="${board.createDate}"
						pattern="yyyy-MM-dd" />
					<fmt:formatDate var="today" value="<%=new java.util.Date()%>"
						pattern="yyyy-MM-dd" />
					<c:choose>
						<c:when test="${createDate != today}">
												${createDate}
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${board.createDate}" pattern="HH:mm" />
						</c:otherwise>
					</c:choose>
						
				</div>
				
			</div>
		
			<div class="viewContents">${board.boardContent}</div>
			<div class="end">
				<a href="javascript:history.back();" class="btn btn-primary">목록으로</a>
				<a href="#" onclick="deleteBoard(${board.boardNo})"  class="btn btn-danger">삭제</a>
				 <br><br><br>
			</div>
		</div>
<script>
function deleteBoard(boardNo){
    if(confirm("정말로 삭제하시겠습니까?")){
          var url = "${contextPath}/board/deleteBoard";
          
          $.ajax({
             url : url,
             data : {"boardNo" : boardNo},
             type : "post",
             success : function(result){
            	 location = document.referrer;
             }, error : function(){
                console.log("ajax 통신 실패");
             }
          });
       }
}  


</script>


	
</body>
</html>
