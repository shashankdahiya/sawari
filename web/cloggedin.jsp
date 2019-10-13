<%-- 
    Document   : cloggedin
    Created on : 10 Mar, 2019, 2:14:10 PM
    Author     : intel
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>Home - Booking</title>

    <!--=== Bootstrap CSS ===-->
    
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    
    <!--=== Slicknav CSS ===-->
    <link href="assets/css/plugins/slicknav.min.css" rel="stylesheet">
    <!--=== Magnific Popup CSS ===-->
    <link href="assets/css/plugins/magnific-popup.css" rel="stylesheet">
    <!--=== Owl Carousel CSS ===-->
    <link href="assets/css/plugins/owl.carousel.min.css" rel="stylesheet">
    <!--=== Gijgo CSS ===-->
    <link href="assets/css/plugins/gijgo.css" rel="stylesheet">
    <!--=== FontAwesome CSS ===-->
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <!--=== Theme Reset CSS ===-->
    <link href="assets/css/reset.css" rel="stylesheet">
    <!--=== Main Style CSS ===-->
    <link href="style.css" rel="stylesheet">
    <!--=== Responsive CSS ===-->
    <link href="assets/css/responsive.css" rel="stylesheet">
   
    <script>
     function logout(){
         var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
         window.location="http://localhost:8084/sawari/cloggedin.jsp";
     }
     
    </script>

    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     </head>
    <body>
       <body class="loader-active">

    <!--== Preloader Area Start ==-->
    <div class="preloader">
        <div class="preloader-spinner">
            <div class="loader-content">
                <img src="assets/img/preloader.gif" alt="JSOFT">
            </div>
        </div>
    </div>
    <!--== Preloader Area End ==-->

    <!--== Header Area Start ==-->
    <header id="header-area" class="fixed-top">
        <!--== Header Top Start ==-->
        <div id="header-top" class="d-none d-xl-block">
            <div class="container">
                <div class="row">
                    <!--== Single HeaderTop Start ==-->
                    <div class="col-lg-3 text-left">
                        <i class="fa fa-map-marker"></i> 22/45, Vijay Nagar
                    </div>
                    <!--== Single HeaderTop End ==-->

                    <!--== Single HeaderTop Start ==-->
                    <div class="col-lg-3 text-center">
                        <i class="fa fa-mobile"></i> +91 1112223333
                    </div>
                    <!--== Single HeaderTop End ==-->

                    <!--== Single HeaderTop Start ==-->
                    <div class="col-lg-3 text-center">
                        <i class="fa fa-clock-o"></i> Mon-Fri 09.00 - 17.00
                    </div>
                    <!--== Single HeaderTop End ==-->

                    <!--== Social Icons Start ==-->
                    <div class="col-lg-3 text-right">
                        <div class="header-social-icons">
                            <a href="#"><i class="fa fa-behance"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                    <!--== Social Icons End ==-->
                </div>
            </div>
        </div>
        <!--== Header Top End ==-->

        <!--== Header Bottom Start ==-->
        <div id="header-bottom">
            <div class="container">
                <div class="row">
                    <!--== Logo Start ==-->
                    <div class="col-lg-4">
                        <a href="index.html" class="logo">
                            <img src="assets/img/logo.png" alt="JSOFT">
                        </a>
                    </div>
                    <!--== Logo End ==-->

                    <!--== Main Menu Start ==-->
                    <div class="col-lg-8 d-none d-xl-block">
                        <nav class="mainmenu alignright">
                           
                            <% String userName = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("licence")) userName = cookie.getValue();
}
                                if(userName !=null){%>
                           
                                <ul><%session.setAttribute("licence", userName);%>
                                <li class="active"><a href="#">Home</a></li>
                                
                                <li><a href="mybooking">my booking</a> </li>
                                
                                
                                
                                <li><a href="Cprofile">profile</a></li>
                                <li><a >help</a>
                                    <ul>
                                        <li><a href="faq.html">FAQs</a></li>
                                        <li><a href="contact.html">contact</a></li>
                                        <li><a href="insurace.html">insurance</a></li>
                                        
                                    </ul>
                                </li>
                                <li><a onclick="logout()">logout</a></li>
                                
                                
                            </ul>
                                <%}
                            else{ %>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a >help</a>
                                    <ul>
                                        <li><a href="faq.html">FAQs</a></li>
                                        <li><a href="contact.html">contact</a></li>
                                    </ul>
                                </li>
                                <li><a href="login.jsp">login</a></li>
                                <li><a href="register.jsp">register</a></li>
                            </ul>
                            <% }  }%>
                        </nav>
                    </div>
                    <!--== Main Menu End ==-->
                </div>
            </div>
        </div>
        <!--== Header Bottom End ==-->
    </header>
    <!--== Header Area End ==-->

    <!--== Slider Area Start ==-->
    <section id="slider-area">
        <!--== slide Item One ==-->
        <div class="single-slide-item overlay">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="book-a-car">
                            
                           <form action="Bookingdetails" method="POST">
                                <!--== Pick Up Location ==-->
                                <div class="pickup-location book-item">
                                    <h4>PICK-UP LOCATION:</h4>
                                    <select class="custom-select" name="location">
                                      <option selected>In Indore</option>
                                      <option value="Vijay Nagar">Vijay Nagar</option>
                                      <option value="Rao">Rao</option>
                                      <option value="Dewas">Dewas</option>
                                      <option value="Bhawarkua">Bhawarkua</option>
                                    </select>
                                </div>
                                <!--== Pick Up Location ==-->
                                <input type="hidden" name="licence" value="<%out.println(userName);%>" >
                                <!--== Pick Up Date ==-->
                                <div class="pick-up-date book-item">
                                
                                   <h4>PICK-UP DATE & TIME:<br> (Format: dd-mm-yyyy hh:mm)</h4>
                                   <input type="datetime-local"  name="startdate" />    
                                    
                                   <div class="return-car date">
                                        <h4>Return DATE & TIME:<br> (Format: dd-mm-yyyy hh:mm)</h4>
                                        <input type="datetime-local"  name="enddate" />    
                                   </div> 
                                    
                                    
                                </div>
                               
                                
                                

                                <!--== Car Choose ==-->
                                <div class="choose-car-type book-item">
                                    <h4>RIDE in KM:</h4>
                                    <input name="km" type="text" placeholder="Km package"id="len" />
                                </div>
                                
                                <!--== Car Choose ==-->

                                <div class="book-button text-center">
                                    <button type="submit" class="book-now-btn">Book Now</button>
                                </div>
                            </form> 
                            
                            
                            
                            
                            
                           
                        </div>
                    </div>

                    <div class="col-lg-7 text-right">
                        <div class="display-table">
                            <div class="display-table-cell">
                                <div class="slider-right-text">
                                    <h1>BOOK A CAR TODAY!</h1>
                                    <p>FOR AS LOW AS 499/- A DAY PLUS 15% DISCOUNT <br> FOR OUR RETURNING CUSTOMERS</p>
                                    <p><BR><BR>BOOK A CAR FOR 3 DAYS OR MORE AND GET <B>500KM </B>RIDE FREE* </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--== slide Item One ==-->
    </section>
    <!--== Slider Area End ==-->

    <!--== About Us Area Start ==-->
    
    <!--== About Us Area End ==-->

    <!--== Partner Area Start ==-->
    <div id="partner-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="partner-content-wrap">
                        <!-- Single Partner Start -->
                        <div class="single-partner">
                            <div class="display-table">
                                <div class="display-table-cell">
                                    <img src="assets/img/partner/partner-logo-1.png" alt="JSOFT">
                                </div>
                            </div>
                        </div>
                        <!-- Single Partner End -->

                        <!-- Single Partner Start -->
                        <div class="single-partner">
                            <div class="display-table">
                                <div class="display-table-cell">
                                    <img src="assets/img/partner/partner-logo-2.png" alt="JSOFT">
                                </div>
                            </div>
                        </div>
                        <!-- Single Partner End -->

                        <!-- Single Partner Start -->
                        <div class="single-partner">
                            <div class="display-table">
                                <div class="display-table-cell">
                                    <img src="assets/img/partner/partner-logo-3.png" alt="JSOFT">
                                </div>
                            </div>
                        </div>
                        <!-- Single Partner End -->

                        <!-- Single Partner Start -->
                        <div class="single-partner">
                            <div class="display-table">
                                <div class="display-table-cell">
                                    <img src="assets/img/partner/partner-logo-4.png" alt="JSOFT">
                                </div>
                            </div>
                        </div>
                        <!-- Single Partner End -->

                        <!-- Single Partner Start -->
                        <div class="single-partner">
                            <div class="display-table">
                                <div class="display-table-cell">
                                    <img src="assets/img/partner/partner-logo-5.png" alt="JSOFT">
                                </div>
                            </div>
                        </div>
                        <!-- Single Partner End -->

                        <!-- Single Partner Start -->
                        <div class="single-partner">
                            <div class="display-table">
                                <div class="display-table-cell">
                                    <img src="assets/img/partner/partner-logo-1.png" alt="JSOFT">
                                </div>
                            </div>
                        </div>
                        <!-- Single Partner End -->

                        <!-- Single Partner Start -->
                        <div class="single-partner">
                            <div class="display-table">
                                <div class="display-table-cell">
                                    <img src="assets/img/partner/partner-logo-4.png" alt="JSOFT">
                                </div>
                            </div>
                        </div>
                        <!-- Single Partner End -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--== Partner Area End ==-->

    <!--== Services Area Start ==-->
     <!--== Services Area End ==-->

    <!--== Fun Fact Area Start ==-->
    <section id="funfact-area" class="overlay section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-11 col-md-12 m-auto">
                    <div class="funfact-content-wrap">
                        <div class="row">
                            <!-- Single FunFact Start -->
                            <div class="col-lg-4 col-md-6">
                                <div class="single-funfact">
                                    <div class="funfact-icon">
                                        <i class="fa fa-smile-o"></i>
                                    </div>
                                    <div class="funfact-content">
                                        <p><span class="counter">550</span>+</p>
                                        <h4>HAPPY CLIENTS</h4>
                                    </div>
                                </div>
                            </div>
                            <!-- Single FunFact End -->

                            <!-- Single FunFact Start -->
                            <div class="col-lg-4 col-md-6">
                                <div class="single-funfact">
                                    <div class="funfact-icon">
                                        <i class="fa fa-car"></i>
                                    </div>
                                    <div class="funfact-content">
                                        <p><span class="counter">250</span>+</p>
                                        <h4>CARS IN STOCK</h4>
                                    </div>
                                </div>
                            </div>
                            <!-- Single FunFact End -->

                            <!-- Single FunFact Start -->
                            <div class="col-lg-4 col-md-6">
                                <div class="single-funfact">
                                    <div class="funfact-icon">
                                        <i class="fa fa-bank"></i>
                                    </div>
                                    <div class="funfact-content">
                                        <p><span class="counter">50</span>+</p>
                                        <h4>office in cities</h4>
                                    </div>
                                </div>
                            </div>
                            <!-- Single FunFact End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--== Fun Fact Area End ==-->

    <!--== Choose Car Area Start ==-->
    <!--== Choose Car Area End ==-->

    <!--== Pricing Area Start ==-->
    <!--== Pricing Area End ==-->

    <!--== Testimonials Area Start ==-->
    <section id="testimonial-area" class="section-padding">
        <div class="container">
            <div class="row">
                <!-- Section Title Start -->
                <div class="col-lg-12">
                    <div class="section-title  text-center">
                        <h2>Testimonials</h2>
                        <span class="title-line"><i class="fa fa-car"></i></span>
                        <p>Our satisfied clients.</p>
                    </div>
                </div>
                <!-- Section Title End -->
            </div>

            <div class="row">
                <div class="col-lg-8 col-md-12 m-auto">
                    <div class="testimonial-content">
                        <!--== Single Testimoial Start ==-->
                        <div class="single-testimonial">
                            <p>Great value for money and thanks to their amazing offers which is not offered by anywhere else, even I can change my plan where ever and when ever I want. Also, none of second regret to take their offered pack, its so so worth it.</p>
                            <h3>Amal Anand</h3>
                            <div class="client-logo">
                                <img src="assets/img/client/client-pic-1.jpg" alt="JSOFT">
                            </div>
                        </div>
                        <!--== Single Testimoial End ==-->

                        <!--== Single Testimoial Start ==-->
                        <div class="single-testimonial">
                            <p>Great value for money and thanks to their amazing offers which is not offered by anywhere else, even I can change my plan where ever and when ever I want. Also, none of second regret to take their offered pack, its so so worth it.</p>
                            <h3>Pravesh Adwani</h3>
                            <div class="client-logo">
                                <img src="assets/img/client/client-pic-3.jpg" alt="JSOFT">
                            </div>
                        </div>
                        <!--== Single Testimoial End ==-->

                        <!--== Single Testimoial Start ==-->
                        <div class="single-testimonial">
                            <p>Great value for money and thanks to their amazing offers which is not offered by anywhere else, even I can change my plan where ever and when ever I want. Also, none of second regret to take their offered pack, its so so worth it.</p>
                            <h3>Rohit Mahesh Panikar </h3>
                            <div class="client-logo">
                                <img src="assets/img/client/client-pic-2.jpg" alt="JSOFT">
                            </div>
                        </div>
                        <!--== Single Testimoial End ==-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--== Testimonials Area End ==-->

    <!--== Mobile App Area Start ==-->
    <div id="mobileapp-video-bg"></div>
    <section id="mobile-app-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="mobile-app-content">
                        <h2>SAVE 30% WITH THE APP</h2>
                        <p>Easy &amp; Fast - Book a car in 60 seconds</p>
                        <div class="app-btns">
                            <a href="#"><i class="fa fa-android"></i> Android Store</a>
                            <a href="#"><i class="fa fa-apple"></i> Apple Store</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--== Mobile App Area End ==-->

    <!--== Articles Area Start ==-->
    <section id="tips-article-area" class="section-padding">
        <div class="container">
            <div class="row">
                <!-- Section Title Start -->
                <div class="col-lg-12">
                    <div class="section-title  text-center">
                        <h2>Tips and articles</h2>
                        <span class="title-line"><i class="fa fa-car"></i></span>
                        <p></p>
                    </div>
                </div>
                <!-- Section Title End -->
            </div>

            <!-- Articles Content Wrap Start -->
            <div class="row">
                <!-- Single Articles Start -->
                <div class="col-lg-12">
                    <article class="single-article">
                        <div class="row">
                            <!-- Articles Thumbnail Start -->
                            <div class="col-lg-5">
                                <div class="article-thumb">
                                    <img src="assets/img/article/arti-thumb-1.jpg" alt="JSOFT">
                                </div>
                            </div>
                            <!-- Articles Thumbnail End -->

                            <!-- Articles Content Start -->
                            <div class="col-lg-7">
                                <div class="display-table">
                                    <div class="display-table-cell">
                                        <div class="article-body">
                                            <h3><a href="article-details.html">Never Stop Living</a></h3>
                                            <div class="article-meta">
                                                <a href="#" class="author">By :: <span>Admin</span></a>
                                                <a href="#" class="commnet">Comments :: <span>10</span></a>
                                            </div>

                                            <div class="article-date">25 <span class="month">jan</span></div>

                                            <p>A brand new tag line, is so presented to confirm the leasure one will get when he will self drive a rented car, a never witnessed before service with full insurances and health support by our insured company.</p>

                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Articles Content End -->
                        </div>
                    </article>
                </div>
                <!-- Single Articles End -->

                <!-- Single Articles Start -->
                <div class="col-lg-12">
                    <article class="single-article middle">
                        <div class="row">

                            <!-- Articles Thumbnail Start -->
                            <div class="col-lg-5 d-xl-none">
                                <div class="article-thumb">
                                    <img src="assets/img/article/arti-thumb-2.jpg" alt="JSOFT">
                                </div>
                            </div>
                            <!-- Articles Thumbnail End -->

                            <!-- Articles Content Start -->
                            <div class="col-lg-7">
                                <div class="display-table">
                                    <div class="display-table-cell">
                                        <div class="article-body">
                                            <h3><a href="article-details.html">Sawari is redefining Environment-Friendly Transportation</a></h3>
                                            <div class="article-meta">
                                                <a href="#" class="author">By :: <span>Admin</span></a>
                                                <a href="#" class="commnet">Comments :: <span>10</span></a>
                                            </div>

                                            <div class="article-date">14<span class="month">feb</span></div>

                                            <p>World environment day celebrated, and on that specific day we thought to present this amazing new paln for out customized services which will promise environmentalist that we are conducting offers but not in the stake of our resourceful mother earth. Hence, electric cars, BS4 cars and eradicating old polluting vehicles and plans too.</p>

                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Articles Content End -->

                            <!-- Articles Thumbnail Start -->
                            <div class="col-lg-5 d-none d-xl-block">
                                <div class="article-thumb">
                                    <img src="assets/img/article/arti-thumb-2.jpg" alt="JSOFT">
                                </div>
                            </div>
                            <!-- Articles Thumbnail End -->
                        </div>
                    </article>
                </div>
                <!-- Single Articles End -->

                <!-- Single Articles Start -->
                <div class="col-lg-12">
                    <article class="single-article">
                        <div class="row">
                            <!-- Articles Thumbnail Start -->
                            <div class="col-lg-5">
                                <div class="article-thumb">
                                    <img src="assets/img/article/arti-thumb-3.jpg" alt="JSOFT">
                                </div>
                            </div>
                            <!-- Articles Thumbnail End -->

                            <!-- Articles Content Start -->
                            <div class="col-lg-7">
                                <div class="display-table">
                                    <div class="display-table-cell">
                                        <div class="article-body">
                                            <h3><a href="article-details.html">Accidental Insurance</a></h3>
                                            <div class="article-meta">
                                                <a href="#" class="author">By :: <span>Admin</span></a>
                                                <a href="#" class="commnet">Comments :: <span>10</span></a>
                                            </div>

                                            <div class="article-date">17 <span class="month">feb</span></div>

                                            <p>We not only have back for our cars but also for you guys. After all our client are who are saving food for us. So, from now all our service packs will include pre included and compulsory insurance fees which will insure your and your's family happy future.</p>

                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Articles Content End -->
                        </div>
                    </article>
                </div>
                <!-- Single Articles End -->
            </div>
            <!-- Articles Content Wrap End -->
        </div>
    </section>
    <!--== Articles Area End ==-->

    <!--== Footer Area Start ==-->
    <section id="footer-area">
        <!-- Footer Widget Start -->
        <div class="footer-widget-area">
            <div class="container">
                <div class="row">
                    <!-- Single Footer Widget Start -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single-footer-widget">
                            <h2>About Us</h2>
                            <div class="widget-body">
                                <img src="assets/img/logo.png" alt="JSOFT">
                                <p>And customers are free to choose any car of their choice based on their purse and availability of such car at the time of reservation.</p>

                                <div class="newsletter-area">
                                    <form action="index.html">
                                        <input type="email" placeholder="Subscribe Our Newsletter">
                                        <button type="submit" class="newsletter-btn"><i class="fa fa-send"></i></button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Single Footer Widget End -->

                    <!-- Single Footer Widget Start -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single-footer-widget">
                            <h2>Recent Posts</h2>
                            <div class="widget-body">
                                <ul class="recent-post">
                                    <li>
                                        <a href="#">
                                           Hello INDORE! 
                                           <i class="fa fa-long-arrow-right"></i>
                                       </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                          Explore in-city hubs
                                           <i class="fa fa-long-arrow-right"></i>
                                       </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                           Love Travelling? 
                                           <i class="fa fa-long-arrow-right"></i>
                                       </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Dive into divine range of luxury
                                           <i class="fa fa-long-arrow-right"></i>
                                       </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Single Footer Widget End -->

                    <!-- Single Footer Widget Start -->
                    <div class="col-lg-4 col-md-6">
                        <div class="single-footer-widget">
                            <h2>get touch</h2>
                            <div class="widget-body">
                                <p></p>

                                <ul class="get-touch">
                                    <li><i class="fa fa-map-marker"></i> 22/45, Vijay Nagar</li>
                                    <li><i class="fa fa-mobile"></i> +91 1112223333</li>
                                    <li><i class="fa fa-envelope"></i> heretoserve@sawari.com</li>
                                </ul>
                                <a href="https://www.google.com/maps/place/Vijay+Nagar,+Indore,+Madhya+Pradesh+452010/@22.7532848,75.8936962,3a,75y,136.5h,90t/data=!3m8!1e1!3m6!1sAF1QipMQjIQKH4V5oWwaZp87_29PXLtcNKR8MFbxDsKI!2e10!3e11!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMQjIQKH4V5oWwaZp87_29PXLtcNKR8MFbxDsKI%3Dw234-h106-k-no-pi-2.9338646-ya137.50002-ro0-fo100!7i8704!8i4352!4m13!1m7!3m6!1s0x396302af403406fb:0x5b50834b117f8bab!2sVijay+Nagar,+Indore,+Madhya+Pradesh+452010!3b1!8m2!3d22.7532848!4d75.8936962!3m4!1s0x396302af403406fb:0x5b50834b117f8bab!8m2!3d22.7532848!4d75.8936962#" class="map-show" target="_blank">Show Location</a>
                            </div>
                        </div>
                    </div>
                    <!-- Single Footer Widget End -->
                </div>
            </div>
        </div>
        <!-- Footer Widget End -->
 
                        
        <!-- Footer Bottom Start -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This project is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by Team Sawari, IET DAVV
