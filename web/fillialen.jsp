<%-- 
    Document   : fillialen
    Created on : Jul 10, 2017, 9:24:26 PM
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
        <title>Overzicht van Fillialen</title>
        <%! 
          public class Filliaal{
              String URL ="jdbc:mysql://localhost:3306/java";
              String Username ="root";
              String Pasword ="";
              
              Connection conn = null;
              PreparedStatement select_filliaal = null;
              ResultSet result = null;
              
              public Filliaal() {
              try{
                  conn= DriverManager.getConnection(URL,Username,Pasword);
                  select_filliaal = conn.prepareStatement("SELECT * FROM filliaal");
             }catch(SQLException e){
              
              }
            }
              
            public ResultSet GetFilliaal(){
                try{
                    result = select_filliaal.executeQuery();
                }
                catch(SQLException e){
                }
                 return result;
            }
           
            }
          
          %>
          <% 
              Filliaal filliaal = new Filliaal();
              ResultSet filliaals = filliaal.GetFilliaal();
          %>
    </head>
    <body>
        <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="">
             <a class="btn" href="toevoegen.jsp">Toevoegen</a> 
            <a  class="btn" href="monteurs.jsp">Overzicht Monteurs</a>
            <a  class="btn" href="roosters.jsp">Overzicht Roosters</a>
        </div>
        </div>
        <div class="col-md-2"></div>
        </div>
        <div class="row">
        <div class="container">            
            <div class="col-md-4"></div>
           <div class="col-md-4">
               <h3>Overzicht van Fillialen</h3>
             <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>Filliaal ID</th>
                        <th>Filliaal Adres</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        while(filliaals.next()){;
                    %>
                    <tr>
                        <td>
                            <%= filliaals.getInt("filliaal_id") %>
                        </td>
                        <td>
                            <%= filliaals.getString("filliaal_adres") %>
                        </td>
                    </tr>
                    <% }; %>
                </tbody>
            </table>  
            </div>
            <div class="col-md-4"></div>
            </div>
        </div>
    </body>
</html>
