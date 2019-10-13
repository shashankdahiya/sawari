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
import javax.servlet.http.HttpSession;

import mvc.RegisterDao;
import mvc.User;

/**
 *
 * @author root
 */
@WebServlet(urlPatterns = {"/Cadd"})
public class Cadd extends HttpServlet {

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
                String rc=request.getParameter("rc");
		String name=request.getParameter("name");
                int year=Integer.parseInt(request.getParameter("year"));
		String category=request.getParameter("category");
		String status=request.getParameter("status");
                User b=new User();
		b.setRc(rc);
                b.setName(name);
                b.setYear(year);
		b.setCategory(category);
		b.setStatus(status);
               
	RegisterDao rd=new RegisterDao();
        RequestDispatcher rd1=request.getRequestDispatcher("Editcar");
        //RequestDispatcher rd2=request.getRequestDispatcher("eerror.jsp");
	int cerror = rd.Cerror(rc);
        if(cerror >0)
            {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Register</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1><b>Registration Failed. Registration number already exist</b></h1><br>");
                out.println("<br><h1><a href=\"caradd.jsp\">Add Car</a></h1>");
                out.println("</body>");
                out.println("</html>");  
            }   
        else    
        {   
                 int i= rd.addCar(b);
                if(i>0)
                rd1.include(request, response);
                else
                {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet Register</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1><b>Registration Failed. Check New Car Credentials.</b></h1><br>");
                    out.println("<br><h1><a href=\"caradd.jsp\">Add Car</a></h1>");
                    //out.println(i);
                    out.println("</body>");
                    out.println("</html>"); 
                }
             
        }
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
