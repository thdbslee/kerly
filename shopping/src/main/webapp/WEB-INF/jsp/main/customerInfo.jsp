<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/jsp/include/subTop.jsp" %> 

	<section class="shoping-cart spad">
		 <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div >
                     <form id="searchfrm" name="searchfrm" method="post">
                             	<select id="searchCondition" name="searchCondition">
                             		<option value="1">이름</option>
                             		<option value="2">아이디</option>
                             		<option value="3">번호</option>
                             	</select>
                                <input type="text" placeholder="검색명을 입력하세요" id="userSearch" name="searchKeyword">
                                <button type="button" onclick="fn_userSearch()" class="site-btn">검색</button>
                            	<button type="button" onclick="fn_list()" class="site-btn">전체보기</button>
                            </form>
	                    <form name="form">
							<input type="button" value="엑셀 다운로드" onclick="fn_goExcel()">
							
						
							<div class="row">
								<table class="type11">
									<thead>
										<tr>
											<th></th>
											<th>이름</th>
											<th>아이디</th>
											<th>주소</th>
											<th>번호</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${cusList}">
											<tr>
												<td><input type="checkbox" id="INX" name="INX" value="${list.INX}"></td>
												<td><input type="hidden" id="USER_NAME" name="USER_NAME" value="${list.USER_NAME}">${list.USER_NAME}</td>
												<td><input type="hidden" id="USER_ID" name="USER_ID" value="${list.USER_ID}">${list.USER_ID}</td>
												<td><input type="hidden" id="USER_ADDRESS" name="USER_ADDRESS" value="${list.USER_ADDRESS}">${list.USER_ADDRESS}</td>
												<td><input type="hidden" id="USER_PHONE" name="USER_PHONE" value="${list.USER_PHONE}">${list.USER_PHONE}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
								<div>
									<button type="button" onclick="fn_update()" class="site-btn">수정</button>
									<button type="button" onclick="fn_delete()" class="site-btn">삭제</button>
								</div>
								<div class="product__pagination"> <!-- pagination -->
						      		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page()" />				
		                   		</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- <script>
	function fn_goExcel(){
		
		document.frm.method="POST";
		document.frm.action="/exportToExcel.do";
		document.frm.submit();
	}
	
</script> -->
<style>
table.type11 { border-collapse: separate; border-spacing: 1px; text-align: center; line-height: 1.5; margin: 20px 10px;}
table.type11 th { width: 155px; padding: 10px; font-weight: bold; vertical-align: top; color: #fff; background: #ce4869 ;}
table.type11 td { width: 155px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; background: #eee;}

</style>
	</body>
	</html>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	<script type="text/javascript" src="/js/customer/customer.js" ></script>
	