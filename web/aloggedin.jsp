<%-- 
    Document   : aloggedin
    Created on : 22 Mar, 2019, 7:25:39 PM
    Author     : intel
--%>

<%@page import="java.util.ArrayList"%>
<%@ page import ="mvc.RegisterDao" %>
<%@page import="mvc.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>Employees</title>

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
	if(cookie.getName().equals("adminid")) userName = cookie.getValue();
}
                                if(userName !=null){%>
                           
                                <ul><%session.setAttribute("adminid", userName);%>
                                <li class="active"><a>Employee</a>
                                    <ul>
                                        <li><a href="#">Employee Details</a></li>
                                        <li><a href="addemployee.jsp">Add</a></li>
                                        
                                        
                                    </ul>
                                </li>
                                
                               <li><a>Car</a>
                                    <ul>
                                        <li><a href="Editcar">Modify</a></li>
                                        
                                    </ul>
                                </li> 
                                
                                
                                <li><a href="Bookings">Bookings</a></li>
                                <li><a href="Aprofile">profile</a></li>
                                
                                <li><a onclick="logout()">logout</a></li>
                                
                                
                            </ul>
                                <%}
                            else{ %>
                            <ul>
                                
                                <li><a href="login.jsp">login</a></li>
                                
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
    <section id="page-title-area" class="section-padding overlay">
        <div class="container">
            <div class="row">
                <!-- Page Title Start -->
                <div class="col-lg-12">
                    <div class="section-title  text-center">
                        <h2>Employee Details</h2>
                              
                        <span class="title-line"><i class="fa fa-car"></i></span>
                        <p>View Details of all of the company employees and Modify.</p>
                    </div>
                </div>
                <!-- Page Title End -->
            </div>
        </div>
    </section>
    <!--== Page Title Area End ==-->

    <!--== Login Page Content Start ==-->
    <section id="lgoin-page-wrap" class="section-padding">
        <div class="container">
            <div class="row">
                <div class="m-auto">
                	<div class="login-page-content">
                		<div class="login-form">
                			<h3>Details</h3>
                                        <div> <div class="font-weight-bold table row">
                                                <div class="col-1 border border-dark">Employee ID</div>
                                                        <div class="col-1 border border-dark">Name</div>
                                                    <div class="col-2 border border-dark">Phone</div>
                                                    <div class="col-3 border border-dark">Email</div>
                                                        <div class="col-2 border border-dark">Address</div>
                                                    <div class="col-1 border border-dark">Position</div>
                                                    <div class="col-1 border border-dark">MOD1</div>
                                                   <div class="col-1 border border-dark">MOD2</div>
                                                </div>
                                            <div class="table row">
                                            <%
                                                
                                            ArrayList<User> fetchemployee = (ArrayList<User>)request.getAttribute("fetchemployee"); 
                                            String eid, name, phone, email, address, position;
                                            for(User b: fetchemployee){
                                            %>
                                            
                                                <div class="col-1"><%out.println(b.getEid());%></div>
                                               <div class="col-1"><%out.println(b.getName());%></div>
                                              <div class="col-2"><%out.println(b.getPhone());%></div>
                                                <div class="col-3"><%out.println(b.getEmail());%></div>
                                                <div class="col-2"><%out.println(b.getAddress());%></div>
                                                <div class="col-1"><%out.println(b.getPosition());%></div>
                                                
                                                <form class="col-1" action="Edelete" method="post">
                                                    <input type="text" style="display:none" name="eid" value="<%out.println(b.getEid());%>" >
                                                    <div class="log-btn">
                                                    <a><button type="submit">  <b>DEL</b></button></a>
								</div>
                                                </form>
                                                    
                                                    <form class="col-1" action="eedit.jsp" method="post">
                                                    <input type="hidden" name="eid" value="<%out.println(b.getEid());%>" >
                                                    <input type="hidden" name="name" value="<%out.println(b.getName());%>" >
                                                    <input type="hidden" name="phone" value="<%out.println(b.getPhone());%>" >
                                                    <input type="hidden" name="email" value="<%out.println(b.getEmail());%>" >
                                                    <input type="hidden" name="address" value="<%out.println(b.getAddress());%>" >
                                                    <input type="hidden" name="position" value="<%out.println(b.getPosition());%>" >
                                                    <div class="log-btn">
                                                    <a href=""><button type="submit">  <b>EDIT</b></button></a>
								</div>
                                                </form>
                                                
                                            <%}%>
                                        </div></div>
                                </div>
                		
                		
                		 
                		<div class="login-menu"><br><br>
                			<a href="about.html">About</a>
                			<span>|</span>
                			<a href="contact.html">Contact</a>
                		</div>
                	</div>
                </div>
        	</div>
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
                                <p>Saawari is a Self‐Drive car rental service. We save you 
the cost and hassle of owning a car while giving you all the good parts:

Door Step service, Mobility and No Dependency.</p>

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
                                        <a href="https://www.smartertravel.com/car-rental-tips/">
                                           10 car rental tips 
                                           <i class="fa fa-long-arrow-right"></i>
                                       </a>
                                    </li>
                                    <li>
                                        <a href="https://www.smartertravel.com/10-things-not-renting-car/">
                                          Things not to do when renting a car
                                           <i class="fa fa-long-arrow-right"></i>
                                       </a>
                                    </li>
                                    <li>
                                        <a href="https://theworldpursuit.com/rental-car-tips/">
                                           Tips for 1st timers 
                                           <i class="fa fa-long-arrow-right"></i>
                                       </a>
                                    </li>
                                    <li>
                                        <a href="https://www.bradsdeals.com/blog/save-on-rental-cars">
                                            Tips to save money
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
                                    <li><i class="fa fa-map-marker"></i> 800/8, Kazipara, Dhaka</li>
                                    <li><i class="fa fa-mobile"></i> +880 01 86 25 72 43</li>
                                    <li><i class="fa fa-envelope"></i> Sawaari@gmail.com</li>
                                </ul>
                                <a href="https://goo.gl/maps/b5mt45MCaPB2" class="map-show" target="_blank">Show Location</a>
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved  <i class="fa fa-heart-o" aria-hidden="true"></i>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Bottom End -->
    </section>    <!--== Footer Area End ==-->

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


