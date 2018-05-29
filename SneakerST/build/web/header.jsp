<%-- 
    Document   : header
    Created on : Oct 11, 2016, 11:20:06 AM
    Author     : DUCHTSE61924
--%>

<%@page import="client.model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--Include Libary CSS-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/superslides.css">
    <link rel="stylesheet" href="css/animate.css">
    <link id="orginal" href="css/themes/default-theme.css" rel="stylesheet">
    <link rel="stylesheet" href="js/owl-carousel/css/owl.carousel.css">
    <link rel="stylesheet" href="js/owl-carousel/css/owl.theme.css">
    <!--Include Main CSS -->
    <link href="css/main.css" rel="stylesheet">
    <!-- Google fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Varela" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <title>SneakerST Vietnam</title>
</head>
<body>
    <!-- BEGAIN PRELOADER -->
    <div id="preloader">
        <div id="status">&nbsp;</div>
    </div>
    <!-- END PRELOADER -->
    <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
    <!-- END SCROLL TOP BUTTON -->
    <!--=========== BEGIN HEADER SECTION ================-->
    <div id="top">
            <div class="container">
                <div class="row">
                    <div class="col-xs-5 news">
                        <p class="hidden-sm hidden-xs">FREE DELIVERY & FREE RETURN &nbsp;<a href="#"><sup>SEE DETAILS (*)</sup></a></p>
                    </div>
                    <div class="col-lg-7 col-sm-12 col-xs-12">
                        <div class="social">
                            <a href="facebook.com" class="external facebook" data-animate-hover="pulse"><i class="fa fa-facebook"></i></a>
                            <a href="plus.google.com" class="external gplus" data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
                            <a href="twitter.com" class="external twitter" data-animate-hover="pulse"><i class="fa fa-twitter"></i></a>
                            <a href="mailto:ducmeit2015@gmail.com" class="email" data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
                        </div>
                        <%if (session.getAttribute("userCustomer") != null) {
                                ArrayList<Customer> userAccount = (ArrayList<Customer>) session.getAttribute("userCustomer");
                                for (Customer c : userAccount) {%>
                        <div class="login">
                            <a href="myaccount.jsp" title="Your account"><i class="fa fa-user"></i> <span class="text-uppercase hidden-sm hidden-xs"><%=c.getFirstname()%></span></a>
                            <a href="logout" title="Logout"><i class="fa fa-sign-out"></i> <span class="text-uppercase hidden-sm hidden-xs">Logout</span></a>
                            <a href="cart.jsp" title="Logout"><i class="fa fa-shopping-cart"></i> <span class="text-uppercase hidden-sm hidden-xs">Cart</span></a>
                        </div>
                        
                        <% }
                        } else {%>
                        <div class="login">
                            <a href="login.jsp"><i class="fa fa-sign-in"></i> <span class="text-uppercase">Sign in</span></a>
                            <a href="register.jsp"><i class="fa fa-user"></i> <span class="text-uppercase">Sign up</span></a>
                            <a href="cart.jsp" title="Logout"><i class="fa fa-shopping-cart"></i> <span class="text-uppercase hidden-sm hidden-xs">Cart</span></a>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div> 
        <header id="header">
            <!-- BEGIN MENU -->
            <div class="menu_area">
                <nav class="navbar navbar-default navbar-fixed-top navbar-shink" role="navigation"> 
                    <div class="container">
                        <div class="navbar-header">
                            <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!-- TEXT BASED LOGO -->
                            <a class="navbar-brand" href="#">SNEAKER<span>ST</span></a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul id="top-menu" class="nav navbar-nav navbar-right">
                                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">NEW ARRIVALS <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="newarrivals.jsp?gender=male">Male</a></li>
                                        <li><a href="newarrivals.jsp?gender=women">Women</a></li>
                                        <li><a href="newarrivals.jsp?gender=kid">Kid</a></li>
                                    </ul>
                                </li>
                                <li><a href="newarrivals.jsp?gender=">SNEAKERS</a></li>
                                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">BRAND<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="adidas.jsp">Adidas</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">BLOG</a></li> 
                                <li><a href="feedback.jsp">CUSTOMER SERVICE</a></li>               
                                <li><a href="#" id="searchButton">SEARCH <span class="glyphicon glyphicon-search"></span></a></li>                           
                            </ul>           
                        </div><!--/.nav-collapse -->
                    </div>     
                </nav>
            </div>
        <!-- END MENU -->

        <div id="searchBox" class="off">
            <div id="search" class="open">
                <button data-widget="remove" id="removeClass" class="close" type="button">×</button>
                <form action="search" method="get" autocomplete="off">
                    <input type="text" placeholder="Type search keywords here" value="" name="keyword" id="keyword">
                    <button class="btn btn-lg btn-outline" type="submit">Search <span class="glyphicon glyphicon-search"></span></button>
                </form>
            </div>
        </div>
    </header>
    <!--=========== End HEADER SECTION ================-->
