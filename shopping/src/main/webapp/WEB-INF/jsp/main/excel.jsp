<%@ page language="java" contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String filename = request.getAttribute("filename").toString();
	response.setHeader("Content-Type", "application/vnd.ms-xls");
	response.setHeader("Content-Disposition", "inline; filename=고객정보_" + filename + ".xls");
%>
</head>
<body>
	<table border="1">
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>주소</th>
				<th>번호</th>
			</tr>	
				<c:forEach var="list" items="${cusList}" varStatus="status">
					<tr>
						<td>${list.USER_NAME}</td>
						<td>${list.USER_ID}</td>
						<td>${list.USER_ADDRESS}</td>
						<td>${list.USER_PHONE}</td>
					</tr>
				</c:forEach>
	</table>
</body>
</html>