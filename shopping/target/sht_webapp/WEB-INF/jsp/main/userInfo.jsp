<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/include/subTop.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<section class="shoping-cart spad">
		 <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div >
						<form id="form" name="form" method="post">
						  <input type="hidden" id="USER_ID" name="USER_ID" value="${loginvo.USER_ID }">
							<table>
								<tr>
								<th>이름</th>
								<td>
									<input type="text" id="USER_NAME" name="USER_NAME" value="${loginvo.USER_NAME}">
								</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td>
									<span>${loginvo.USER_ID}</span>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>
									<input type="password" id="USER_PASSWD" name="USER_PASSWD" >
								</td> 
							</tr>
							<tr>
								<th>번   호</th>
								<td><input type="text" id="USER_PHONE" name="USER_PHONE" value="${loginvo.USER_PHONE}"></td>
							</tr>
							<tr>
								<th>주  소</th>
								<td>
									
								    <input id="ADR" name="ADR" type="text"  readonly onclick="findAddr()" value="${loginvo.ADR}">						
									<input type="text" id="DEADR" name="DEADR"  placeholder="상세주소 입력하세요" value="${loginvo.DEADR}" >
									<input type="hidden" id="USER_ADDRESS" name="USER_ADDRESS" >
								</td>
							</tr>
							</table>
							 <a href="#" onclick="fn_edit()" class="primary-btn">변 경 하 기</a>
							 <a href="/main.do" class="primary-btn">목 록</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function(){
			
		});
		function fn_edit(){
			var a1 = $("#ADR").val();
			var a2 = $("#DEADR").val(); 
			$("#USER_ADDRESS").val(a1 + a2);
			alert("주소 ->"+$("#USER_ADDRESS").val());
			
			if(!$("#USER_PASSWD").val()){
				alert("비밀번호를 입력하세요");
			}
			
			  $.ajax({
				contentType :"application/x-www-form-urlencoded;charset=UTF-8",
				type :"POST",
				url  :"/userInfoUpdate_ok.do",
				data :$("#form").serialize(),
				success : function(data){
					if(data=="true"){
						alert("정보 변경 완료");
						window.location.href="/main.do";
					}else if(data=="false"){
						alert("정보변경 실패");
					}
					else{
						alert("비밀번호가 일치하지 않습니다." 
							 +"비밀번호를 확인하세요" );
					}
				},
				error:function(request,error){
					alert("request->"+request+",error ->"+error);
				}
			});  
		}
		function findAddr(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        			        	
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var roadAddr = data.roadAddress; // 도로명 주소 변수
		            var jibunAddr = data.jibunAddress; // 지번 주소 변수
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		          /*   document.getElementById('member_post').value = data.zonecode; */
		            if(roadAddr !== ''){
		                document.getElementById("A1").value = roadAddr;
		            } 
		            else if(jibunAddr !== ''){
		                document.getElementById("A1").value = jibunAddr;
		            }
		        }
		    }).open();
		}
	</script>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>
	
