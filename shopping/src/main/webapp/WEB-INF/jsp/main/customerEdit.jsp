<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
 <script src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/customer/customerEdit.js" ></script>
<title>고객정보 변경</title>
</head>
<body>
	<form id="frm" name="frm">
		<input type="hidden" id="INX" name="INX" value="${vo.INX}">
		<table class="simple_table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="USER_NAME" name="USER_NAME" value="${vo.USER_NAME}">
					<div id="nm_chk"></div>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${vo.USER_ID}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input id="ADR" name="ADR" type="text"  readonly onclick="findAddr()" value="${vo.ADR}">						
					<input type="text" id="DEADR" name="DEADR"  placeholder="상세주소 입력하세요" value="${vo.DEADR}" >
					<input type="hidden" id="USER_ADDRESS" name="USER_ADDRESS" >	
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<td>
					<input type="text" id="USER_PHONE" name="USER_PHONE" value="${vo.USER_PHONE }">
					<div id ="ph_chk"></div>
				</td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="fn_edit()" class="site-btn">수정</button>
			<button type="button" onclick="self.close();" class="site-btn">닫기</button>
		</div>
	</form>
</body>
	<style>
.simple_table { width: 100%; border: none; border-collapse: separate; border-spacing: 2px;}
.simple_table th { padding: 15px; border: none; border-left: 5px solid #C03; border-bottom: 1px solid #DDD; background: #FCF0F3; font-weight: normal; text-align:center; text-shadow: 0 1px #FFF; vertical-align: middle;}
.simple_table td { padding: 15px; border: none; border-bottom: 1px solid #DDD; text-align: left; vertical-align: baseline;}
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
