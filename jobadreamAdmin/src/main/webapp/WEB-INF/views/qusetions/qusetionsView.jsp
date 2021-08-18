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
<title>1:1문의 상세조회</title>

<style>

/* 섹션1 */
.content {
	width: 1000px;
	margin: 80px auto auto;
}
/* 게시판상세조회 박스 */
.oneView {
	width: 100%;
	height: 100px;
	font-size: 40px;
	color: #45aaff;
	line-height: 100px;
}
/* 제목박스 */
.onetitle1 {
	width: 100%;
	height: 50px;
	position: relative;
	border: 1px solid gainsboro;
}
/* 제목 글 */
.one-tt {
	width: 17%;
	text-align: center;
	height: 50px;
	margin-right: 10px;
	float: left;
	line-height: 40px;
	font-size: 20px;
}

/* 작성자 작성일 */
.twotitle1 {
	width: 100%;
	height: 50px;
	border: 1px solid gainsboro;
}
/*작성자 작성일 글*/
.two-t6 {
	width: 14%;
	height: 50px;
	float: left;
	text-align: center;
	line-height: 40px;
	font-size: 18px;
}
/* 작성자 ,작성일 글 */
.two-t7 {
	width: 80%;
	height: 50px;
	float: left;
	line-height: 40px;
	font-size: 18px;
}
/* 내용 박스*/
.viewContents {
	margin-top: 70px;
	width: 100%;
	height: 300px;
	border: 1px solid gainsboro;
	word-wrap: break-word;
}

#area {
	min-width: 50%;
}
/* 답변박스 */
.qanda {
	width: 100%;
	height: 150px;
}
/* 답변입력창 */
#qanaatext {
	width: 100%;
	height: 80px;
	margin-top: 15px;
}

#qa-1 {
	line-height: 50px;
	font-size: 16px;
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
		<div class="oneView">1:1문의 상세조회</div>
		<div class="onetitle1">
		<%-- 제목 --%>
			<div class="one-tt">${qusetions.qusetionsTitle}</div>
		</div>
		<div class="twotitle1">
			<%-- --%>
			<div class="two-t6" id="t-t6">작성자 : ${qusetions.memberId}</div>
			<%-- --%>
			<div class="two-t7" id="t-t7">작성일 : ${qusetions.qusetionsDt}</div>
			<%-- --%>
			<div class="viewContents">${qusetions.qusetionsContent}</div>
		<jsp:include page="../qusetions/Reply.jsp"/>
		</div>
	</div>
</body>
</html>
