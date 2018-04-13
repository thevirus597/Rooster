<%-- 
    Document   : rooster_toev
    Created on : Jul 10, 2017, 10:23:08 PM
    Author     : ztjad
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%! 
          public class Rooster{
              String URL ="jdbc:mysql://localhost:3306/java";
              String Username ="root";
              String Pasword ="";
              
              Connection conn = null;
              PreparedStatement insert_rooster = null;
              ResultSet result = null;
              
              public Rooster() {
              try{
                  conn= DriverManager.getConnection(URL,Username,Pasword);
                  insert_rooster = conn.prepareStatement("INSERT INTO rooster(datum,filliaal_id,mont_id) VALUE (?,?,?)");
             }catch(SQLException e){
              
              }
            }
         public int setRooster (String datum, String fill_id, String mont_naam){
             int result = 0;
             try{
                 insert_rooster.setString(1,datum);
                 insert_rooster.setString(2,fill_id);
                 insert_rooster.setString(3,mont_naam);
                 result = insert_rooster.executeUpdate();
             } catch(Exception e){            
            }
             return result;
          }
         }
        %>
        <%
            int result = 0;
            
            String datum= new String();
            String fil_id= new String();
            String mont_id= new String();
            
           if(request.getParameter("datum") != null){
               datum = request.getParameter("datum");
           }
            if(request.getParameter("fil_id") != null){
               fil_id = request.getParameter("fil_id");
           }
             if(request.getParameter("mont_id") != null){
               mont_id = request.getParameter("mont_id");
           }
           
           Rooster roosters = new Rooster();
           result = roosters.setRooster(datum,fil_id,mont_id);
           response.sendRedirect("../toevoegen.jsp");
           
            %>
    </body>
</html>
