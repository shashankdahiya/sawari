<%-- 
    Document   : cloggedin
    Created on : 10 Mar, 2019, 2:14:10 PM
    Author     : intel
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import ="java.util.List"%>
<%@page import ="java.util.ArrayList"%>
<%@page import ="java.util.ArrayList"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="mvc.RegisterDao" %>
<%@ page import ="mvc.User" %>
<%@ page import ="javax.servlet.http.HttpServletRequest" %>
<%@page import ="javax.servlet.http.HttpServletResponse" %>
<%@ page import = "javax.servlet.RequestDispatcher" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>Choose Car - Booking</title>

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
   
  <SCRIPT language="JavaScript">
function confirmbook()
{
    var hi= confirm("Tap ok to confirm your ride with sawari ?");
    if (hi== true){
         RequestDispatcher rd = request.getRequestDispatcher("/addtocart");
     
     rd.forward(request, response);
    }
}
 </SCRIPT>
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
                           
                            <% String amount=null , km11=null  , userName = null, pickup = null, start = null, end = null, rc=null ;
                                
                                
                                //int amount1 = 0,  ;
                                int i=0,c=0;
                                //int amount[] ;
                                 //amount = new int[20];
                                
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("licence")) userName = cookie.getValue();
}
                                if(userName !=null){%>
                            <ul><%session.setAttribute("licence", userName);%>
                                <li><a href="cloggedin.jsp">Home</a></li>
                                <li class="active"><a href="#">Choose Car</a></li>
                                
                                <li><a href="mybooking">my booking</a> </li>
                                
                                <li><a href="Cprofile">profile</a></li>
                                <li><a >help</a>
                                    <ul>
                                        <li><a href="faq.html">FAQs</a></li>
                                        <li><a href="contact.html">contact</a></li>
                                        <li><a href="insurance.html">insurance</a></li>
                                        
                                    </ul>
                                </li>
                                <li><a onclick="logout()" >logout</a></li>
                                
                                
                            </ul><%}
                            else{ %>
                            <ul>
                                <li><a href="cloggedin.jsp">Home</a></li>
                                <li><a >help</a>
                                    <ul>
                                        <li><a href=faq.html">FAQs</a></li>
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
    
    <!--== Fun Fact Area End ==-->

    <!--== Choose Car Area Start ==-->
    <section id="choose-car" class="section-padding">
        <div class="container">
            <div class="row">
                <!-- Section Title Start -->
                <div class="col-lg-12">
                    
                    <div class="single-sidebar">
                            <h3>DATE AND TIME FOR YOUR TRIP</h3>

                            <div class="sidebar-body">
                                <ul class="row recent-tips">
                                    <li class="col-6 single-recent-tips">
                                        <div class="recent-tip-thum">
                                            <a href="cloggedin.jsp"><img src="assets/img/we-do/service1-img.png" alt="JSOFT"></a>
                                        </div>
                                        <div class="recent-tip-body">
                                            <h4><a href="cloggedin.jsp"><% List<User> bb = (ArrayList<User>)request.getAttribute("user");
                                             for(User b : bb){
                                                 DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
                                                    start = dateFormat.format(b.getformattedStartTime());
                                                    end = dateFormat.format(b.getformattedEndTime());
                                            out.println(b.getformattedStartTime());%></a></h4>
                                            <span class="date">Pick Up</span>
                                        </div>
                                    </li>

                                    <li class="col-6 single-recent-tips">
                                        <div class="recent-tip-thum">
                                            <a href="cloggedin.jsp"><img src="assets/img/we-do/service2-img.png" alt="JSOFT"></a>
                                        </div>
                                        <div class="recent-tip-body">
                                            <h4><a href="cloggedin.jsp"><% out.println(b.getformattedEndTime()); %></a></h4>
                                            <span class="date">Drop Off</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    <div class="single-sidebar">
                            <h3> KMS PACKAGE</h3>

                            <div class="sidebar-body">
                                <ul class="row recent-tips">
                                    <li class="col-6  single-recent-tips">
                                        <div class="recent-tip-thum">
                                            <a href="cloggedin.jsp"><img src="assets/img/we-do/service3-img.png" alt="JSOFT"></a>
                                        </div>
                                        <div class="recent-tip-body">
                                            <h4><a href="cloggedin.jsp"><%
                                                
                                                pickup = b.getLocation();
                                                int a = b.getKm1(); km11 = new Integer(a).toString();  /*km11= Integer.toString(c);*/ out.println(a);%> Kms</a></h4>
                                            <span class="date">Sawari Classic - You get free Kms</span>
                                        </div>
                                    </li>
                                    <li class="col-6  single-recent-tips">
                                        <div class="recent-tip-thum">
                                            <a href="#"><img src="assets/img/we-do/service3-img.png" alt="JSOFT"></a>
                                        </div>
                                        <div class="recent-tip-body">
                                            <h4><a href="#"> <% 
                                                long kmm = b.getelapsedDays()*24 ;
                                               // duration = kmm + b.getelapsedHours() ;
                                                out.println(b.getelapsedDays()+" Days "+b.getelapsedHours()+" Hours");}%></a></h4>
                                            <span class="date">Duration of your ride with <b>Sawari</b></span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    <div class="section-title  text-center">
                        <h2>Choose your Car</h2>
                        <span class="title-line"><i class="fa fa-car"></i></span>
                        <p>Select within our elite range of premium range.</p>
                    </div>
                </div>
                <!-- Section Title End -->
            </div>

            <div class="row">
                <!-- Choose Area Content Start -->
                <div class="col-lg-12">
                    <div class="choose-content-wrap">
                        <!-- Choose Area Tab Menu -->
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#popular_cars" role="tab" aria-selected="true">popular Cars</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#newest_cars" role="tab" aria-selected="false">newest cars</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#office_map" role="tab" aria-selected="false">Our Office</a>
                            </li>
                        </ul>
                        <!-- Choose Area Tab Menu -->

                        <!-- Choose Area Tab content -->
                        <div class="tab-content" id="myTabContent">
                            <!-- Popular Cars Tab Start -->
                            <div class="tab-pane fade show active" id="popular_cars" role="tabpanel" aria-labelledby="home-tab">
                                <!-- Popular Cars Content Wrapper Start -->
                                <div class="popular-cars-wrap">
                                    <!-- Filtering Menu -->
                                    <div class="popucar-menu text-center">
                                        <a href="#" data-filter="*" class="active">all</a>
                                        <a href="#" data-filter=".eco">Eco</a>
                                        
                                        <a href="#" data-filter=".sedan">Sedan</a>
                                        <a href="#" data-filter=".suv">SUV</a>
                                    </div>

                                    <!-- Filtering Menu -->

                                    <!-- PopularCars Tab Content Start -->
                                    <div class="row popular-car-gird">
                                        <!-- Single Popular Car Start -->
                                       
                                        <% List<User> bb1 = (ArrayList<User>)request.getAttribute("user1");
                                                 long Ecoprice;
                                                 long Sedanprice;
                                                 long Suvprice;
                                        /*for(User b1 : bb1){
                                                 Ecoprice = b1.getEcoprice();
                                                 Sedanprice = b1.getSedanprice();
                                                 Suvprice = b1.getSuvprice();
                                             
                                             }*/
                                            
                                            
                                            ArrayList<User> cardetails = (ArrayList<User>)request.getAttribute("cardetails");
//ArrayList<User> cardetails = new (ArrayList<User>)request.getAttribute("cardetails");
                                            for (User b : cardetails){ if(b.getStatus().equals("available")){
                                                                rc = b.getRc() ;
                                        %>
                                                
                                        <div class="col-lg-4 col-md-6 <%out.println(b.getCategory());%>">
                                            <div class="single-popular-car">
                                                <div class="p-car-thumbnails">
                                                    <a class="car-hover" href="assets/img/car/car-<%out.println(b.getName());%>.jpg">
                                                      <img src="assets/img/car/car-<%out.println(b.getName());%>.jpg" alt="JSOFT">
                                                   </a>
                                                </div>

                                                <div class="p-car-content">
                                                    <h3>
                                                        <a href="#"><%out.println(b.getName());%></a>
                                                        <span class="price"><i class="fa fa-tag"></i> ₹ <%
                                                            for(User b1 : bb1){
                                                            if(b.getCategory().equals("eco")){
                                                                amount = String.valueOf(b1.getEcoprice());
                                                                
                                                                //amount1 =(int)amount;
                                                                out.println(b1.getEcoprice());
                                                            break;
                                                            }
                                                            else{
                                                                if(b.getCategory().equals("sedan")){
                                                                    amount = String.valueOf(b1.getSedanprice());
                                                                    out.println(b1.getSedanprice());
                                                                    break;
                                                                }
                                                                else{
                                                                    if(b.getCategory().equals("suv"))
                                                                        amount = String.valueOf(b1.getSuvprice());
                                                                    out.println(b1.getSuvprice());
                                                                    break;
                                                                }
                                                            }}
                                                            %></span>
                                                    </h3>

                                                    <h5><%out.println(b.getCategory());%></h5>

                                                    <div class="p-car-feature">
                                                        <a href="#"><%out.println(b.getYear());%></a>
                                                        
                                                        <a href="#">manual</a>
                                                        <a href="#">AIR CONDITION</a>
                                                    </div>
                                                        <form action="addtocart" method="post">
                                                            <input type="hidden" name="rc" value="<%out.println(rc);%>" >
                                                            <input type="hidden" name="pickup" value="<%out.println(pickup);%>" >
                                                            <input type="hidden" name="start" value="<%out.println(start);%>" >
                                                              <input type="hidden" name="km" value="<%out.println(km11);%>" >
                                                            <input type="hidden" name="end" value="<%out.println(end);%>" >
                                                            <input type="hidden" name="licence" value="<%out.println(userName);%>" >
                                                             <input type="hidden" name="amount" value="<%out.println(amount);%>" >
                                                            <input type="submit" class="rent-btn" value="Book It">
                                                        </form>
                                                        
                                                        
                                                </div>
                                            </div>
                                        </div><%}
                                            else{%><div class="col-lg-4 col-md-6 <%out.println(b.getCategory());%>">
                                            <div class="single-popular-car">
                                                <div class="p-car-thumbnails">
                                                    <a class="car-hover" href="assets/img/car/car-<%out.println(b.getName());%>.jpg">
                                                      <img src="assets/img/car/car-<%out.println(b.getName());%>.jpg" alt="JSOFT">
                                                   </a>
                                                </div>

                                                <div class="p-car-content">
                                                    <h3>
                                                        <a href="#"><%out.println(b.getName());%></a>
                                                        <span class="price"><i class="fa fa-tag"></i> ₹ <%
                                                            for(User b1 : bb1){
                                                            if(b.getCategory().equals("eco")){
                                                            out.println(b1.getEcoprice());
                                                            break;
                                                            }
                                                            else{
                                                                if(b.getCategory().equals("sedan")){
                                                                    out.println(b1.getSedanprice());
                                                                    break;
                                                                }
                                                                else{
                                                                    if(b.getCategory().equals("suv"))
                                                                    out.println(b1.getSuvprice());
                                                                    break;
                                                                }
                                                            }}
                                                            %></span>
                                                    </h3>

                                                    <h5><%out.println(b.getCategory());%></h5>

                                                    <div class="p-car-feature">
                                                        <a href="#"><%out.println(b.getYear());%></a>
                                                        <a href="#">manual</a>
                                                        <a href="#">AIR CONDITION</a>
                                                    </div>
                                                     <a  class="rent-btn">Under Maintenance</a>
                                                </div>
                                            </div>
                                        </div><%}}%>
                                        <!-- Single Popular Car End -->

                                        <!-- Single Popular Car Start -->
                                        <!-- Single Popular Car End -->
                                    </div>
                                    <!-- PopularCars Tab Content End -->
                                </div>
                                <!-- Popular Cars Content Wrapper End -->
                            </div>
                            <!-- Popular Cars Tab End -->

                            <!-- Newest Cars Tab Start -->
                             
                            <!-- Newest Cars Tab End -->

                            <!-- Office Map Tab -->
                            <div class="tab-pane fade" id="office_map" role="tabpanel" aria-labelledby="contact-tab">
                                <div class="map-area">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3650.6538067244583!2d90.37092511435942!3d23.79533919297639!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c0cce3251ab1%3A0x7a2aa979862a9643!2sJSoft!5e0!3m2!1sen!2sbd!4v1516771096779"></iframe>
                                </div>
                            </div>
                            <!-- Office Map Tab -->
                        </div>
                        <!-- Choose Area Tab content -->
                    </div>
                </div>
                <!-- Choose Area Content End -->
            </div>
        </div>
    </section>
    <!--== Choose Car Area End ==-->

    <!--== Pricing Area Start ==-->
    <section id="pricing-area" class="section-padding overlay">
        <div class="container">
            <div class="row">
                <!-- Section Title Start -->
                <div class="col-lg-12">
                    <div class="section-title  text-center">
                        <h2>Only quality for clients</h2>
                        <span class="title-line"><i class="fa fa-car"></i></span>
                        <p>Quality and best services is what all we sell.</p>
                    </div>
                </div>
                <!-- Section Title End -->
            </div>

            <!-- Pricing Table Conatent Start -->
            <div class="row">
                <!-- Single Pricing Table -->
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="single-pricing-table">
                        <h3>BUSINESS</h3>
                        <h2>₹ 8000</h2>
                        <h5>PER MONTH</h5>

                        <ul class="package-list">
                            <li>FREE VEHICLE DELIVERY</li>
                            <li>DECORATION SERVICE</li>
                            <li>FULL INSURANCE INCLUDED</li>
                            <li>TRAVEL ABROAD</li>
                            <li>ALL INCLUSIVE MINI BAR</li>
                            <li>CHAUFFER INCLUDED IN PRICE</li>
                        </ul>
                    </div>
                </div>
                <!-- Single Pricing Table -->

                <!-- Single Pricing Table -->
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="single-pricing-table">
                        <h3>Trial</h3>
                        <h2>Free</h2>
                        <h5>PER MONTH</h5>

                        <ul class="package-list">
                            <li>FREE VEHICLE DELIVERY</li>
                            <li>OTHER DECOR</li>
                            <li>FULL INSURANCE</li>
                            <li>TRAVEL ABROAD</li>
                            <li>MINI BAR</li>
                            <li>INCLUDED IN PRICE</li>
                        </ul>
                    </div>
                </div>
                <!-- Single Pricing Table -->

                <!-- Single Pricing Table -->
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="single-pricing-table">
                        <h3>standard</h3>
                        <h2>₹ 5000</h2>
                        <h5>PER MONTH</h5>

                        <ul class="package-list">
                            <li>DELIVERY AT STATION</li>
                            <li>ALL DECORS</li>
                            <li>FULL INCLUDED</li>
                            <li>TEAVEL ABROAD</li>
                            <li>ALL MINI BAR</li>
                            <li>CHAUFFER PRICE</li>
                        </ul>
                    </div>
                </div>
                <!-- Single Pricing Table -->
            </div>
            <!-- Pricing Table Conatent End -->
        </div>
    </section>
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

                                            <a href="" class="readmore-btn">Read More <i class="fa fa-long-arrow-right"></i></a>
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

                                            <a href="" class="readmore-btn">Read More <i class="fa fa-long-arrow-right"></i></a>
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

                                            <a href="" class="readmore-btn">Read More <i class="fa fa-long-arrow-right"></i></a>
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


<%//out.println(rc+pickup+start+duration+km+end+userName+amount);%>
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
    <script>

</script>
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

