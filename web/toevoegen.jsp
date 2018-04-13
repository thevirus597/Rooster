<%-- 
    Document   : toevoegen
    Created on : Jul 10, 2017, 7:55:01 PM
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
        <title>Toevoegen</title>
         <%! 
          public class Toevoegen{
              String URL ="jdbc:mysql://localhost:3306/java";
              String Username ="root";
              String Pasword ="";
              
              Connection conn = null;
              PreparedStatement select_info1 = null;
              PreparedStatement select_info2 = null;
              PreparedStatement check_count = null;
              ResultSet result1 = null;
              ResultSet result2 = null;
              ResultSet count = null;
              
              public Toevoegen() {
              try{
                  conn= DriverManager.getConnection(URL,Username,Pasword);
                  select_info1 = conn.prepareStatement("SELECT filliaal_id FROM filliaal");
                  select_info2 = conn.prepareStatement("SELECT id FROM monteur");
                  check_count= conn.prepareStatement("SELECT COUNT(id) FROM monteur");
             }catch(SQLException e){
              
              }
            }
              
            public ResultSet GetFil(){
                try{
                    result1 = select_info1.executeQuery();
                                        
                }
                catch(SQLException e){
                }
                 return result1;
            }
             public ResultSet GetMont(){
                try{
                   result2 = select_info2.executeQuery();
                    
                }
                catch(SQLException e){
                }
                 return result2;
            }
              public ResultSet CountMont(){
                try{
                    count = check_count.executeQuery();
                }
                catch(SQLException e){
                }
                 return count;
            }
           
            }
          
          %>
          <% 
              Toevoegen filliaal = new Toevoegen();
              ResultSet filliaals = filliaal.GetFil();
              
              Toevoegen monteur = new Toevoegen();
              ResultSet mont = monteur.GetMont();
              
             
            
          %>
          
    </head>
    <body>
        <div class="center-btns">
            <a class="btn" href="fillialen.jsp">Overzicht Fillialen</a> 
            <a  class="btn" href="monteurs.jsp">Overzicht Monteurs</a>
            <a  class="btn" href="roosters.jsp">Overzicht Roosters</a>
        </div>
    
        <div class="container">    
        <div class="col-md-4">
        <form class="form" action="actions/filliaal_toev.jsp" method="POST">
            <h4>Filliaal toevoegen</h4>
            <label >Filliaal Adres</label>
            <input class="form-control" type="text" name="fil_adres">
            <button class="btn btn-submit" type="submit" name="filliaal_submit">Toevoegen</button>
        </form>
        </div>
        
        <div class="col-md-4">
            <form class="form" action="actions/monteur_toev.jsp" method="POST">
            <h4>Monteur toevoegen</h4>
           <label>Monteur Naam</label>
            <input class="form-control" type="text" name="mont_naam">
            <label> Monteur Adres</label>
            <input class="form-control" type="text" name="mont_adres">
            <label>Monteur Woonplaats</label>
            <input class="form-control" type="text" name="mont_woon">
            <button class="btn btn-submit" type="submit" name="mont_submit">Toevoegen</button>
        </form>
        </div>
        
        <div class="col-md-4">
        <form action="actions/rooster_toev.jsp" method="POST">
            <h4>Rooster Aanmaken</h4>
            <label>Datum</label>
            <input class="form-control" type="text" name="datum">
           
            <label>Fillaal ID</label>
            <select class="form-control" name="fil_id">
                <%while(filliaals.next()){; %> 
                         <option><%= filliaals.getInt("filliaal_id") %></option>
                <% }; %>
                        </select>
            
             <label>Monteur ID</label>
            <select class="form-control" name="mont_id">
                 <%while(mont.next()){; %> 
                            <option><%= mont.getInt("id") %></option>
                 <% }; %>           
                          </select>
            <button class="btn btn-submit" type="submit" name="rooster_submit">Aanmaken</button>
        </form>
        </div>
    </div>                      
    </body>
</html>
