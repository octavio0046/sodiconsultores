<%-- 
    Document   : registrarUsuario
    Created on : 25/05/2018, 12:11:58 AM
    Author     : OctavioHerrera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="estilos22.css"/>
        <%@include file="template1.jsp" %>

    </div>
    <div class="contenido">


        <center>
            <form  action="ServletUsuarios" method="get">


                <br>          <h1>REGISTRAR USUARIO</h1>
                <label>APELLIDO</label>
                <input type="text" name="txtApellido" pattern="[A-Z]+"  required=""  title="SOLO MAYUSCULAS">
                <label>NOMBRE</label>
                <input type="text"  name="txtNombre"  required=""  title="SOLO MAYUSCULAS">
                <br><br>               <label>PAIS</label>
                <input type="text"  name="txtPais" pattern="[A-Z]+"  required=""  title="SOLO MAYUSCULAS">
                <label>PERFIO(ROL)</label>
                <input type="text"  name="txtPerfil" value="ASISTENTE" required="" readonly=""> 
                <br><br>     <label> CORREO</label>
                <input type="email"  name="txtCorreo"   required=""  >

                <label>CLAVE</label>
                <input type="text"   name="txtClave" >


                <input type="text"    value="ACTIVO" name="txtEstado"pattern="[A-Z]+"  readonly="" hidden=""  title="SOLO MAYUSCULAS" >

                <br>   <br>   <input type="submit" class="btn btn-outline-success" value="Registrar" name="Registrarse" />



                <input type="hidden"  name="accion" value="RegistrarUsuario"/> 



                <h6>El ADMINISTRADOR solo puede crear usuarios de tipo ASISTENTE  </h6>
            </form> 










        </center>
    </div>
</html>
