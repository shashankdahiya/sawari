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
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
		
                String type=request.getParameter("type");
                String password=request.getParameter("password");
                String pk=request.getParameter("pk");
                User b=new User();
                b.setPassword(password);
                RegisterDao rd=new RegisterDao();
                if("Admin".equals(type)){
                    b.setAdminid(pk);
                    int i= rd.Alogin(b);
                    RequestDispatcher rd1=request.getRequestDispatcher("aloggedin.jsp");
                    RequestDispatcher rd2=request.getRequestDispatcher("login.jsp");
                    if(i>0) {
                        Cookie aloginCookie = new Cookie("adminid",b.getAdminid());
			//setting cookie to expiry in 30 mins
			//loginCookie.setMaxAge(30*60);
			response.addCookie(aloginCookie);
                        ArrayList<User> fetchemployee = rd.fetchemployee();
                        request.setAttribute("fetchemployee", fetchemployee);
                    rd1.include(request, response);
                    }
                    else {
                        request.setAttribute("errorMessage", "Invalid ID or password"); 
                        rd2.include(request, response);
                    }
                }
                
                if("Employee".equals(type)){
                    b.setEid(pk);
                    int i= rd.Elogin(b);
                    RequestDispatcher rd1=request.getRequestDispatcher("eloggedin.jsp");
                    RequestDispatcher rd2=request.getRequestDispatcher("login.jsp");
                    if(i>0) {
                        Cookie eloginCookie = new Cookie("eid",b.getEid());
			//setting cookie to expiry in 30 mins
			//loginCookie.setMaxAge(30*60);
			response.addCookie(eloginCookie);
                        ArrayList<User> fetchbookings = rd.fetchbookings();
                        request.setAttribute("fetchbookings", fetchbookings);
                    rd1.include(request, response);
                    }
                    else {request.setAttribute("errorMessage", "Invalid ID or password"); 
                        rd2.include(request, response);}
                } 

                if("Customer".equals(type)){
                    int Epk = Integer.parseInt(pk);
                    b.setLicence(Epk);
                    int i= rd.Clogin(b);
                    RequestDispatcher rd1=request.getRequestDispatcher("cloggedin.jsp");
                    RequestDispatcher rd2=request.getRequestDispatcher("login.jsp");
                    if(i>0) {
                        Cookie cloginCookie = new Cookie("licence",Integer.toString(b.getLicence()));
                        //Cookie cloginCookie = new Cookie("licence",b.getLicence());
			//setting cookie to expiry in 30 mins
			//loginCookie.setMaxAge(30*60);
			response.addCookie(cloginCookie);
                    rd1.include(request, response);
                    }
                    else {request.setAttribute("errorMessage", "Invalid ID or password"); 
                        rd2.include(request, response);}
                }
                /*String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
                String membershipid=request.getParameter("membershipid");
		User b=new User();
		//b.setLicence(licence);
                b.setName(name);
                b.setPhone(phone);
		b.setEmail(email);
		b.setPassword(password);
                b.setMembershipid(membershipid);
	RegisterDao rd=new RegisterDao();
	int i= rd.addRecord(b);
            
        RequestDispatcher rd1=request.getRequestDispatcher("index.jsp");
	       //System.out.println(i);
	if(i>0) {
                rd1.include(request, response);
        }    
        else {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Registration Failed. </h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
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
