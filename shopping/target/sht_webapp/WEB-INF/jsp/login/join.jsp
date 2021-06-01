<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <head>

    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/join/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/join/css/owl.carousel.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/join/css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="/resources/join/css/style.css">
     <script src="/resources/join/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/join/js/popper.min.js"></script>
    <script src="/resources/join/js/bootstrap.min.js"></script>
    <script src="/resources/join/js/main.js"></script>
 	<script type="text/javascript" src="/js/join/join.js" ></script>
    <title>회원가입</title>
  </head>
  <body>
  

  <div class="half">
    <div class="bg order-1 order-md-2" style="background-image: url('/resources/join/images/bg_1.jpg');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-6">
            <div class="form-block">
              <div class="text-center mb-5">
              <h3>회원가입</h3>
              
              </div>
              <form method="post" id="frm" name="frm">
                <div class="form-group first">
                  <label for="name">이름</label>
                  <input type="text" class="form-control" placeholder="이름 입력하세요(한글만입력가능)" id="USER_NAME" name="USER_NAME" >
                  <div class="check_font" id="name_chk"></div>
                </div>                
                <div class="form-group first">
                  <label for="USER_NAME">아이디</label>
                  <input type="text"  class="form-control" placeholder="ID입력하세요(소문자,숫자입력가능 2글자이상)" id="USER_ID" name="USER_ID"   >
                  <input type="hidden" id="idcount" value="">
         		  <div class="check_font" id="id_chk"></div>
                </div>
                 <div class="form-group">
                  <label for="phone">번호</label>
                  <input type="text" class="form-control" placeholder="번호 입력하세요(-제외)" id="USER_PHONE" name="USER_PHONE">
                  <div class="check_font" id="ph_chk"></div>
                </div>
                    <div class="form-group">
                  <label for="phone">주소</label>
                  <input type="text" class="form-control" placeholder="주소 입력하세요" id="USER_ADDRESS" name="USER_ADDRESS">
                </div>
                <div class="form-group">
                  <label for="password">비밀번호</label>
                  <input type="password" class="form-control" placeholder="비밀번호 입력하세요" id="USER_PASSWD" name="USER_PASSWD">
                  <div class="check_font" id="pw_chk"></div>
                </div>
                <div class="form-group last mb-3">
                  <label for="re-password">비밀번호확인</label>
                  <input type="password" class="form-control" placeholder="비밀번호 확인" id="re-password">
              	  <div id="re_chk"></div>
                </div>
                
                <div class="d-sm-flex mb-5 align-items-center">
                  <span class="ml-auto"><a href="/login.do" class="forgot-pass">로그인</a></span> 
                </div>
				<a href="javascript:fn_join()" class="btn btn-block btn-primary">회원가입</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
   
  </body>
</html>