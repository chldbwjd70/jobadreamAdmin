<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Document</title>
        <!--부트스트랩 -->

        <style>
  
     
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
          		<form>
                    <div class="qanda">
                        <div id="qa-1">답변</div>
                        <input type="text" id="replyContent" placeholder="내용을 입력하세요">
                    </div>
                </form>
                <div class="end">
                   <button class="btn btn-primary" id="addReply" onclick="addReply();">답변등록</button>
                    <a href="adminQuestions.html" class="btn btn-danger">이전으로</a>
                </div>
            </div>
       
        
        <!-- 댓글 출력 부분 -->
	<div class="replyList mt-5 pt-2">
		<ul id="replyListArea">
			<c:forEach items="${rList}" var="reply">
				<li class="reply-row">
					<div>
						<p class="rDate">작성일 : <fmt:formatDate value="${reply.qusetionsCommentDt}" pattern="yyyy년 MM월 dd일 HH:mm"/></p>
					</div>
										<%-- 댓글 테스트1--%>
					<p class="rContent">${reply.replyContent }</p>
					
					
					<c:if test="${reply.memberNo == loginMember.memberNo}">
						<div class="replyBtnArea">
							<button class="btn btn-primary btn-sm ml-1" id="updateReply" onclick="showUpdateReply(${reply.qusetionsNo}, this)">수정</button>
							<button class="btn btn-primary btn-sm ml-1" id="deleteReply" onclick="deleteReply(${reply.qusetionsNo})">삭제</button>
						</div>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</div>

        <script>
     // 로그인한 회원의 회원 번호, 비로그인 시 "" (빈문자열)
        const loginMemberNo = "${loginMember.memberNo}";

        // 현재 게시글 번호 ,두개있어야 댓글가능 ""안쓴이유:
        const qusetionsNo = ${qusetions.qusetionsNo};
        selectReplyList();
        
     // 댓글 등록 , ajax 사용
        function addReply()	{
        	
        	// 작성된 댓글 내용 얻어오기
        	const replyContent = $("#replyContent").val();
        	//로그인이 되어있지않은 경우
        	if(loginMemberNo ==""){
        		swl("로그인 후 이용해주세요.");
        		
        	}else{
        		if(replyContent.trim()== ""){//작성된 댓글이 없을 경우
        			swal("댓글 작성후 클릭해 주세요.");
        		
        		}else{
        		
        			//로그인0.댓글작성0
        			
        			//ajax 만들어진거라 변경안되지만 쓰기가 쉽다.
        			$.ajax({
        				//필수 속성   /semi/
        				url : "${contextPath}/reply/insertReply",
        				type : "POST",
        				data : {"memberNo" : loginMemberNo,
        					"qusetionsNo" : qusetionsNo,
        					"qusetionsCommentContent" : replyContent}, //키벨류 형태
        			success : function(result){
        				if(result > 0){ // 댓글 삽입 성공
        					swal({"icon" : "success" , "title" : "댓글 등록 성공"});
        					$("#replyContent").val(""); // 댓글 작성 내용 삭제
        					selectReplyList(); // 비동기로 댓글 목록 갱신한것
        				}
        			},  
        			
        			error : function(){
        				console.log("댓글 삽입 실패");
        				
        			}
        			});	
        			
        		}
        		
        	}
        	
        	
        	
        	
        }	
        	


        //-----------------------------------------------------------------------------------------
        //해당 게시글 댓글 목록 조회
        function selectReplyList(){
         				/*/fin */
        	$.ajax({
        	  url : "${contextPath}/reply/list",
        	  data : {"qusetionsNo" : qusetionsNo}, // 오른쪽 변수명
        	  type : "POST",
        	  dataType : "JSON", //응답되는 데이터의 형식이 JSON임을 알랴줌-->자바스크립트로변환됨
        	  success : function(rList){
        		  console.log(rList);
        		  
        	        $("#replyListArea").html(""); // 기존 정보 초기화
        	        //왜? 새로 읽어온 댓글 목록으로 다시 만들어서 출력하려고.
        	        
        	        $.each(rList, function(index, item){
        	           	//$.each() : jQuery와 반복문
        	           	//
        	           	//index : 순차접근시 현재 택텍스트
        	           	//item : 순차 접근시 현재 접근한 배열 요소(댓글객체하나)
        	       	 
        	       	 //console.log(rList[i]);
        	        	
        	           
        	           
        	           var li = $("<li>").addClass("reply-row");
        	        
        	           // 작성자, 작성일, 수정일 영역 
        	           var div = $("<div>");
        	           var rWriter = $("<p>").addClass("rWriter").text(item.memberName);
        	           var rDate = $("<p>").addClass("rDate").text("작성일 : " + item.qusetionsCommentDt);
        	           div.append(rWriter).append(rDate)
        	           
        	           
        	           // 댓글 내용
        	           var rContent = $("<p>").addClass("rContent").html(item.qusetionsCommentContent);
        	           
        	           
        	           // 대댓글, 수정, 삭제 버튼 영역
        	           var replyBtnArea = $("<div>").addClass("replyBtnArea");
        	           
        	           // 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
        	           if(item.memberNo == loginMemberNo){
        	              
        	              // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 
        	              var showUpdate = $("<button>").addClass("btn btn-primary btn-sm ml-1").text("수정").attr("onclick", "showUpdateReply("+item.qusetionsCommentNo+", this)");
        	              var deleteReply = $("<button>").addClass("btn btn-primary btn-sm ml-1").text("삭제").attr("onclick", "deleteReply("+item.qusetionsCommentNo+")");
        	              
        	              replyBtnArea.append(showUpdate).append(deleteReply);
        	           }
        	           
        	           
        	           // 댓글 요소 하나로 합치기
        	           li.append(div).append(rContent).append(replyBtnArea);
        	           
        	           
        	           // 합쳐진 댓글을 화면에 배치
        	           $("#replyListArea").append(li);
        	        });
        		  
        		  
        	  },
        	  error : function(){
        		  console.log("댓글 목록 조회 실패");
        	  }
        	  
        	});
        }
