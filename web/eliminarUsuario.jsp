<%-- 
    Document   : eliminarUsuario
    Created on : 24/05/2018, 11:06:43 PM
    Author     : OctavioHerrera
--%>


<%@page import="Modelo.UsuariosBD"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <div class="cabecera">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <%@include file="template1.jsp" %>
    </div>
    <div class="contenido">
 
         <center>
               <%
                ArrayList<Usuarios> lista = UsuariosBD.obtenerCodUsuario(Integer.parseInt(request.getParameter("cod")));

                for (int i = 0; i < lista.size(); i++) {
                    Usuarios d = lista.get(i);
            %> 
            
        
           <form action="ServletUsuarios" method="get">
               <label>Segudo que desea eliminar el tratamiento con el codigo siguiente</label>
              

               <input type="text"  name="txtCodigoUsuario" style="width:80px;height:15px" value="<%= d.getCodigo_usuario()%>" readonly="">
                
               
               <br>    <label> Nombre del Usuario a Eliminar</label>
                 <input type="text"  name="" style="width:80px;height:15px" value="<%= d.getNombre_usuario()%>" readonly="">
               
                <br>   <input type="submit" value="ELIMINAR" name="Registrarse" />
                             <input type="hidden" name="accion" value="EliminarUsuario"/> 
           </form>
           
           
         <%
          }
          %>
           </center>
    </div>
</html>
