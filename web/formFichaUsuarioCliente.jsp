<%-- 
    Document   : formFichaUsuarioCliente
    Created on : 7/01/2019, 08:06:33 AM
    Author     : OCTAVIOH
--%>

<%@page import="Modelo.UsuarioClienteBD"%>
<%@page import="Modelo.UsuarioCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="encabezado">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="template1.jsp" %>
    </div>
    <div class="contenido">
 
          <%

        ArrayList<UsuarioCliente> lista = UsuarioClienteBD.obtenerUsuarioCliente(Integer.parseInt(request.getParameter("cod")));

        for (int i = 0; i < lista.size(); i++) {
            UsuarioCliente d = lista.get(i);
    %>  
        

    <br>    <td><%=d.getId_usu_clie()%></td>
    <br>    <td><%=d.getCorreo()%> </td>
    <br>    <td><%=d.getPass()%> </td>
    <br>    <td><%=d.getFecha_creacion()%> </td> 
    <br>    <td><%=d.getEstado()%> </td> 

    
    
    
    
    
    
    
        <%
    }
%>
        
    </div>
</html>

