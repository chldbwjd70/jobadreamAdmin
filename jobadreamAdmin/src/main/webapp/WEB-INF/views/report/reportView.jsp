<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
        width: 1200px;
       
        margin: 80px auto auto;
      }
      /* 상세조회 박스 */
      .reportView {
        width: 100%;
        height: 100px;
        font-size: 40px;
        color: #45aaff;
        line-height: 100px;
      }
      .onesession {
        width: 100%;
        height: 50px;
        position: relative;
      }
      /* 신고 말머리 */
      .ss-t1 {
        width: 20%;
        height: 100%;
        margin-right: 10px;
        float: left;
        line-height: 40px;
        font-size: 20px;
        border: 1px solid gainsboro;
      }
      /* 제목 */
      .ss-t2 {
        width: 78%;
        height: 100%;
        float: right;
        line-height: 40px;
        font-size: 20px;
        border: 1px solid gainsboro;
      }
      /* 구,금액,시간,아이디,작성일 박스 */
      .twosession {
        margin-top: 20px;
        width: 100%;
        height: 50px;
        border: 1px solid gainsboro;
      }
      /*작성자 작성일 글*/
      .twosession-t1 {
        width: 18%;
        height: 50px;
        float: left;
        text-align: center;
        line-height: 40px;
        font-size: 18px;
      }
      /* 작성자 ,작성일 글 */
      .twosession-t2 {
        width: 80%;
        height: 50px;
        float: left;

        line-height: 40px;
        font-size: 18px;
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
    <div class="container">
      <div class="content">
        <div class="reportView">신고</div>
        <div class="onesession">
          <div class="ss-t1">게시판</div>

          <div class="ss-t2">부적절한 글 신고합니다..</div>
        </div>
        <div class="twosession">
          <div class="twosession-t1" id="two-t1">작성자 : 최유정</div>
          <div class="twosession-t2" id="two-t2">작성일 : 2021-07-24</div>
        </div>
        <div class="viewContents">
          <img src="" />
          부적절한 글 신고합니다....
        </div>
        <div class="end">
          <a href="adminDeclaration.htmll" class="btn btn-danger">신고확인</a>
          <a href="adminDeclaration.html" class="btn btn-primary">이전으로</a>
        </div>
      </div>
    </div>
  </body>
</html>
