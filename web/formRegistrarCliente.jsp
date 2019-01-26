<%-- 
    Document   : formRegistrarCliente
    Created on : 20/01/2019, 02:21:23 PM
    Author     : OCTAVIOH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="cabecera">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="template1.jsp" %>
    </div>
    <div class="contenido">
        <h5 align="center">
            <%  
                String dpi= request.getParameter("dpi");
            %>
            <a class="dropdown-item" href="formRegistrarCliente.jsp">RegistrarCliente</a>
        </h5>  

        <%---EMPIEZA el formulario de registro de cliente---%>
        <center>
            <form action="ServletClientes" method="post">

            <div class="form-group">
                        <label for="inputEmail4">DPI</label>
                        <input type="text" name="txtDpi" class="form-control" value="<%out.println(dpi);%>" id="inputEmail4" >
                    
            </div>
                    <input type="submit" value="registrar" class="btn btn-primary">
                     <input type="hidden" name="accion" value="RegistrarCliente"/>
            </form>
        </center>
        <%---termina el formulario de registro de cliente---%>

    </div>
</html>
