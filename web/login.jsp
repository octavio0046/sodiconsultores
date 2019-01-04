<%-- 
    Document   : login
    Created on : 10/05/2018, 09:32:49 AM
    Author     : Octavio Herrera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <%@include file="template1.jsp" %>
      
         </head>
         
         
         
    <body>
        
        
     
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    <center>          
     
        </center>
        <h2 align="center">Logueo de Usuarios</h2>
    <center>
            <form action="ServletLogueo" method="post" >
                <input type="hidden" name="accion" value="loguin"/>
                 <label>Usuario:</label>
                <input type="text" placeholder="Usuario" name="txtUsu"  pattern="[A-Z]+"  required=""  title="SOLO MAYUSCULAS">
                <br><br>
                   <label>Contraseña:</label>
                   <input type="password" placeholder="Password" name="txtPas" required="">
                   <br><br>  <input type="submit"  name="btn" value="Iniciar Sesion" >  
            </form>
           
   </center> 
        <h4 align="center">
           <%
           if(request.getAttribute("msg")!=null){
             out.println(request.getAttribute("msg"));
               
           }
           
           
           %> 
            
            
        </h4>
           
           
    </body>
</html>