</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Bottom End -->
    </section>
    <!--== Footer Area End ==-->

    <!--== Scroll Top Area Start ==-->
    <div class="scroll-top">
        <img src="assets/img/scroll-top.png" alt="JSOFT">
    </div>
    <!--== Scroll Top Area End ==-->

    <!--=======================Javascript============================-->
    <!--=== Jquery Min Js ===-->
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <!--=== Jquery Migrate Min Js ===-->
    <script src="assets/js/jquery-migrate.min.js"></script>
    <!--=== Popper Min Js ===-->
    <script src="assets/js/popper.min.js"></script>
    <!--=== Bootstrap Min Js ===-->
    <script src="assets/js/bootstrap.min.js"></script>
    
    <!--=== Gijgo Min Js ===-->
    <script src="assets/js/plugins/gijgo.js"></script>
    <!--=== Vegas Min Js ===-->
    <script src="assets/js/plugins/vegas.min.js"></script>
    <!--=== Isotope Min Js ===-->
    <script src="assets/js/plugins/isotope.min.js"></script>
    <!--=== Owl Caousel Min Js ===-->
    <script src="assets/js/plugins/owl.carousel.min.js"></script>
    <!--=== Waypoint Min Js ===-->
    <script src="assets/js/plugins/waypoints.min.js"></script>
    <!--=== CounTotop Min Js ===-->
    <script src="assets/js/plugins/counterup.min.js"></script>
    <!--=== YtPlayer Min Js ===-->
    <script src="assets/js/plugins/mb.YTPlayer.js"></script>
    <!--=== Magnific Popup Min Js ===-->
    <script src="assets/js/plugins/magnific-popup.min.js"></script>
    <!--=== Slicknav Min Js ===-->
    <script src="assets/js/plugins/slicknav.min.js"></script>

    <!--=== Mian Js ===-->
    <script src="assets/js/main.js"></script>
       </body>
    </body>
</html>

