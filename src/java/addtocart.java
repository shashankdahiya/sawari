
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
import mvc.User;
import mvc.RegisterDao;

@WebServlet(urlPatterns = {"/addtocart"})
public class addtocart extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       User b=new User();
        //int duration=Integer.parseInt(request.getParameter("duration"));
        //long duration =Long.parseLong(request.getParameter("duration"));
         //long km =Long.parseLong(request.getParameter("km"));
          //long amount =Long.parseLong(request.getParameter("amount"));
                String km=request.getParameter("km");
                String amount=request.getParameter("amount");
		String rc=request.getParameter("rc");
                String pickup=request.getParameter("pickup");
		String start=request.getParameter("start");
		String end=request.getParameter("end");
                String licence=request.getParameter("licence") ;
                //int licence1 = Integer.parseInt(licence);
        //List<User> bb1 = new ArrayList<>();
        //int km1 = Integer.parseInt(km);
        b.setKm(km);
        b.setAmount(amount);
        b.setRc(rc);
        b.setLocation(pickup);
        b.setStart(start);
        b.setEnd(end);
        b.setSlicence(licence);
        RegisterDao rd = new RegisterDao();
        int billid = rd.addbill(b);
        b.setBillid(billid);
        //String carname = rd.getcarname(b);
        //b.setCarname(carname);
        rd.addrented(b);
        //String carname = rd.getcarname(b);
        
        
        //bb1.add(b);
        /*Sout.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>booking dATA</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<br><br><br><br>Successfully Booked.<br>Your booking's Registration Number is");
            out.println("<br>rc is :"+rc);
            //try{Thread.sleep(15000);}catch(InterruptedException e){System.out.println(e);}  
            out.println("</body>");
            out.println("</html>");
        */
            
        //request.setAttribute("carname", carname);
        //request.setAttribute("billid", carname);
        
        ArrayList<User> fetchbooking = rd.fetchbooking(licence);
        //ArrayList<User> fetchbill = rd.fetchbill(b);
        
        request.setAttribute("fetchbooking", fetchbooking);
        RequestDispatcher rd1 = request.getRequestDispatcher("mybooking.jsp");
        //RequestDispatcher rd1 = request.getRequestDispatcher("test.jsp");
                 rd1.include(request, response);
            
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