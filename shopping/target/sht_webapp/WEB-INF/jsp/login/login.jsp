<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <head>
  
  	<title>로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="resources/login/css/style.css">

	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">로그인</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
						<div class="img" style="background-image: url(resources/login/images/bg-1.jpg);"></div>
						<div class="login-wrap p-4 p-md-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">로그인</h3>
			      		</div>
								<div class="w-100">
									<p class="social-media d-flex justify-content-end">
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
									</p>
								</div>
			      	</div>
				<form  class="signin-form" id="frm" name="frm" method="post">
			      		<div class="form-group mt-3">
			      			<input type="text" class="form-control" id="USER_ID" name="USER_ID">
			      			<label class="form-control-placeholder" for="USER_ID">아이디</label>
			      		</div>
		            <div class="form-group">
		              <input id="password-field" type="password" class="form-control" id="USER_PASSWD" name="USER_PASSWD">
		              <label class="form-control-placeholder" for="password">비밀번호</label>
		              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
		            </div>
		            <div class="form-group">
		            	<button type="button" class="form-control btn btn-primary rounded submit px-3" onclick="fn_login();">로그인</button>
		            </div>
		            <div class="form-group d-md-flex">
		       
						<div class="w-50 text-md-right">
							<a href="#">비밀번호 찾기</a>
						</div>
         		  </div>
		          </form>
		          <p class="text-center">회원이 아니신가요 ? <a data-toggle="tab" href="/join.do">회원가입</a></p>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="/resources/login/js/jquery.min.js"></script>
  <script src="/resources/login/js/popper.js"></script>
  <script src="/resources/loginjs/bootstrap.min.js"></script>
  <script src="/resources/login/js/main.js"></script>
 <script type="text/javascript" src="/js/login/login.js" ></script>
	</body>
</html>

