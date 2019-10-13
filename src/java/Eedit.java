/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.RegisterDao;
import mvc.User;

/**
 *
 * @author root
 */
@WebServlet(urlPatterns = {"/Eedit"})
public class Eedit extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
                //int licence=Integer.parseInt(request.getParameter("licence"));
		 User b=new User();
                 RegisterDao rd=new RegisterDao();
                String eid=request.getParameter("eid");
                String name=request.getParameter("name");   
                String phone=request.getParameter("phone");
                String email=request.getParameter("email");
                String address=request.getParameter("address");
                String position=request.getParameter("position");
                String phone0 = phone.replace("0 ","");
                
                b.setEid(eid);
                b.setName(name);
                b.setPhone(phone);
                b.setEmail(email);
                b.setAddress(address);
                b.setPosition(position);
                
               int i = rd.eedit(b);
               rd.eedit(b);
              /* if(i>0){ */ 
               RequestDispatcher rd1=request.getRequestDispatcher("aloggedin.jsp");
                    ArrayList<User> fetchemployee = rd.fetchemployee();
                        request.setAttribute("fetchemployee", fetchemployee);
                    rd1.include(request, response);
              // }
               //else{
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>booking dATA</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println("<br><br><br><br>Successfully Booked.<br>Your booking's Registration Number is");
           out.println(email+"--<br>--"+i+"--");
            //try{Thread.sleep(15000);}catch(InterruptedException e){System.out.println(e);}  
            out.println("</body>");
            out.println("</html>");
               //}
               
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
