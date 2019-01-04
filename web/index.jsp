<%-- 
    Document   : index
    Created on : 9/05/2018, 09:51:48 PM
    Author     : Octavio Herrera
--%>

<%
  response.setHeader("Pragma", "no-cache");
  response.addHeader("Cache-control", "must-revalidate");
  response.addHeader("Cache-control", "no-cache");
  response.addHeader("Cache-control", "no-store");
  response.setDateHeader("Expires", 0);

%>

<!DOCTYPE html>

<html>
    <div class="cabecera">
        
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="template1.jsp" %>
     </div>
        <div class="contenido">
            
            
            <center>
                
            
            <h1>BIENVENIDOS</h1>
            <h2>SODI CONSULTORES</h2>
            </center>
        </div>          
                 
                  

  
    
    
  
</html>
