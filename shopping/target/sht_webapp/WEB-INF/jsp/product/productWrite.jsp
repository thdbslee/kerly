<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/include/subTop.jsp" %>
   
  <section class="breadcrumb-section set-bg" data-setbg="/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Organi Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="/category/shop.do">shop</a>
                            <span>상품등록</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  			  <form id="form" name="form" method="post" enctype="multipart/form-data">
				<input type="hidden" id="USER_ID" name="USER_ID" value="${loginvo.USER_ID}">
		    	<table style="margin-left:auto; margin-right:auto;">
		    		<tr>
		    			<th>상품명</th>
		    			<td><input type="text" id="p_name" name="p_name" value=""></td>
		    		</tr>
		    		<tr>
		    		 	<th>상품가격</th>
		    		 	<td><input type="text" id="price" name="price" value=""></td>
		    		</tr>
		    		<tr>
		    		 	<th>상품카테고리</th>
		    			<td>
		    			<select name="category" id="category">
		    				<option value="">상품카테고리를 선택하세요</option>
		    				<c:forEach var="list" items="${menuList}">
		    					<option value="${list.INX}">${list.CATE_NAME}</option>
		    				</c:forEach>		
		    			</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>색상</th>
		    			<td>
		    				<select name="color" id="color">
		    					<option value="">색상을 선택하세요</option>
		    					<option value="white">White</option>
		    					<option value="gray">Gray</option>
		    					<option value="red">Red</option>
		    					<option value="black">Black</option>
		    					<option value="blue">Blue</option>
		    					<option value="green">Green</option>
		    				</select>	
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>크기</th>
		    			<td>
		    				<select name="p_size" id="p_size">
		    					<option value="">크기를 선택하세요</option>
		    					<option value="S">S</option>
		    					<option value="M">M</option>
		    					<option value="L">L</option>
		    				</select>
		    			</td>
		    		</tr>
		    	 	<tr> 
						<th>내용</th>
						<td><textarea rows="5" cols="8" name="content" id="content" style="width:500px;"></textarea>
					</tr> 
		 			<tr>
	                     <th>첨부파일</th>
	    	              <td id ="file_list">
	    	              <div id="fileDiv">
	    	              	<input  type="file" id="IMG1" name="IMG1">
	                         <a href="#this"  id="file_delete" name="file_delete">삭제</a>
	    	              </div> 
	                     </td>			 
                    </tr> 
 				<tr style="margin:0 auto;">
 					<th>
			  		<a href="javascript:fn_insert()" class="site-btn">등록</a>
		            <a href="/category/shop.do" class="site-btn">취소</a>  
		            </th>	
		    	</tr>
		    	</table>
	
		  
    			</form> 

    	    
    <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
     <script type="text/javascript" src="/js/egovframework/EgovMultiFile.js" ></script>
    <script type="text/javascript" src="/js/product/productInsert.js" ></script>
 </body>
 </html>