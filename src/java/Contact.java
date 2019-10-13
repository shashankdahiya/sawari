
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mvc.User;
import mvc.RegisterDao;

@WebServlet(urlPatterns = {"/Contact"})
public class Contact extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       User b=new User();
       String name = request.getParameter("name");
       String email = request.getParameter("email");
       String subject = request.getParameter("subject");
       String msg = request.getParameter("msg");
        RegisterDao rd= new RegisterDao();
       b.setName(name);
       b.setEmail(email);
       b.setSubject(subject);
       b.setMsg(msg);
                     int i = rd.addContact(b);
                     if(i>0){
                         RequestDispatcher rd1 = request.getRequestDispatcher("contactdone.html");
                 rd1.include(request, response);

                     }
                     else{
                             out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>booking dATA</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println(userid + "<br>"+licence);
            out.println("</body>");
            out.println("</html>");
       // request.setAttribute("fetchadmin", fetchadmin);
        RequestDispatcher rd1 = request.getRequestDispatcher("cloggedin.jsp");
       // RequestDispatcher rd1 = request.getRequestDispatcher("test.jsp");
                 rd1.include(request, response);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(Bookingdetails.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(Bookingdetails.class.getName()).log(Level.SEVERE, null, ex);
        }
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