<%-- 
    Document   : actualizarUsuario
    Created on : 24/05/2018, 11:19:04 PM
    Author     : OctavioHerrera
--%>

<%@page import="Modelo.Usuarios"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="Modelo.DetallePaciente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>

<%
  response.setHeader("Pragma", "no-cache");
  response.addHeader("Cache-control", "must-revalidate");
  response.addHeader("Cache-control", "no-cache");
  response.addHeader("Cache-control", "no-store");
  response.setDateHeader("Expires", 0);
  try {
           if(session.getAttribute("nom")==null){
      

      request.getRequestDispatcher("index.jsp").forward(request, response);
      
  }
  }catch(Exception e){
      
    request.getRequestDispatcher("index.jsp").forward(request, response);  
  }
%>
<html>
    <div class="cabecera">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <%@include file="template1.jsp" %>
    </div>
    <div class="contenido">
 
  
 
            <%
                ArrayList<Usuarios> lista = DetallePaciente.obtenerCodUsuario(Integer.parseInt(request.getParameter("cod")));

                for (int i = 0; i < lista.size(); i++) {
                    Usuarios d = lista.get(i);
            %> 
              
                  
    <center>
        
         <h2 align="center">Actualizar Paciente</h2>
        
        <form action="ServletUsuarios" method="post">
            <table border="0" width="400" align="center">
                <tr>
                    <td>CodigoUsuario</td>
                    <td><input type="text" name="txtCodigo" value="<%=d.getCodigo_usuario()%>" readonly=""></td>
                    
                </tr>   <tr>
                    <td> Apellido</td>
                    <td><input type="text" name="txtApellido" value="<%=d.getApellido_usuario()%>"></td>
                    
                </tr>    <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="txtNombre" value="<%=d.getNombre_usuario()%>"></td>
                    
                </tr> <tr>
                    <td>Pais</td>
                    <td><input type="text" name="txtPais" value="<%=d.getPais()%>"></td>
                    
                </tr>
                 <tr>
                    <td>Perfil</td>
                    <td><input type="text" name="txtPerfil" value="<%=d.getPerfil()%>"></td>
                    
                </tr>
                 <tr>
                    <td>Correo</td>
                    <td><input type="text" name="txtCorreo" value="<%=d.getCorreo()%>"></td>
     
                </tr>
                 <tr>
                    <td>Clave</td>
                    <td><input type="text" name="txtClave" value="<%=d.getClave()%>"></td>
                    
                </tr>
                
                  <tr>
                    <td>Fecha</td>
                    <td><input type="date" name="txtFecha" value="<%=d.getFecha()%>"></td>
                    
                </tr>
                 <tr>
                    <td>Estado</td>
                    <td><input type="text" name="txtEstado" value="<%=d.getEstado()%>"></td>
                    
                </tr>
                 
                <tr>
                    <th colspan="2"><input type="submit" value="Actualizar" name="btnActualizar"/></th>
                </tr>
               
                <input type="hidden" name="accion" value="ModificarUsuario"/>
            </table>
        </form>  
        </center>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </div>
    
          <%
            }
            %>
</html>
