/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc;

import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;


public class RegisterDao {

    public static Connection getCon() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/sawari","root","");
	return con;
	}
	public int addRecord(User b)
	{
		int i= 0;
                Connection con; 
                try {
                    con = getCon();
                String qr="INSERT INTO `customer` (`licence`, `name`, `phone`, `email`, `password`, `membershipid`) VALUES (?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setInt(1, b.getLicence());
                ps.setString(2, b.getName());
                ps.setString(3, b.getPhone());
		ps.setString(4, b.getEmail());
		ps.setString(5, b.getPassword());
                ps.setString(6, b.getMembershipid());
		i=ps.executeUpdate();
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return i;
	}
        public int addContact(User b)
	{
		int i= 0;
                Connection con; 
                try {
                    con = getCon();
                String qr="INSERT INTO `contact` (`name`, `email`, `subject`, `message`) VALUES (?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, b.getName());
                ps.setString(2, b.getEmail());
                ps.setString(3, b.getSubject());
		ps.setString(4, b.getMsg());
		i=ps.executeUpdate();
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return i;
	}
        public int addEmployee(User b)
	{
                //String ph = b.getPassword();
                
		int i= 0;
                Connection con; 
                try {
                    con = getCon();
                String qr="INSERT INTO `employee` (`eid`, `name`, `password`, `phone`, `email`, `address`, `position`) VALUES (?,?,?,?,?,?,?);";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, b.getEid());
                ps.setString(2, b.getName());
                ps.setString(3, b.getPassword());
                ps.setString(4, b.getPhone());
		ps.setString(5, b.getEmail());
                ps.setString(6, b.getAddress());
		ps.setString(7, b.getPosition());
                i=ps.executeUpdate();
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return i;
	}
        public int addCar(User b)
	{
                //String ph = b.getPassword();
                
		int i= 0;
                Connection con; 
                try {
                    con = getCon();
                String qr="INSERT INTO `car` (`rc`, `name`, `year`, `category`, `status`) VALUES (?,?,?,?,?);";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, b.getRc());
                ps.setString(2, b.getName());
                ps.setInt(3, b.getYear());
                ps.setString(4, b.getCategory());
		ps.setString(5, b.getStatus());
                i=ps.executeUpdate();
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return i;
	}
        public String addrented(User b)
	{
		String carname = null;
                Connection con;
                
                try {
                    con = getCon();
                   
                    String qr="INSERT INTO `rented` (`rc`, `pickup`, `start`, `km`, `end`, `rentstatus` , `licence`,`billid`) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, b.getRc());
                ps.setString(2, b.getLocation());
                ps.setString(3, b.getStart());
		ps.setString(4, b.getKm());
		ps.setString(5, b.getEnd());
                ps.setString(6, "confirm");
		ps.setString(7, b.getSlicence());
                ps.setInt(8, b.getBillid());
                //ps.setString(9, b.getCarname());
                ps.executeUpdate();
                
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return carname;
	}
        
        public int addbill(User b)
	{
		int i= 0;
                Connection con; 
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                Date date = new Date();
                date.setTime(timestamp.getTime());
                String timestamp1 = new SimpleDateFormat("dd/mm/yyyy HH:mm:ss").format(date);
                try {
                    con = getCon();
                    Statement stmt=null;
                    
                String qr="INSERT INTO `bill` (`licence`, `billdate` , `amount`) VALUES (?,?,?)";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, b.getSlicence());
                ps.setString(2, timestamp1);
                ps.setString(3, b.getAmount());
                ps.executeUpdate();
                
                    stmt = con.createStatement();
                       
                    String qr1="select billid from bill where billdate =\""+ timestamp1 +"\"";
                    ResultSet rs=stmt.executeQuery(qr1);
                    while(rs.next()){
                        i = rs.getInt("billid");
                    }
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return i;
	}
        public List<User> fetchcustomer(String licence0){
            Connection con;
            String membershipid=null;
            List<User> fetchcustomer = new ArrayList<User>();
            
            try { 
                    con = getCon();
                    int i=0;

                    Statement stmt=null;
                    stmt = con.createStatement();
                       
                    String qr="select * from `customer` where `licence` ="+licence0;
                    ResultSet rs=stmt.executeQuery(qr);
                    while(rs.next()){User b = new User();
                                b.setName(rs.getString("name"));
                                b.setPhone(rs.getString("phone")); 
                                b.setEmail(rs.getString("email"));
                                b.setMembershipid(rs.getString("membershipid"));
                                fetchcustomer.add(b);
                    }
                    
		con.close();stmt.close();
                } catch (ClassNotFoundException | SQLException e) {
			System.out.println("db error =="+e);
		}
        return fetchcustomer;
        
        }
        public List<User> fetchadmin(String adminid){
            Connection con;
            //String membershipid=null;
            List<User> fetchadmin = new ArrayList<User>();
            
            try { 
                    con = getCon();
                    int i=0;

                    Statement stmt=null;
                    stmt = con.createStatement();
                       
                    String qr="select * from `admin` where `adminid` =\""+adminid+"\"";
                    ResultSet rs=stmt.executeQuery(qr);
                    while(rs.next()){User b = new User();
                                b.setAdminid(adminid);
                                b.setName(rs.getString("name"));
                                b.setPhone(rs.getString("phone")); 
                                b.setEmail(rs.getString("email"));
                                b.setAddress(rs.getString("address"));
                                fetchadmin.add(b);
                    }
                    
		con.close();stmt.close();
                } catch (ClassNotFoundException | SQLException e) {
			System.out.println("db error =="+e);
		}
        return fetchadmin;
        
        }
        public List<User> fetchemployee(String eid){
            Connection con;
            //String membershipid=null;
            List<User> fetchemployee = new ArrayList<User>();
            
            try { 
                    con = getCon();
                    int i=0;

                    Statement stmt=null;
                    stmt = con.createStatement();
                       
                    String qr="select * from `employee` where `eid` =\""+eid+"\"";
                    ResultSet rs=stmt.executeQuery(qr);
                    while(rs.next()){User b = new User();
                                b.setEid(eid);
                                b.setName(rs.getString("name"));
                                b.setPhone(rs.getString("phone")); 
                                b.setEmail(rs.getString("email"));
                                b.setAddress(rs.getString("address"));
                                b.setPosition(rs.getString("position"));
                                fetchemployee.add(b);
                    }
                    
		con.close();stmt.close();
                } catch (ClassNotFoundException | SQLException e) {
			System.out.println("db error =="+e);
		}
        return fetchemployee    ;
        
        }
        public String turnmembership(String licence0){
            Connection con;
            String membershipid=null;
            
            try { 
                    con = getCon();
                    int i=0;

                    Statement stmt=null;
                    stmt = con.createStatement();
                       
                    String qr="UPDATE `customer` SET `membershipid` = 'yes' WHERE `customer`.`licence` ="+licence0;
                    stmt.executeUpdate(qr);
                    
		con.close();stmt.close();
                } catch (ClassNotFoundException | SQLException e) {
			System.out.println("db error =="+e);
		}
        return membershipid;
        
        }
        public ArrayList<User> fetchbooking(String licence)
	{
                Connection con; 
                ArrayList<User> fetchbooking = new ArrayList<>();
               
                try {
                    con = getCon();
                    
                    Statement stmt=null;
                
                    stmt = con.createStatement();
                    String qr1="select * from rented where licence ="+ licence;
                    ResultSet rs=stmt.executeQuery(qr1);
                    
                    while(rs.next()){
                        User b = new User();
                        b.setRc(rs.getString("rc"));
                        b.setLocation(rs.getString("pickup"));
                        b.setStart(rs.getString("start"));
                        b.setKm(rs.getString("km"));
                        b.setEnd(rs.getString("end"));
                        b.setRentstatus(rs.getString("rentstatus"));
                        b.setBillid(rs.getInt("billid"));
                        
                        fetchbooking.add(b);
                    }
                    
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return fetchbooking;
	}
        public ArrayList<User> fetchbookings()
	{
                Connection con; 
                ArrayList<User> fetchbookings = new ArrayList<>();
               
                try {
                    con = getCon();
                    
                    Statement stmt=null;
                
                    stmt = con.createStatement();
                    String qr1="select * from rented";
                    ResultSet rs=stmt.executeQuery(qr1);
                    
                    while(rs.next()){
                        User b = new User();
                        b.setRentid(rs.getInt("rentid"));
                        b.setRc(rs.getString("rc"));
                        b.setLocation(rs.getString("pickup"));
                        b.setStart(rs.getString("start"));
                        b.setKm(rs.getString("km"));
                        b.setEnd(rs.getString("end"));
                        b.setRentstatus(rs.getString("rentstatus"));
                        b.setLicence(rs.getInt("licence"));
                        b.setBillid(rs.getInt("billid"));
                        
                        fetchbookings.add(b);
                    }
                    
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return fetchbookings;
	}
        public ArrayList<User> fetchbookings1(String licence)
	{
                Connection con; 
                ArrayList<User> fetchbookings = new ArrayList<>();
               
                try {
                    con = getCon();
                    
                    Statement stmt=null;
                
                    stmt = con.createStatement();
                    String qr1="select * from rented where licence="+licence;
                    ResultSet rs=stmt.executeQuery(qr1);
                    
                    while(rs.next()){
                        User b = new User();
                        b.setRentid(rs.getInt("rentid"));
                        b.setRc(rs.getString("rc"));
                        b.setLocation(rs.getString("pickup"));
                        b.setStart(rs.getString("start"));
                        b.setKm(rs.getString("km"));
                        b.setEnd(rs.getString("end"));
                        b.setRentstatus(rs.getString("rentstatus"));
                        b.setLicence(rs.getInt("licence"));
                        b.setBillid(rs.getInt("billid"));
                        
                        fetchbookings.add(b);
                    }
                    
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return fetchbookings;
	}
        public ArrayList<User> fetchcar()
	{
                Connection con; 
                ArrayList<User> fetchcar = new ArrayList<>();
               
                try {
                    con = getCon();
                    
                    Statement stmt=null;
                
                    stmt = con.createStatement();
                    String qr1="select * from `car`";
                    ResultSet rs=stmt.executeQuery(qr1);
                    
                    while(rs.next()){
                        User b = new User();
                        b.setRc(rs.getString("rc"));
                        b.setName(rs.getString("name"));
                        b.setYear(rs.getInt("year"));
                        b.setCategory(rs.getString("category"));
                        b.setStatus(rs.getString("status"));
                        
                        fetchcar.add(b);
                    }
                    
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return fetchcar;
	}
        public ArrayList<User> fetchemployee()
	{
                Connection con; 
                ArrayList<User> fetchemployee = new ArrayList<>();
               
                try {
                    con = getCon();
                    
                    Statement stmt=null;
                
                    stmt = con.createStatement();
                    String qr1="select * from `employee`";
                    ResultSet rs=stmt.executeQuery(qr1);
                    
                    while(rs.next()){
                        User b = new User();
                        b.setEid(rs.getString("eid"));
                        b.setName(rs.getString("name"));
                        b.setPhone(rs.getString("phone"));
                        b.setEmail(rs.getString("email"));
                        b.setAddress(rs.getString("address"));
                        b.setPosition(rs.getString("position"));
                        fetchemployee.add(b);
                    }
                    
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return fetchemployee;
	}
        public void edelete(String eid)
	{
                Connection con; 
                
               
               try{
                    con = getCon();
                    
                    Statement stmt=null;
                
                    stmt = con.createStatement();
                     String qr1 = "DELETE FROM `employee` WHERE `employee`.`eid` = \""+eid+"\"" ;
                    stmt.executeUpdate(qr1);
                    
                    
		con.close(); stmt.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                
	
        }
        public void cdelete(String rc)
	{
                Connection con; 
                
               
                try {
                    con = getCon();
                    
                    Statement stmt=null;
                
                    stmt = con.createStatement();
                     String qr1="DELETE FROM `car` WHERE `car`.`rc` = \""+rc+"\"" ;
                    stmt.executeUpdate(qr1);
                    
                    
		con.close(); stmt.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                
	}
        public int eedit(User b)
	{
                int i = 0;
                Connection con; 
                    String eid = b.getEid();
                    String name =b.getName();
                    String phone =b.getPhone();
                    String email = b.getEmail();
                    String address =b.getAddress();
                    String position =b.getPosition();
               
                try {
                    con = getCon();
                    
                    Statement stmt=null;
                    
                    stmt = con.createStatement();
                     String qr1="UPDATE `employee` SET `name` = \""+name+"\", `phone` = \""+phone+"\", `email` = \""+email+"\", `address` = \""+address+"\", `position` = \""+position+"\" WHERE `employee`.`eid` = \""+eid+"\"" ;
                    //String qr1 = "UPDATE `employee` SET `password` = 'qwe12asasd', `email` = 'ad@adsee3333', `address` = 'ads2222', `position` = 'adsdas2222' WHERE `employee`.`eid` = \""+eid+"\"";
                    i = stmt.executeUpdate(qr1);
                    
		con.close();  
                } catch (Exception e) {
			System.out.println("db error =="+e);
		}
               return i;
                
	}

        
        public void cancelrent(String billid) 
	{
		
                Connection con; 
                
                try {
                    con = getCon();
                    
                    Statement stmt=null;
                    stmt = con.createStatement();
                    String qr1="UPDATE `rented` SET `rentstatus` = 'canceled' WHERE `rented`.`billid` ="+billid;
                    stmt.executeUpdate(qr1);
                    
                   
                    
		con.close(); stmt.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                
	}
        public int Eerror(String eid)
	{
		int i= 0;
                Connection con; 
                try {
                    con = getCon();
                String qr="select * from employee where eid='"+eid+"'";
		PreparedStatement ps=con.prepareStatement(qr);
		ResultSet rs=ps.executeQuery(); 
                while(rs.next()){
                    i=1;
                    
                }
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return i;
	}
        public int Cerror(String rc)
	{
		int i= 0;
                Connection con; 
                try {
                    con = getCon();
                String qr="select * from car where rc='"+rc+"'";
		PreparedStatement ps=con.prepareStatement(qr);
		ResultSet rs=ps.executeQuery(); 
                while(rs.next()){
                    i=1;
                    
                }
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return i;
	}
        public int Alogin(User b)
	{
		int i= 0;
                Connection con; 
                try {
                    con = getCon();
                String qr="select * from admin where adminid='"+b.getAdminid()+"' and password='"+b.getPassword()+"'";
		PreparedStatement ps=con.prepareStatement(qr);
		ResultSet rs=ps.executeQuery(); 
                while(rs.next()){
                    i=1;
                    
                }
		con.close();
                } catch (Exception e) {
			System.out.println("db error =="+e);
		} 
                return i;
	}
        public int Elogin(User b)
	{       int i= 0;
                Connection con; 
                try {
                    con = getCon();
                    
                String qr="select * from employee where eid='"+b.getEid()+"' and password='"+b.getPassword()+"'";
		PreparedStatement ps=con.prepareStatement(qr);
		ResultSet rs=ps.executeQuery(); 
                while(rs.next()){
                    i=1;
                    
                }
		con.close();
                }
                catch(Exception e){
                    System.out.println(e);}
                return i;
        }
        public int Clogin(User b)
	{       int i= 0;
                Connection con; 
                try {
                    con = getCon();
                    
                String qr="select * from customer where licence='"+b.getLicence()+"' and password='"+b.getPassword()+"'";
		PreparedStatement ps=con.prepareStatement(qr);
		ResultSet rs=ps.executeQuery(); 
                while(rs.next()){
                    i=1;
                    
                }
		con.close();
                }
                catch(Exception e){
                    System.out.println(e);}
                return i;
        }
        public int setum(String rc)
	{       int i= 0;
                Connection con; 
                try {
                    con = getCon();
                    
                Statement stmt = null;
                String qr="UPDATE `car` SET `status` = 'under maintenance' WHERE `car`.`rc` = '"+rc+"'";
                stmt = con.createStatement();
		i = stmt.executeUpdate(qr);
		con.close();
                }
                catch(Exception e){
                    System.out.println(e);}
                return i;
        }
      public int seta(String rc)
	{       int i= 0;
                Connection con; 
                try {
                    con = getCon();
                    Statement stmt = null;
                String qr="UPDATE `car` SET `status` = 'available' WHERE `car`.`rc` = '"+rc+"'";
                stmt = con.createStatement();
		i = stmt.executeUpdate(qr);
                
		con.close();
                }
                catch(Exception e){
                    System.out.println(e);}
                return i;
        }
        

}






