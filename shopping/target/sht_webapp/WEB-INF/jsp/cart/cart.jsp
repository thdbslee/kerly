<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/include/subTop.jsp" %>

<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>장바구니</h2>
                        <div class="breadcrumb__option">
                            <a href="/main.do">Home</a>
                            <span>장바구니</span>                            	
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
      <form id="form" name="form" method="post">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                    <%--   <form id="form" name="form" method="post"> --%>
                      	<input type="hidden" id="USER_ID" name="USER_ID" value="${loginvo.USER_ID}">
                      	<input type="hidden" id="TOTAL" name="TOTAL" value="${total}">
                      	<input type="hidden" id="fee" name="fee" value="${fee}">
             
                        <table>                 
                            <thead>
                                <tr>
                                	<th><input type="checkbox" id="all_chk"></th>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                    <th></th>
                                </tr>
                            </thead> 
                            <tbody id="codeTr1">
                            	<c:choose>
                            		<c:when test="${empty list }">
                            			<tr>
                            				<th colspan ="5">장바구니 내역이 없습니다.</th>
                            			</tr>
                            			<!-- <tr>
                            			   <th colspan ="4">장바구니 내역이 없습니다.</th>
                            			</tr> -->
                            		</c:when>
                            		<c:otherwise>
                            		
                            			<c:forEach var="list" items="${list}">

                            				<tr >
                            					<td><input type="checkbox"  id="INX_CHK" name="INX_CHK" value="${list.c_INX}"></td>
	                            				<td class="shoping__cart__item">
			                                      <img src="/upload/${list.IMG_1}" style="width:101px; height=100px;" >  
			                                        <h5><input type="hidden"  id="P_NAME" name="P_NAME" value="${list.p_name}">${list.p_name }</h5>
			                                    </td>
			                            		<td class="shoping__cart__price">
		                                       		<fmt:formatNumber pattern="###,###원" value="${list.PRICE}"/>
		                                       	</td> 
			                                     <td class="shoping__cart__quantity">
			                         		
			                         			<div class="quantity">
			                         			 <span class="test"><a href="#" id="plus" onclick=" fn_add('${list.AMOUNT}','${list.p_INX }')">
			                         			<input type="hidden" id="P_INX" name="P_INX" value="${list.p_INX }">
			                                          	<input type="hidden" id="test" value="${list.AMOUNT}">
			                                          +</a></span>
			                         			
			                                       		 <input type="text" value="${list.AMOUNT}" id="amount" name="AMOUNT"    style="text-align:center; width:50px;">
			                              
			                         			 <span class="test" id="minus" ><a href="javascript: fn_min('${list.AMOUNT}','${list.p_INX}')">-</a></span>
			                                        </div>
			                                        <div id="as"></div>			                                        
			                                    </td>
		                                      <td class="shoping__cart__total">
		                                      	<div id="total">
		                                      		<input type="hidden" id="SUM" name="SUM" value="${list.AMOUNT * list.PRICE}" style="text-align:center; width:100px;">		
		                                      		<fmt:formatNumber pattern='#,###,###원' value='${list.AMOUNT * list.PRICE}'/>                           
		                                      	</div>
		                                      </td>
			                                   
                            				</tr>
                            			</c:forEach>
                            		</c:otherwise>
                            	</c:choose> 
                            </tbody>
                             <td class="shoping__cart__item__close">
                             	<c:if test="${not empty list}">
                                 <button type="button" class="site-btn" style="width:200px;" onclick="fn_delete()">선택상품삭제</button>
                                </c:if>
                                <!--  <span class="icon_close"></span> -->
                             </td>
                      </table>
                    <%--    </form> --%>
                    </div>
                </div>
            </div>
             <div class="row">
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>총 구매 금액</h5>
                        <ul>
                        <c:choose>
                        	<c:when test ="${empty list}">
                        		<li>
                        			배송비<span>0원</span>
                        		</li>
                        		<li>
                        			총합계<span>0원</span>
                        		</li>
                        	</c:when>
                        	<c:otherwise>
	                        	 <li>배송비 
	                            	<span><fmt:formatNumber pattern="#,###원" value="${fee}"/></span>
	                            </li>
	                            <li>총 합계 
	                            	<span><fmt:formatNumber pattern="#,###,###원" value="${total}"/></span>
	                            </li>		
                        	</c:otherwise>
                        </c:choose>
                           
                        </ul>
                        <a href="#" onclick="fn_purchase()" class="primary-btn">결 제 하 기 </a>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </section> 
    <!-- Shoping Cart Section End -->
     <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	   <script type="text/javascript" src="/js/cart/cart.js" ></script>
 

</body>

</html>
<style>

	
</style>