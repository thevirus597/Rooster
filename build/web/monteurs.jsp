<%-- 
    Document   : montuers
    Created on : Jul 10, 2017, 9:41:02 PM
    Author     : ztjad
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <title>Overzicht van Monteurs</title>
         <%! 
          public class Monteur{
              String URL ="jdbc:mysql://localhost:3306/java";
              String Username ="root";
              String Pasword ="";
              
              Connection conn = null;
              PreparedStatement select_mont = null;
              ResultSet result = null;
             
              
              public Monteur() {
              try{
                  conn= DriverManager.getConnection(URL,Username,Pasword);
                  select_mont = conn.prepareStatement("SELECT * FROM monteur");
             }catch(SQLException e){
              
              }
            }
              
            public ResultSet GetMonteur(){
                try{
                    result = select_mont.executeQuery();
                }
                catch(SQLException e){
                }
                 return result;
            }
                      
            }
          
          %>
          <% 
              Monteur mont = new Monteur();
              ResultSet monteur = mont.GetMonteur();
          %>
          
          
    </head>
    <body>
        <div class="center-btns">
             <a class="btn" href="toevoegen.jsp">Toevoegen</a> 
            <a class="btn" href="fillialen.jsp">Overzicht Fillialen</a> 
            <a  class="btn" href="roosters.jsp">Overzicht Roosters</a>
        </div>
        <div class="container">
            <div class="center">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <h3>Overzicht van Monteurs</h3>
            <table class="table table-condensed" >
                <thead>
                    <tr>
                        <th>Monteur ID</th>
                        <th>Monteur Naam</th>
                        <th>Monteru Adres</th>
                        <th>Monteur Woonplaats</th>
                    </tr>
                </thead>
                <tbody>
                   <% 
                        while(monteur.next()){;
                    %>
                    <tr>
                        <td>
                            <%= monteur.getInt("id") %>
                        </td>
                        <td>
                            <%= monteur.getString("naam") %>
                        </td>
                        <td>
                            <%= monteur.getString("adres") %>
                        </td>
                        <td>
                            <%= monteur.getString("woonplaats") %>
                        </td>
                    </tr>
                    <% }; %>
                </tbody>
            </table>
                    </div>
                    <div class="col-md-4"></div>
                </div>
           </div>
        </div>
    </body>
</html>
