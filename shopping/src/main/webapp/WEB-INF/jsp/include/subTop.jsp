<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

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
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header__top__left">
                        <ul>
                           <li><i class="fa fa-envelope"></i>admin@naver.com</li>
                           <li>${loginvo.USER_NAME}님 환영합니다.</li>
                        </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                      		<div class="header__top__right__language">
                                <img src="/resources/img/korea.png" alt="">
                                <div>한국어</div>
         
                            </div>
                             <div class="header__top__right__auth">
                           		<c:choose>
                           			<c:when test="${empty loginvo}">
                           				<a href="/login.do"><i class="fa fa-user"></i>로그인</a>
                           			</c:when>
                           			<c:otherwise>
                           				 <a href="/logout.do"><i class="fa fa-user"></i>로그아웃</a>
                           			</c:otherwise>
                           		</c:choose>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/main.do"><img src="/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="/main.do">Home</a></li>
                            <li><a href="/category/shop.do">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="/cart.do"> 장바구니</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./contact.html">Contact</a></li>
                            <c:if test ="${!empty loginvo.USER_ID}">
	                            <li><a href="./contact.html">Contact</a></li>
	                            <li>
	                            	<a href="#">MyPage</a>
	                            	<ul class="header__menu__dropdown">
	                                    <li><a href="/userInfoUpdate.do">회원정보변경</a></li>
	                                    <c:if test="${loginvo.AUTHCODE eq 9}">
	                                   		 <li><a href="/customerInfo.do">고객정보</a>
	                                    </li>
	                                    </c:if>
                                        <%--    <c:if test="${loginvo.AUTHCODE eq 9 }"> --%>
	                                </ul>
	                            </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <!-- <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li> -->
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>장바구니카운트갯수</span></a></li>
                        </ul>
                        <div class="header__cart__price">장바구니금액: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                        	  <c:forEach var="menuList" items="${menuList}">
	                            		<li><a href="#" onclick="fn_category('${menuList.INX}')" >${menuList.CATE_NAME }</a></li>
	                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form id="frm" name="frm" method="post">
                                <div class="hero__search__categories">
                                   	상품이름
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?" id="searchKeyword" name="searchKeyword">
                                <button type="button" onclick="fn_search()" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    <script>
    	function fn_category(INX){
    		window.location.href="/category/shop.do?INX="+INX;
    	}
    	function fn_search(){
    		if(!$("#searchKeyword").val()){
    			alert("상품명을 입력하세요");
    			return false;
    		}
    		document.frm.action = "/category/shop.do";
    		$("#frm").submit();
    	}
    </script>