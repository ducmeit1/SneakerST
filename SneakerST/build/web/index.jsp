<%-- 
    Document   : index
    Created on : Oct 10, 2016, 9:36:08 PM
    Author     : DUCHTSE61924
--%>

<%@page import="client.model.NewArrivals"%>
<%@page import="client.dao.DatabaseContextClient"%>
<%@page import="client.model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                <nav class="navbar navbar-default navbar-fixed-top" role="navigation"> 
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

            <!-- BEGIN SLIDER AREA-->
            <div class="slider_area">

                <!-- BEGIN SLIDER-->          
                <div id="slides">
                    <ul class="slides-container">

                        <!-- THE FIRST SLIDE-->
                        <li>
                            <!-- FIRST SLIDE OVERLAY -->
                            <div class="slider_overlay"></div> 
                            <!-- FIRST SLIDE MAIN IMAGE -->
                            <img src="img/full-slider/full-slide1.jpg" alt="img">
                            <!-- FIRST SLIDE CAPTION-->
                            <div class="slider_caption">
                                <h2>SNEAKERHEAD HEADEWARE</h2>
                                <p>A product of SneakerHead in autumn season 2016</p>
                                <a href="#" class="slider_btn">VIEW MORE</a>              
                            </div>
                        </li>

                        <!-- THE SECOND SLIDE-->
                        <li>
                            <!-- SECOND SLIDE OVERLAY -->
                            <div class="slider_overlay"></div> 
                            <!-- SECOND SLIDE MAIN IMAGE -->
                            <img src="img/full-slider/full-slide2.jpg" alt="img">
                            <!-- SECOND SLIDE CAPTION-->
                            <div class="slider_caption">
                                <h2>NEW BALANCE</h2>
                                <p>The new sneakers of New Blanace brand</p>
                                <a href="#" class="slider_btn">VIEW MORE</a>
                            </div>
                        </li>

                        <!-- THE THIRD SLIDE-->
                        <li>
                            <!-- THIRD SLIDE OVERLAY -->
                            <div class="slider_overlay"></div> 
                            <!-- THIRD SLIDE MAIN IMAGE -->
                            <img src="img/full-slider/full-slide5.jpg" alt="img">
                            <!-- THIRD SLIDE CAPTION-->
                            <div class="slider_caption">
                                <h2>SALE OFF UP TO 60%</h2>
                                <p>Happy shopping day.</p>
                                <a href="#" class="slider_btn">VIEW MORE</a>                 
                            </div>
                        </li>
                    </ul>
                    <!-- BEGAIN SLIDER NAVIGATION -->
                    <nav class="slides-navigation">
                        <!-- PREV IN THE SLIDE -->
                        <a class="prev" href="/item1">
                            <span class="icon-wrap"></span>
                            <h3><strong>Prev</strong></h3>
                        </a>
                        <!-- NEXT IN THE SLIDE -->
                        <a class="next" href="/item3">
                            <span class="icon-wrap"></span>
                            <h3><strong>Next</strong></h3>
                        </a>
                    </nav>       
                </div>
                <!-- END SLIDER-->          
            </div>
            <!-- END SLIDER AREA -->
        </header>
        <!--=========== End HEADER SECTION ================--> 

        <!--=========== BEGIN NEW ARRIVALS SECTION ================-->
        <section id="new-arrivals">
            <%
                String gender = "";
                DatabaseContextClient dbc = new DatabaseContextClient();
                ArrayList<NewArrivals> arr = dbc.newArrivals(gender);
            %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 text-center">
                        <h2>NEW ARRIVALS</h2>
                        <hr class="star-primary">
                    </div>
                </div>
                <div class="row">
                    <%for (int i = 0; i < 2; i++) {%>
                    <div class="col-lg-3 col-sm-6 new-arrivals-item">
                        <a href="viewproduct?id=<%=arr.get(i).getProductId()%>" class="new-arrivals-link">
                            <div class="type-tag">NEW</div>                            
                            <div class="price-tag"><%=arr.get(i).getUnitPrice()%> USD</div>
                            <img src="<%=arr.get(i).getImageUrl()%>" class="img-responsive" alt="">
                            <p><%=arr.get(i).getProductName()%></p>
                        </a>
                    </div>
                    <%}%>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <a href="newarrivals.jsp?gender=" class="btn btn-lg btn-outline" style="position: relative; top: 30px">
                            VIEW MORE
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <!--==========END NEW ARRIVALS================-->

        <!-- BEGIN REVIEWS -->
        <section id="reviews">
            <div id="reviews-trigger" class="reviews text-white parallax" data-stellar-background-ratio="0.5" style="background-image: url(img/slider.jpg);">
                <div class="cover"></div>
                <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                            <h2 style="color: #FFF">REVIEWS</h2>
                            <hr class="star-primary">
                            <p class="subtitle">What people say about us</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->
                <div class="container">
                    <div class="reviews-inner center-block text-center">
                        <div id="owl-reviews" class="owl-carousel">
                            <div class="item">
                                <blockquote>
                                    <p>"This was my first experience with that team and outperformed my expectation! They know there stuff and I highly recommend them! A+++".</p>
                                    <footer><cite title="Source Title">Daryl Hodgeman</cite></footer>
                                </blockquote>
                            </div>
                            <div class="item">
                                <blockquote>
                                    <p>"I like then I reviews"</p>
                                    <footer><cite title="Source Title">Đức Mê IT</cite></footer>
                                </blockquote>
                            </div>
                            <div class="item">
                                <blockquote>
                                    <p>Thang is handsome. I hope would work with him in the future.</p>
                                    <footer><cite title="Source Title">Tuyen Hot Girl</cite></footer>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END REVIEWS -->


        <!-- Blog section begin-->
        <section id="blog-slider">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 text-center">
                        <h2>HOT BLOGS</h2>
                        <hr class="star-primary">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <img src="img/blog-index/gourmet-hotpack-summary.jpg" alt="Img of blog" class="img-responsive">
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 text-center">
                        <h1>GOURMET “HOTPACK”</h1>
                        <p class="text-justify">
                            We’re coming up on the longest day of the year in the northern hemisphere, and all that sunlight means extended warmth and fun with your friends away from the trappings of school and work.  Gourmet is right on the pulse of the summertime vibe and their new Hotpack trio brings three new designs to retail that are just perfect for those balmy nights.  The familiar Gourmet Uno LX comes through in two printed colorways giving you your choice of leopard or camo suede, while a patent-mudguarded Deici 2 L positions itself as the ‘cool’ (grey) guy in this clique.  Check out all three in greater detail below and grab yours straight from Gourmet.
                         </p>
                        <a href="#" class="btn btn-lg btn-outline view-more">
                            VIEW MORE
                        </a>
                    </div>
                </div>
                <div class="row" style="position: relative; top: 40px;">
                    <div id="blog-text" class="col-lg-6 col-md-12 col-sm-12 text-center">
                        <h1>NIKE AIR GRIFFEY MAX 1 – BLACK</h1>
                        <p class="text-justify">
                            The Nike Air Griffey Max 1 has long since ditched the traditional Seattle Mariners look for a bevy of vibrant colorways and even some prints like last year’s Safari release. This Black/Light Photo Blue pair is no exception to the explorative nature of Ken Griffey Jr.’s signature. What the pair manages to do particularly well is dress the upper in just the right amount of print (they’re calling the pattern a “grunge” camouflage) while sticking to a simple black suede throughout the rest of the sneaker. We’re currently in the midst of the playoff run in the MLB right now, so this Griffey couldn’t come at a more perfect time. Grab one last look after the click before this Griffey pair hits retailers like Millennium Shoes tomorrow, August 15th.
                         </p>
                        <a href="#" class="btn btn-lg btn-outline view-more">
                            VIEW MORE
                        </a>
                    </div>
                    <div id="blog-img" class="col-lg-6 col-md-12 col-sm-12">
                        <img src="img/blog-index/RetroBoost_Black_Blue_2.jpg" alt="Img of blog" class="img-responsive">
                    </div>
                </div>   
                <div class="row">
                </div> 
            </div>
        </section>
        <!-- Blog section end -->


        <!-- Begin partners -->
        <section id="partners-section">
            <div class="parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/slider2.jpg);">
                <div class="cover"></div>
                <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                            <h2>OUR PARTNERS</h2>
                            <hr class="star-primary">
                            <p class="subtitle">The brands that we are partners</p>
                        </div>
                    </div>
                </div>
                <!-- End page header-->
                <div class="container-fluid text-center" style="padding-bottom: 20px">
                    <div id="owl-partners" class="owl-carousel">
                        <img src="img/brand/adidas.png" alt="img">
                        <img src="img/brand/converse.png"  alt="img">
                        <img src="img/brand/jordan.png" alt="img">
                        <img src="img/brand/nb.png"  alt="img">
                        <img src="img/brand/nike.png"  alt="img">
                        <img src="img/brand/puma.png" alt="img">
                    </div>
                </div>
            </div>
        </section>
        <!-- End partners -->

        <!-- Look Book Grid Section -->
        <section id="section-portfolio" class="bg-light-gray">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">LOOK BOOK</h2>
                        <hr class="star-primary">
                        <h3 class="section-subheading text-muted">Collection the best of Sneakers of 2016</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-6 portfolio-item">
                        <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content">
                                    <i class="fa fa-plus fa-3x"></i>
                                </div>
                            </div>
                            <img src="img/blog-index/lookbook1/jordan-brand-holiday-2010-sneakers-01.jpg" class="img-responsive img-lookbook" alt="">
                        </a>
                        <div class="portfolio-caption">
                            <h4>Jordan Brand Holiday </h4>
                            <p class="text-muted">2016 Look Book</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 portfolio-item">
                        <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content">
                                    <i class="fa fa-plus fa-3x"></i>
                                </div>
                            </div>
                            <img src="img/blog-index/lookbook2/palace-adidas-originals-primeknit-collaboration-01.jpg" class="img-responsive img-lookbook" alt="">
                        </a>
                        <div class="portfolio-caption">
                            <h4>  Adidas Primeknit </h4>
                            <p class="text-muted">In Summer 2016</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 portfolio-item">
                        <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content">
                                    <i class="fa fa-plus fa-3x"></i>
                                </div>
                            </div>
                            <img src="img/blog-index/lookbook3/air-max-day-publish-brand-15.jpg" class="img-responsive img-lookbook" alt="">
                        </a>
                        <div class="portfolio-caption">
                            <h4>Style On Air Max Day  </h4>
                            <p class="text-muted">With Publish Brand’s</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 portfolio-item">
                        <a href="#portfolioModal4" class="portfolio-link" data-toggle="modal">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content">
                                    <i class="fa fa-plus fa-3x"></i>
                                </div>
                            </div>
                            <img src="img/blog-index/lookbook4/adidas-originals-xeno-collection-lookbook-02.jpg" class="img-responsive img-lookbook" alt="">
                        </a>
                        <div class="portfolio-caption">
                            <h4>Jordan</h4>
                            <p class="text-muted">Jordan Brand Spring 2016 </p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 portfolio-item">
                        <a href="#portfolioModal5" class="portfolio-link" data-toggle="modal">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content">
                                    <i class="fa fa-plus fa-3x"></i>
                                </div>
                            </div>
                            <img src="img/blog-index/lookbook5/2.jpg" class="img-responsive img-lookbook" alt="">
                        </a>
                        <div class="portfolio-caption">
                            <h4>Adidas Originals </h4>
                            <p class="text-muted">Lookbook for January 2016</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 portfolio-item">
                        <a href="#portfolioModal6" class="portfolio-link" data-toggle="modal">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content">
                                    <i class="fa fa-plus fa-3x"></i>
                                </div>
                            </div>
                            <img src="img/blog-index/lookbook6/1.jpg" class="img-responsive img-lookbook" alt="">
                        </a>
                        <div class="portfolio-caption">
                            <h4>Commonwealth x Asics</h4>
                            <p class="text-muted"> Lyte V “Gemini”</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Portfolio Modals -->
        <!-- Use the modals below to showcase details about your portfolio projects! -->

        <!-- Portfolio Modal 1 -->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl">
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="modal-body">
                                    <!-- Project Details Go Here -->
                                    <h2>Style On Air Max Day </h2>
                                    <p class="item-intro text-muted">Style On Air Max Day With Publish Brand's</p>
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook3/air-max-day-publish-brand-13.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook3/air-max-day-publish-brand-15.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook3/air-max-day-publish-brand-21.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook3/air-max-day-publish-brand-22.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook3/air-max-day-publish-brand-29.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook3/air-max-day-publish-brand-30.jpg" alt="">


                                    <p> Air Maxes have been a fixture in streetwear and streetculture scene for ages, and while the wear and culture have changed around them, Air Max sneakers have remained true and unchanged. Among the most prominent style options in tandem with retro runners is the “jogger pant” look that labels like Publish Brand has mastered, but beyond that cuffed look that they effortlessly offer is a whole collection of gear for the Spring/Summer 2015 season. They’ve provided an incredible lookbook with some style suggestions highlighting their feature pieces alongside some great Air Max footwear like the Air Max 1, 95, and 2015, so get an exclusive look here and check out what’s available now at Publish.</p>

                                    <ul class="list-inline">
                                        <li>Date: March 22nd, 2016</li>
                                        <li>Client: John Kim</li>

                                    </ul>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl">
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="modal-body">
                                    <!-- Project Details Go Here -->
                                    <h2>Adidas Primeknit</h2>
                                    <p class="item-intro text-muted">Palace Skateboards Reveals Upcoming adidas Primeknit Collabs In Summer 2016 </p>
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook2/palace-adidas-originals-primeknit-collaboration-02-620x897.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook2/palace-adidas-originals-primeknit-collaboration-03-620x893.jpg" alt="">


                                    <p>Palace Skateboards‘ yearly teaming up with adidas has somewhat answered the dominance of Supreme and Nike’s numerous collaborations thanks to smart apparel installments focused on simplicity, vintage tracksuits with a modern twist, and the occasional graphic heavy installment. This Spring/Summer 2016 collection modeled by Blondey McCoy in the official lookbook spans a wide range of performance materials and even sneaks in the adidas Originals Primeknit Pro and the adidas Pro Trainer for footwear selections. While the preview is brief, each features a vibrant dose of orange for a standout look. Check out the full image set over at Palace and we’ll keep you updated on a release date in the near future.</p>

                                    <ul class="list-inline">
                                        <li>Date: October 2016</li>
                                        <li> Adidas</li>

                                    </ul>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl">
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="modal-body">
                                    <!-- Project Details Go Here -->
                                    <h2>Jordan</h2>
                                    <p class="item-intro text-muted">Jordan Brand Spring 2015 Lookbook</p>
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook4/jordan-brand-spring-2015-lookbook-2.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook4/jordan-brand-spring-2015-lookbook-1.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook4/jordan-brand-spring-2015-lookbook-12.jpg" alt="">



                                    <p> The Jordan fit is a match for the court and the streets, and the brand’s latest offerings for that crossover appeal certainly meets the demand. The Spring Collection is anchored by performance, with the Jordan Melo M11 sneaker and 23 Icon Tee speaking to the basketball DNA of the brand. On the flipside, the lifestyle Jordans are just as stellar, with the Air Jordan 1 High Strap, Jordan Illusion, and Jordan Instigator comprising the off-the-court footwear line-up. Get a complete look at the Jordan Brand Spring 2015 Lookbook below and shop the entire collection here.</p>

                                    <ul class="list-inline">
                                        <li>Date: February 3rd, 2016</li>
                                        <li>Jordan  </li>

                                    </ul>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl">
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="modal-body">
                                    <!-- Project Details Go Here -->
                                    <h2>Adidas Originals </h2>
                                    <p class="item-intro text-muted">Adidas Originals Superstar Lookbook for January 2015</p>
                                    <img class="img-responsive img-centered" src="img/blog-index/lookboo5/adidas-originals-superstar-lookbook-january-2015-01.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook5/adidas-originals-superstar-lookbook-january-2015-02.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook5/adidas-originals-superstar-lookbook-january-2015-03.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook5/adidas-originals-superstar-lookbook-january-2015-04.jpg" alt="">



                                    <p> Adidas Originals had quite the year in 2016. They brought back a number of archival models, and at the forefront was the adidas Stan Smith. So which shoe will be their go to in the early goings of 2017? Their 1969 basketball silhouette in the adidas Originals Superstar. The shoe has since crossed over into lifestyle catalogues years ago, and it’s easy to see why. The classic shell-toe, bold stripes on the side, and the ability to be worn with seemingly every outfit has made this shoe a classic. Get with us after the click for a better view of the latest adidas Originals collection and be on the lookout for these Superstars to be at select spots on January 1st, 2017.</p>

                                    <ul class="list-inline">
                                        <li>October 15th, 2016 </li>
                                        <li>Adidas</li>

                                    </ul>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl">
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="modal-body">
                                    <!-- Project Details Go Here -->
                                    <h2>Asics</h2>
                                    <p class="item-intro text-muted">Commonwealth x Asics Gel Lyte V “Gemini”</p>
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook6/asics-gemini-gel-lyte-v-commonwealth-06.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook6/asics-gemini-gel-lyte-v-commonwealth-05.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook6/asics-gemini-gel-lyte-v-commonwealth.jpg" alt="">




                                    <p>There is a wider release of the Commonwealth x Asics Gel Lyte V “Gemini” coming, we can promise you that. While the retailers that will be stocking them have for the most part kept quiet, you can expect them to show up at the usual suspect in the coming weeks. Helping you to get a better idea of the mis-matched pair before that is this new lookbook, which shows off some on feet shots for this Asics Gel Lyte V collaboration. See below to take those in and watch for the word here on Sneaker News regarding the eventual further retail release of the Commonwealth x Asics Gel Lyte V “Gemini” (Also don’t forget that they’re debuting at Commonwealth this weekend).</p>

                                    <ul class="list-inline">
                                        <li>Date: September 23rd, 2016</li>
                                        <li>Asics</li>

                                    </ul>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl">
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="modal-body">
                                    <!-- Project Details Go Here -->
                                    <h2>Jordan Brand Holiday </h2>
                                    <p class="item-intro text-muted">Jordan Brand Holiday 2016 Look Book – More Sneakers </p>
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook1/jordan-brand-holiday-2010-sneakers-01.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook1/jordan-brand-holiday-2010-sneakers-02.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook1/jordan-brand-holiday-2010-sneakers-03.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook1/jordan-brand-holiday-2010-sneakers-04.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook1/jordan-brand-holiday-2010-sneakers-05.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook1/jordan-brand-holiday-2010-sneakers-06.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook1/jordan-brand-holiday-2010-sneakers-07.jpg" alt="">
                                    <img class="img-responsive img-centered" src="img/blog-index/lookbook1/jordan-brand-holiday-2010-sneakers-08.jpg" alt="">




                                    <p> We showed you a look at the Jordan Brand Holiday 2016 Lookbook featuring Wale and Lee England Jr. last week, and here’s a closer look at JB’s HO10 sneaker collection.  Let’s start on the lifestyle side of the spectrum, where four new colorways of the Jordan V.2 Grown each look to be very well executed.  There’s a couple of brown towns plus one each in grey or black, but if you need a more rugged boot look no further than the Air Jordan Spiz’ike Winterized.  Three Spizike Winterized Boots will hit in Q4, two of which are popular colorways held over from last year.
                                        And speaking of last years, this could very well be the final season for Carmelo Anthony in Denver, but his Jordan Brand signature series continues to roll on strong with the upcoming Melo M7 in a wide range of colorways.  Elsewhere on-court, the Take Flight shows us what JB will do with a full-length Max Air cushion for the first time, while the Rare Air and Flight SC Highs each show a different perspective on where they’ve been.  Click the jump below to see the full collection and stick with Sneaker News for updates.</p>
                                    <ul class="list-inline">
                                        <li>Date: October 2016</li>
                                        <li>Client: Jordan</li>

                                    </ul>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
