<%-- 
    Document   : formBusquedaCompleja
    Created on : 22/01/2019, 06:56:59 PM
    Author     : OCTAVIOH
--%>

<%@page import="Modelo.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="encabezado">
        <%@include file="template1.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </div>
    <div class="contenido">


        <%---tabla para muestra de resultados-----%>   
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    
                    <th scope="col">Primer Nombre</th>
                    <th scope="col">Segundo Apellido</th>
                    <th scope="col">Edad</th>
                    <th scope="col">Residencia</th>
                    <th scope="col">Nivel de estudio</th>
                    <th scope="col">Carrera</th>
                    <th scope="col">Estado laboral</th>
                </tr>
            </thead>
            <tbody>
                <%  ArrayList<Consultas> lista = (ArrayList<Consultas>) request.getAttribute("lista");
                    for (Consultas v : lista) {
                %>  

                <tr>
                    <td><%=v.getId_cliente()%></td>
                    <td><%=v.getNombre1()%></td>
                    <td><%=v.getApellido1()%></td>
                    <td><%=v.getEdad()%></td>
                    <td><%=v.getResicencia()%></td>
                    <td><%=v.getNivel()%></td>
                    <td><%=v.getCarrera()%></td>
                    <td><%=v.getEstado()%></td>

                    <td>
                        <a href="formFichaUsuarioCliente.jsp?cod=<%=v.getId_cliente()%>">
                            <img src="ficha.png" whit="30" height="30">
                        </a>
                    </td>

                    <%        if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("ADMIN")) {


                    %>

                    <td><a href="eliminarPaciente.jsp?cod=<%=v.getId_cliente()%>">
                            <img src="eliminar.jpg" whit="30" height="30">
                        </a>


                        <a href="actualizarPaciente.jsp?cod=<%=v.getId_cliente()%>">
                            <img src="actualizar.png" whit="30" height="30">
                        </a>

                    </td>

                    <%                    }

                    %>
                </tr>
                <%                  }


                %>

            </tbody>

        </table>


    </div>
</html>
