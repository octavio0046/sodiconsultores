<%-- 
    Document   : formResultado
    Created on : 27/01/2019, 09:56:23 AM
    Author     : OCTAVIOH
--%>

<%@page import="Modelo.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
     <%
         
     Email email = new Email();
     String para = request.getParameter("txtPara");
     boolean resultado=email.enviarCorreo(para);
     
if(resultado){
    
    out.print("CORREO ELECTRONICO ENVIADO CORRECTAMENTE");
}
    else{
            
            out.print("NO ENVIADO");
 
            }

     %>   
        
        
    </body>
</html>
