 <%-- 
    Document   : roosters
    Created on : Jul 10, 2017, 9:41:10 PM
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
        <title>Overzicht van Roosters</title>
        <%! 
          public class Rooster{
              String URL ="jdbc:mysql://localhost:3306/java";
              String Username ="root";
              String Pasword ="";
              
              Connection conn = null;
              PreparedStatement select_rooster = null;
              ResultSet result = null;
              
              public Rooster() {
              try{
                  conn= DriverManager.getConnection(URL,Username,Pasword);
                  select_rooster = conn.prepareStatement("SELECT * FROM rooster JOIN monteur ON rooster.mont_id = monteur.id");
             }catch(SQLException e){
              
              }
            }
              
            public ResultSet GetRooster(){
                try{
                    result = select_rooster.executeQuery();
                }
                catch(SQLException e){
                }
                 return result;
            }
           
            }
          
          %>
          <% 
              Rooster roost = new Rooster();
              ResultSet rooster = roost.GetRooster();
          %>
    </head>
    <body>
        <div class="center-btns">
             <a class="btn" href="toevoegen.jsp">Toevoegen</a> 
             <a class="btn" href="fillialen.jsp">Overzicht Fillialen</a> 
            <a  class="btn" href="monteurs.jsp">Overzicht Monteurs</a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <h3>Overzicht van Roosters</h3>
            <table class="table table-condensed" >
                <thead>
                    <tr>
                        <th>Rooster ID</th>
                        <th>Rooster Datum</th>
                        <th>Filliaal ID</th>
                        <th>Monteur Naam</th>
                    </tr>
                </thead>
                <tbody>
                     <% 
                        while(rooster.next()){;
                    %><tr>
                        <td>
                            <%= rooster.getInt("rooster_id") %>
                        </td>
                        <td>
                            <%= rooster.getString("datum") %>
                        </td>
                        <td>
                            <%= rooster.getString("filliaal_id") %>
                        </td>
                        <td>
                            <%= rooster.getString("naam") %>
                        </td>
                    </tr>
                    <% }; %>
                </tbody>
            </table>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </body>
</html>
