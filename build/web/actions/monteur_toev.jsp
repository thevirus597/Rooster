<%-- 
    Document   : monteur_toev
    Created on : Jul 10, 2017, 10:22:56 PM
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
          public class Monteur{
              String URL ="jdbc:mysql://localhost:3306/java";
              String Username ="root";
              String Pasword ="";
              
              Connection conn = null;
              PreparedStatement insert_monteur = null;
              ResultSet result = null;
              
              public Monteur() {
              try{
                  conn= DriverManager.getConnection(URL,Username,Pasword);
                  insert_monteur = conn.prepareStatement("INSERT INTO monteur(naam,adres,woonplaats) VALUE (?,?,?)");
             }catch(SQLException e){
              
              }
            }
         public int setMonteur (String naam, String adres, String woonplaats){
             int result = 0;
             try{
                 insert_monteur.setString(1,naam);
                 insert_monteur.setString(2,adres);
                 insert_monteur.setString(3,woonplaats);
                 result = insert_monteur.executeUpdate();
             } catch(Exception e){            
            }
             return result;
          }
         }
        %>
        <%
            int result = 0;
            
            String naam= new String();
            String adres= new String();
            String woonplaats= new String();
            
           if(request.getParameter("mont_naam") != null){
               naam = request.getParameter("mont_naam");
           }
            if(request.getParameter("mont_adres") != null){
               adres = request.getParameter("mont_adres");
           }
             if(request.getParameter("mont_woon") != null){
               woonplaats = request.getParameter("mont_woon");
           }
           
           Monteur monteurs = new Monteur();
           result = monteurs.setMonteur(naam,adres,woonplaats);
           response.sendRedirect("../toevoegen.jsp");
           
            %>
    </body>
</html>
