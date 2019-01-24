<%-- 
    Document   : formBuscarUsuarioCliente
    Created on : 7/01/2019, 09:12:54 AM
    Author     : OCTAVIOH
--%>
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.ClienteBD"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="estilos22.css"/>
        <%@include file="template1.jsp" %>
    </div>               

    <div class="contenido">       
        <center>                 
            <h2 align="center">BUSCAR SOLICITANTES</h2>

            <form action="ServletClientes" method="get">
                <input type="hidden" name="accion" value="BuscarUnCliente" />
                <label>Busque por Nombre</label>
                <input type="text"  name="txtNombre" style=" width: 250px; height: 50px;text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" >
                <br> <br>  <input type="submit"  class="btn btn-success"  value="Buscar" >    
            </form>
        </center>   

        <h2 align="center">Lista de Solicitantes</h2>  

        <div class="table-responsive-xl">
            <table class="table">
                <thead class="thead-light" >
                    <tr>
                        <th scope="col">Primer Nombre</th>
                        <th scope="col">Segundo Apellido</th>
                        <th scope="col">Edad</th>
                        <th scope="col">Residencia</th>
                        <th scope="col">Carrera en curso</th>
                        <th scope="col">Correo </th>
                        <th scope="col">Fecha Ingreso</th>

                    </tr>
                </thead>
                <tbody>
                 <%  ArrayList<Cliente> lista = (ArrayList<Cliente>) request.getAttribute("lista");
                        for (Cliente v : lista) {
                  %>  

                    <tr>
                        <td><%=v.getId_cliente()%></td>
                        <td><%=v.getNombre1()%></td>
                        <td><%=v.getApellido2()%></td>
                        <td><%=v.getEdad()%></td>
                        <td><%=v.getRecidencia()%></td>
                        <td><%=v.getCorreo()%></td>
                        <td><%=v.getCorreo()%></td>
                        <td><%=v.getFechaIngreso()%></td>
               
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
                        
                        
             
                        
                        </td>

                            <%                    }

                            %>
                    </tr>
                    <%                  }


                    %>

                </tbody>

            </table>
        </div>






























        <div style="margin: 0 auto; width:850px; ">
            <iframe name="detalle" width="850" height="300"  frameborder="0">

            </iframe> 

        </div>      

                    
                    
                     

    </div>
</html>
