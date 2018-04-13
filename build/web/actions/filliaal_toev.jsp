<%--
    Document   : filliaal_toev
    Created on : Jul 10, 2017, 10:22:41 PM
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
          public class Filliaal{
              String URL ="jdbc:mysql://localhost:3306/java";
              String Username ="root";
              String Pasword ="";
              
              Connection conn = null;
              PreparedStatement insert_filliaal = null;
              ResultSet result = null;
              
              public Filliaal() {
              try{
                  conn= DriverManager.getConnection(URL,Username,Pasword);
                  insert_filliaal = conn.prepareStatement("INSERT INTO filliaal(filliaal_adres) VALUE (?)");
             }catch(SQLException e){
              
              }
            }
         public int setFilliaal (String fil_adres){
             int result = 0;
             try{
                 insert_filliaal.setString(1,fil_adres);
                 result = insert_filliaal.executeUpdate();
             } catch(Exception e){            
            }
             return result;
          }
         }
        %>
        <%
            int result = 0;
            
            String adres= new String();
            
           if(request.getParameter("fil_adres") != null){
               adres = request.getParameter("fil_adres");
           }
           
           Filliaal filiaal = new Filliaal();
           result = filiaal.setFilliaal(adres);
           response.sendRedirect("../toevoegen.jsp");
           
            %>
    </body>
</html>
