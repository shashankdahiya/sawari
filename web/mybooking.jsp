<%-- 
    Document   : mybooking
    Created on : 10 Mar, 2019, 2:14:10 PM
    Author     : intel
--%>



<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mvc.User"%>
<%@page import="mvc.RegisterDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>My Booking</title>

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
                            <ul>
                                <%session.setAttribute("licence", userName);%>
                                <li ><a href="cloggedin.jsp">Home</a></li>
                                <li class="active"><a  href="#">my booking</a></li>
                                
                                <li><a href="Cprofile">profile</a></li>
                                <li><a >help</a>
                                    <ul>
                                        <li><a href="faq.html">FAQs</a></li>
                                        <li><a href="contact.html">contact</a></li>
                                        <li><a href="insurance.html">insurance</a></li>
                                        
                                    </ul>
                                </li>
                                <li><a onclick="logout()">logout</a></li>
                                
                                
                            </ul><%}
                            else{ %>
                            <ul>
                                <li><a href="cloggedin.jsp">Home</a></li>
                                <li><a >help</a>
                                    <ul>
                                        <li><a href="faq.html">FAQs</a></li>
                                        <li><a href="contact.html">contact</a></li>
                                    </ul>
                                </li>
                                <li><a href="login.jsp">login</a></li>
                                <li><a href="register.jsp">register</a></li>
                            </ul>
                            <% }  }
                            
                            %>
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
    <section id="tips-article-area" class="section-padding">
        <div class="container">
            <div class="row">
                <!-- Section Title Start -->
                <div class="col-lg-12">
                    <div class="section-title  text-center">
                        <h2>My Booking</h2>
                        <span class="title-line"><i class="fa fa-car"></i></span>
                        <p></p>
                    </div>
                </div>
                <!-- Section Title End -->
            </div>

            <!-- Articles Content Wrap Start -->
            <% ArrayList<User> fetchbooking = (ArrayList<User>)request.getAttribute("fetchbooking"); 
                        for(User b: fetchbooking){ %>
            <div class="col-lg-12">
                    <article class="single-article">
                        <div class="row">
                            <!-- Articles Thumbnail Start -->
                            <div class="col-lg-5">
                                <div class="article-thumb">
                                    <img src="assets/img/car/car-<%out.println(b.getRc()) ;%>.jpg" alt="JSOFT">
                                </div>
                            </div>
                            <!-- Articles Thumbnail End -->

                            <!-- Articles Content Start -->
                            <div class="col-lg-7">
                                <div class="display-table">
                                    <div class="display-table-cell">
                                        <div class="article-body">
                                            <h3><a href=""><%out.print("Registration Number: "+b.getRc()) ;%></a></h3>
                                            <div class="article-meta">
                                                
                                            </div>

                                            <div class="article-date">B-ID <span class="month"><%out.println(b.getBillid()) ;%></span></div>

                                            <p style="color: #002a80">Ride Starts On: <%out.println(b.getStart());%><br>Ride Ends On: <%out.println(b.getEnd());%><br>Car's Location: <%out.println(b.getLocation());%></p>
                                            <%  DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                                Date date = new Date();
                                                String currentdate = dateFormat.format(date); 
                                                Date currentdate1 =new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(currentdate);
                                                Date startdate =new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(b.getStart());
                                                if(currentdate1.compareTo(startdate) < 0) { 
                                                    if(b.getRentstatus().equals("canceled")){ 
                                                        %><button href="" class="readmore-btn">Canceled</button><%
                                                            
                                                    }
                                                    else{  
                                                          %><button href="" class="readmore-btn"><%out.println(b.getRentstatus());%></button>
                                                          <form action="rentcancel">
                                                              <input type="hidden" name="billid" value="<%out.println(b.getBillid());%>">
                                                              <input type="hidden" name="licence" value="<%out.println(userName);%>">
                                                              <input type="submit" class="readmore-btn fa fa-long-arrow-right" value="Cancel">
                                                          </form>
                                                          
                                                          <%         
                                                    }
                                                }
                                                else{ 
                                                        %>
                                                          <button href="" class="readmore-btn"><%out.println(b.getRentstatus());%></button>
                                                          <%

                                                }
                                         %>
                                            
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Articles Content End -->
                        </div>
                    </article>
                </div><%}%>
            <!-- Articles Content Wrap End -->
        </div>
    </section>
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

