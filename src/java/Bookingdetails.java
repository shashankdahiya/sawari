
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
//import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.time.LocalDateTime;
//import java.time.LocalTime;
//import java.time.ZonedDateTime;
import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.HashSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.RegisterDao;
//import static mvc.RegisterDao.getCon;
import mvc.User;

/**
 *
 * @author root
 */
@WebServlet(urlPatterns = {"/Bookingdetails"})
public class Bookingdetails extends HttpServlet {
    public static Connection getCon1() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/sawari","root","");
	return con;
	}
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        User b=new User();
        Connection con; 
        
        String location=request.getParameter("location");
        String licence0=request.getParameter("licence");
        //int licence = Integer.parseInt(licence0);
		String startdate0=request.getParameter("startdate");
                String startdate1 = startdate0.concat(":00");
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
SimpleDateFormat output = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date d = sdf.parse(startdate1);
//Date d2 = output.parse(startdate1);
String formattedStartTime = output.format(d);
                Date d2 = output.parse(formattedStartTime);
                String enddate0=request.getParameter("enddate");
                String enddate1 = enddate0.concat(":00");
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
SimpleDateFormat output1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date d1 = sdf1.parse(enddate1);

String formattedEndTime = output1.format(d1);
                Date d3 = output1.parse(formattedEndTime);
                
		int km=Integer.parseInt(request.getParameter("km"));
		
		b.setLocation(location);
                b.setformattedStartTime(d2);
                
		b.setformattedEndTime(d3);
		
                b.setKm1(km);
	RegisterDao rd=new RegisterDao(); 
        //-----------------------------------------------------------------------------------------------------
       
        
        
       long different = d3.getTime() - d2.getTime();
		
		out.println("startDate : " + d2);
		out.println("endDate : "+ d3);
		out.println("different : " + different);
		
		long secondsInMilli = 1000;
		long minutesInMilli = secondsInMilli * 60;
		long hoursInMilli = minutesInMilli * 60;
		long daysInMilli = hoursInMilli * 24;

		long elapsedDays = different / daysInMilli;
		different = different % daysInMilli;
		
		long elapsedHoursnott = different / hoursInMilli;
		different = different % hoursInMilli;
		
		long elapsedMinutes = different / minutesInMilli;
		different = different % minutesInMilli;
		
		long elapsedSeconds = different / secondsInMilli;
		
		out.printf(
		    "%d days, %d hours, %d minutes, %d seconds%n", 
		    elapsedDays,
		    elapsedHoursnott, elapsedMinutes, elapsedSeconds);
                long elapsedDays1 = elapsedDays*24;
                long elapsedHours = elapsedDays1 + elapsedHoursnott;
                b.setelapsedDays(elapsedDays);
                b.setelapsedHours(elapsedHoursnott);
                //b.setelapsedDays(elapsedMinutes);
                 List<User> bb1 = new ArrayList<>();
                                     String membershipid = null;
                try { 
                    con = getCon1();
                    int i=0;

                    Statement stmt=null;
                    stmt = con.createStatement();
                       
                    String qr="select `membershipid` from `customer` where `licence` ="+licence0;
                    ResultSet rs=stmt.executeQuery(qr);
                    while(rs.next()){
                        membershipid = rs.getString("membershipid");
                    }
		con.close();stmt.close();
                } catch (ClassNotFoundException | SQLException e) {
			System.out.println("db error =="+e);
		}
                
                  long hc, kmc, bc, tc;
               // km = 50;
                //elapsedHours = 3;
                 if(elapsedHours==3||elapsedHours==2||elapsedHours==1){
                    hc=180;
                    kmc = 12*km;
                    tc= hc+kmc;
                    if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                }
                else{if(elapsedHours>3&&elapsedHours<24){
                       hc=50*elapsedHours;
                       kmc=12*km;
                       tc=hc+kmc;
                        if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                }
                    else{
                    if(elapsedHours>=24&&elapsedHours<72){
                               bc=700;
                               long a=elapsedHours-24;
                                       hc=a*50;
                               if(km<=80){
                                   // int km0 = km-80;
                                    //int km1 = 12*km0;
                                    tc=1700;
                                     if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                               }
                               else{
                                   if(km>80&&km<=120){
                                       //bc = 700;
                                       kmc = 12*km;
                                       tc = bc + kmc+hc;
                                        if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                                       
                                   }
                                   else{
                                       if(km>120&&km<=240){
                                           int km0 = km-120;
                                           int km1 = km0*8;
                                           long kmc0 = 12*120;
                                           kmc = kmc0+km1;
                                           //bc = 700;
                                           tc = bc + kmc+hc;
                                            if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                                       }
                                       else{
                                           if(km>240){
                                               int km0 = km-240;
                                           int km1 = km0*7;
                                           long kmc0 = 12*120;
                                           long kmc1 = 8*120;
                                           kmc = kmc0+kmc1+km1;
                                           //bc = 700;
                                           tc = bc + kmc+hc;
                                            if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                                           }
                                       
                                       }
                                   }
                               }
                    }
                    else{
                        if(elapsedHours == 72){
                            if(km>500){
                            int kmc0= km - 500;
                            kmc = 12*kmc0;
                            tc = 5000+kmc;
                             if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                                    }
                            else{
                                tc = 5000;
                                 if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                            }
                        }
                        else{
                                if(elapsedHours>72){
                                    if(km>500){
                                        long elapsedHours0 = elapsedHours - 72;
                                        hc = 50*elapsedHours0;
                                        int km0 = km - 500;
                                        kmc= 12*km0;
                                        tc = 5000+hc + kmc;
                                         if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                                    }
                                    else{
                                        long elapsedHours0 = elapsedHours - 72;
                                        hc = 50*elapsedHours0;
                                        tc = 5000 + hc;
                                         if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setEcoprice(tc);bb1.add(b);}
                    else{b.setEcoprice(tc);bb1.add(b);}
                                    }
                                
                                }
                                
                    }
                                
                    } 
                            }
                    
                }
               
                //eco price setter ends
                if(elapsedHours==3||elapsedHours==2||elapsedHours==1){
                    hc=200;
                    kmc = 13*km;
                    tc= hc+kmc;
                    if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                }
                else{if(elapsedHours>3&&elapsedHours<24){
                       hc=60*elapsedHours;
                       kmc=13*km;
                       tc=hc+kmc;
                       if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                }
                    else{
                    if(elapsedHours>=24&&elapsedHours<72){
                               bc=900;
                               long a=elapsedHours-24;
                                       hc=a*60;
                               if(km<=80){
                                   // int km0 = km-80;
                                    //int km1 = 12*km0;
                                    tc=1900;
                                    if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                               }
                               else{
                                   if(km>80&&km<=120){
                                       //bc = 700;
                                      
                                       kmc = 13*km;
                                       tc = bc + kmc+hc;
                                       if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                                       
                                   }
                                   else{
                                       if(km>120&&km<=240){
                                           int km0 = km-120;
                                           int km1 = km0*11;
                                           long kmc0 = 13*120;
                                          
                                           kmc = kmc0+km1;
                                           //bc = 700;
                                           tc = bc + kmc+hc;
                                           if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                                       }
                                       else{
                                           if(km>240){
                                               int km0 = km-240;
                                           int km1 = km0*10;
                                           long kmc0 = 13*120;
                                           long kmc1 = 11*120;
                                           kmc = kmc0+kmc1+km1;
                                           //bc = 700;
                                           tc = bc + kmc+hc;
                                           if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                                           }
                                       
                                       }
                                   }
                               }
                    }
                    else{
                        if(elapsedHours == 72){
                            if(km>500){
                            int kmc0= km - 500;
                            kmc = 13*kmc0;
                            tc = 6500+kmc;
                            if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                                    }
                            else{
                                tc = 6500;
                                if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                            }
                        }
                        else{
                                if(elapsedHours>72){
                                    if(km>500){
                                        long elapsedHours0 = elapsedHours - 72;
                                        hc = 60*elapsedHours0;
                                        int km0 = km - 500;
                                        kmc= 13*km0;
                                        tc =6500+hc + kmc;
                                        if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                                    }
                                    else{
                                        long elapsedHours0 = elapsedHours - 72;
                                        hc = 60*elapsedHours0;
                                        tc = 6500 + hc;
                                        if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSuvprice(tc);bb1.add(b);}
                    else{b.setSuvprice(tc);bb1.add(b);}
                                    }
                                
                                }
                                
                    }
                                
                    } 
                            }
                    
                }
                //suv price setter ends
    if(elapsedHours==3||elapsedHours==2||elapsedHours==1){
                    hc=250;
                    kmc = 15*km;
                    tc= hc+kmc;
                    if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                }
                else{if(elapsedHours>3&&elapsedHours<24){
                       hc=75*elapsedHours;
                       kmc=15*km;
                       tc=hc+kmc;
                       if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                }
                    else{
                    if(elapsedHours>=24&&elapsedHours<72){
                               bc=1050;
                               long a=elapsedHours-24;
                                       hc=a*75;
                               if(km<=80){
                                   // int km0 = km-80;
                                    //int km1 = 12*km0;
                                    tc=2000;
                                    if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                               }
                               else{
                                   if(km>80&&km<=120){
                                       //bc = 700;
                                       kmc = 15*km;
                                       tc = bc + kmc+hc;
                                       if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                                       
                                   }
                                   else{
                                       if(km>120&&km<=240){
                                           int km0 = km-120;
                                           int km1 = km0*12;
                                           long kmc0 = 15*120;
                                           kmc = kmc0+km1;
                                           //bc = 700;
                                           tc = bc + kmc+hc;
                                           if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                                       }
                                       else{
                                           if(km>240){
                                               int km0 = km-240;
                                           int km1 = km0*11;
                                           long kmc0 = 15*120;
                                           long kmc1 = 12*120;
                                           kmc = kmc0+kmc1+km1;
                                           //bc = 700;
                                           tc = bc + kmc+hc;
                                           if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                                           }
                                       
                                       }
                                   }
                               }
                    }
                    else{
                        if(elapsedHours == 72){
                            if(km>500){
                            int kmc0= km - 500;
                            kmc = 15*kmc0;
                            tc = 7200+kmc;
                            if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                                    }
                            else{
                                tc = 7200;
                                if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                            }
                        }
                        else{
                                if(elapsedHours>72){
                                    if(km>500){
                                        long elapsedHours0 = elapsedHours - 72;
                                        hc = 75*elapsedHours0;
                                        int km0 = km - 500;
                                        kmc= 15*km0;
                                        tc = 7200+hc + kmc;
                                        if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                                    }
                                    else{
                                        long elapsedHours0 = elapsedHours - 72;
                                        hc = 75*elapsedHours0;
                                        tc = 7200 + hc;
                                        if(membershipid.equals("yes")){tc = tc*3; tc= tc/4; b.setSedanprice(tc);bb1.add(b);}
                    else{b.setSedanprice(tc);bb1.add(b);}
                                    }
                                
                                }
                                
                    }
                                
                    } 
                            }
                    
                } //suv price setter ends
    
    request.setAttribute("user1", bb1);
    //-----------------------------------------------------------------------------rate formules
               
                ArrayList<User> cardetails = new ArrayList<>();
        try { 
                    con = getCon1();
                    int i=0;
                    
                    Statement stmt=null;
                    stmt = con.createStatement();
                       
                    String qr="select * from car";
                    ResultSet rs=stmt.executeQuery(qr);
		//PreparedStatement ps=con.prepareStatement(qr);
		//ResultSet rs=ps.executeQuery(); 
               out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>booking dATA</title>");            
            out.println("</head>");
            out.println("<body>");
                
               
                
                
    while (rs.next()) {
        User bbb = new User();
        bbb.setRc(rs.getString("rc")); 
        bbb.setName(rs.getString("name")); 
        bbb.setYear(rs.getInt("year")); 
        bbb.setCategory(rs.getString("category")); 
        bbb.setStatus(rs.getString("status"));
        cardetails.add(bbb);
              }
    
               
    
                  
    
    request.setAttribute("cardetails", cardetails);
                //for(int j = 0;j<5;j++)
                //{out.println("<h1><br><br><br><br><br><br><br><br><br>"+membershipid+"</h1>");}
                out.println("</body>");
            out.println("</html>");
                //b.setRc(rc);
		con.close();stmt.close();
                } catch (ClassNotFoundException | SQLException e) {
			System.out.println("db error =="+e);
		}
            /* TODO output your page here. You may use following sample code. */
                
                
                
                List<User> bb = new ArrayList<>();
                bb.add(b);
                request.setAttribute("user", bb);
                
RequestDispatcher rd1 = request.getRequestDispatcher("carinfo.jsp");
                 rd1.include(request, response);
                
               // RequestDispatcher rd1=request.getRequestDispatcher("carinfo.jsp");
               
        
        
        //----------------------------------------------------------------------------------------------------------
        
           
    
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



