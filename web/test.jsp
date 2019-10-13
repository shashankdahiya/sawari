<%-- 
    Document   : test
    Created on : 18 Mar, 2019, 4:57:09 PM
    Author     : intel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <br>
        <br><br><br><br><br>
        <% ArrayList<User> fetchcustomer = (ArrayList<User>)request.getAttribute("fetchcar"); 
            //ArrayList<User> fetchcustomer= new ArrayList<>();
            //RegisterDao rd =new RegisterDao() ;
            
            for(User b: fetchcustomer){ 
                            
                    out.println(b.getRc()) ;%>--     --<%
                            out.println(b.getYear()) ;%>--     --<%
                            out.println(b.getCategory()) ;%>--     --<%
                          //  out.println(b.getKm()) ;%>--     --<%
                            //out.println(b.getStart()) ;%>--     --<%
                            out.println(b.getName()) ;%>--     --<%
                            out.println(b.getStatus()) ;%>--     --<%
                            
                            
                            //out.println(userid+"   "+licence);
                            %><br><%
                }
                    
                %>
    </body>
</html>