//-----------------------------------------------
// 댓글 수정 폼

function showUpdateReply(qusetionsCommentNo, el){
	if($(".replyUpdateContent").length>0){
		$(".replyUpdateContent").eq(0).parent().html(beforReplyRow);
	} 
	
//댓글 수정화면 출력 전 요소를 저장해둠.
//취소버튼 
	beforeReplyRow = $(el).parent().parent().html();
	
	   // 작성되어있던 내용(수정 전 댓글 내용) 
	   var beforeContent = $(el).parent().prev().html();
	
	
	
	   // 이전 댓글 내용의 크로스사이트 스크립트 처리 해제, 개행문자 변경
	   // -> 자바스크립트에는 replaceAll() 메소드가 없으므로 정규 표현식을 이용하여 변경
	   beforeContent = beforeContent.replace(/&amp;/g, "&");   
	   beforeContent = beforeContent.replace(/&lt;/g, "<");   
	   beforeContent = beforeContent.replace(/&gt;/g, ">");   
	   beforeContent = beforeContent.replace(/&quot;/g, "\"");   
	   
	   beforeContent = beforeContent.replace(/<br>/g, "\n");   
	   
	   
	   // 기존 댓글 영역을 삭제하고 textarea를 추가 
	   $(el).parent().prev().remove();
	   var textarea = $("<textarea>").addClass("replyUpdateContent").attr("rows", "3").val(beforeContent);
	   $(el).parent().before(textarea);
	   
	   
	   // 수정 버튼
	   var updateReply = $("<button>").addClass("btn btn-primary btn-sm ml-1 mb-4").text("댓글 수정").attr("onclick", "updateReply(" + qusetionsCommentNo + ", this)");
	   
	   // 취소 버튼
	   var cancelBtn = $("<button>").addClass("btn btn-primary btn-sm ml-1 mb-4").text("취소").attr("onclick", "updateCancel(this)");
	   
	   var replyBtnArea = $(el).parent();
	   
	   $(replyBtnArea).empty(); 
	   $(replyBtnArea).append(updateReply); 
	   $(replyBtnArea).append(cancelBtn); 
	
}

//-----------------------------------------------------------------------------------------
//댓글 수정 취소 시 원래대로 돌아가기
function updateCancel(el){
	$(el).parent().parent().html(beforeReplyRow);
}


//-----------------------------------------------------------------------------------------
// 댓글 수정
function updateReply(qusetionsCommentNo, el){
	//수저된 댓글내용
	const qusetionsCommentContent = $(el).parent().prev().val();
	
	$.ajax({
		url : "${contextPath}/reply/updateReply" ,
		type : "POST",
		data : {"qusetionsCommentNo" : qusetionsCommentNo,
			"qusetionsCommentContent" : qusetionsCommentContent},
		success : function(result){
			
			if(result > 0){
				swal({"icon" : "success" , "title" : "댓글 수정 성공"});
				selectReplyList();
			}
			
			
		},
		error : function(){
			console.log("댓글 수정 실패");
		}
	});
}


//-----------------------------------------------------------------------------------------
//댓글 삭제
function deleteReply(qusetionsCommentNo){
	   if(confirm("정말로 삭제하시겠습니까?")){
		      var url = "${contextPath}/reply/deleteReply";
		      
		      $.ajax({
		         url : url,
		         data : {"qusetionsCommentNo" : qusetionsCommentNo},
		         success : function(result){
		            if(result > 0){
		               selectReplyList(qusetionsNo);
		               
		               swal({"icon" : "success" , "title" : "댓글 삭제 성공"});
		            }
		            
		         }, error : function(){
		            console.log("ajax 통신 실패");
		         }
		      });
		   }
}        
        
        
        </script>
        
        
        
        
        
        
    </body>
</html>