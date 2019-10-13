
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

@WebServlet(urlPatterns = {"/byecancelrent"})
public class byecancelrent extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       User b=new User();
       String billid= request.getParameter("billid") ;
      
       //String licence=request.getParameter("licence") ;
       //HttpSession session=request.getSession();  
       //Object userid = session.getAttribute("billid");    
                            //String billid = billid0.toString();
       RegisterDao rd= new RegisterDao();
       rd.cancelrent(billid);
        //request.setAttribute("fetchbooking", fetchbooking);
        //RequestDispatcher rd1 = request.getRequestDispatcher("addtocart");
        //RequestDispatcher rd1 = request.getRequestDispatcher("test.jsp");
                // rd1.include(request, response);
                 ArrayList<User> fetchbookings = rd.fetchbookings();
        //ArrayList<User> fetchbill = rd.fetchbill(b);
        
        request.setAttribute("fetchbookings", fetchbookings);
        RequestDispatcher rd1 = request.getRequestDispatcher("eloggedin.jsp");
                 rd1.include(request, response);
                //response.setHeader("Refresh", "0; URL=http://localhost:8084/sawari/mybooking.jsp");
                //response.setHeader("Refresh", "0; URL=http://localhost:8084/sawari/test.jsp");
            
      
      out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
           // out.println(billid);
            out.println("</body>");
            out.println("</html>");
      
    }

private Object SimpleDateFormat(String ddmmyyyy) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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