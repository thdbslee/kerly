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
                            <span>상품수정</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

  			  <form id="form" name="form" method="post" enctype="multipart/form-data">
  			  <input type="hidden" id="posblAtchFileNumber" >
  			  <input type="hidden" id="INX" name="INX" value="${shopvo.INX}">
  			  <input type="hidden" id="USER_ID" name="USER_ID" value="${loginvo.USER_ID}">
		    	<table style="margin-left:auto; margin-right:auto;">
		    		<tr>
		    			<th>상품명</th>
		    			<td><input type="text" id="p_name" name="p_name" value="${shopvo.p_name }" ></td>
		    		</tr>
		    		<tr>
		    		 	<th>상품가격</th>
		    		 	<td><input type="text" id="price" name="price" value="${shopvo.price }"></td>
		    		</tr>
		    		<tr>
		    		 	<th>상품카테고리</th>
		    			<td>
		    			<input type="hidden" id="test1" value="${shopvo.category}">
		    			<input type="hidden" id="test2" value="${shopvo.color}">
		    			<select name="category" id="category" >
		    				<option value="">상품카테고리를 선택하세요</option>
		    				<option value="1" ${shopvo.category eq '과일' ? 'selected' : '' }>과일</option>
		    				<option value="2" ${shopvo.category eq '채소' ? 'selected' : '' }>채소</option>
		    				<option value="3" ${shopvo.category eq '정육/계란' ? 'selected' : ''}>정육/계란</option>
		    				<option value="4" ${shopvo.category eq '수산/건어물' ? 'selected' :'' }>수산/건어물</option>
		    			</select>
		    		</tr>
		    		<tr>
		    			<th>색상</th>
		    			<td>
		    			<select name="color" id="color">
		    				<option value="">색상을 선택하세요</option>
		    				<option value="white"${shopvo.color eq 'white' ? 'selected' : '' }>11White</option>
		    				<option value="yellow"${shopvo.color eq 'yellow' ? 'selected' : '' }>Gray</option>
		    				<option value="red" ${shopvo.color eq 'red' ? 'selected' : '' }>Red</option>
		    				<option value="black" ${shopvo.color eq 'black' ? 'selected' : '' }>Black</option>
		    				<option value="blue" ${shopvo.color eq 'blue' ? 'selected' : '' }>Blue</option>
		    				<option value="green"${shopvo.color eq 'green' ?'selected' : ''}>Green</option>
		    			</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>크기 </th>
		    			<td>
		    				<select name="p_size" id="p_size">
		    					<option value="">크기를 선택하세요</option>
		    					<option value="S"${shopvo.p_size eq 'S' ? 'selected' : ''}>S</option>
		    					<option value="M"${shopvo.p_size eq 'M' ? 'selected' : '' }>M</option>
		    					<option value="L"${shopvo.p_size eq 'L' ? 'selected' : '' }>L</option>
		    				</select>
		    			</td>
		    		</tr>
		    	 	<tr> 
						<th>내용</th>
						<td><textarea rows="5" cols="8" name="content" id="content" style="width:500px;" >${shopvo.content }</textarea>
					</tr> 
		 
	                     <th>첨부파일</th>
	                   
	                     <td>
	                     <span>
							<input type="file" id="IMG1" name="IMG1" onchange="javascript:document.getElementById('fileName').value = this.value" >
		                  </span>
		                <!--   class="btn btn-default btn-file" -->
		         		     <!--     onchange="javascript:document.getElementById('fileName').value = this.value" -->
		                    <%-- <input type="text" id="fileName"  name="fileName" value="${shopvo.IMG_1 }"/>  --%>
		                    
		                    
	                     </td>
	                 	 
						 <div id="egovComFileList"></div>
							
                    </tr> 
 				<tr style="margin:0 auto;">
 					<th>
			  		<a href="javascript:fn_edit()" class="site-btn">수정</a>
		            <a href="/category/shop.do" class="site-btn">취소</a>  
		            </th>	
		    	</tr>
		    	</table>
	
		  
    			</form> 
    			
    	       
 <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
 
 
    <style>
        .btn-file{
            position: relative;
            overflow: hidden;
        }
        .btn-file input[type=file] {
            position: absolute;
            top: 0;
                right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }
    </style>




    <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
     <script type="text/javascript" src="/js/egovframework/EgovMultiFile.js" ></script>
    <script type="text/javascript" src="/js/product/productUpdate.js" ></script>
 </body>
 </html>
 