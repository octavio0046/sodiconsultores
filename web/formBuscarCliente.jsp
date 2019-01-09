<%-- 
    Document   : formBuscarUsuarioCliente
    Created on : 7/01/2019, 09:12:54 AM
    Author     : OCTAVIOH
--%>
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.ClienteBD"%>
<%-- 
    Document   : BuscarPaciente
    Created on : 11/05/2018, 12:47:00 PM
    Author     : Octavio Herrera
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>


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
                <input type="text" placeholder="Nombre Paciente" name="txtNombre" style=" width: 250px; height: 50px;text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" >

                <br> <br>  <input type="submit"  class="btn btn-success"  value="Buscar" >    
              

            </form>

        </center>   

        <h2 align="center">Lista de Pacientes</h2>  

        <div class="table-responsive-xl">
            <table class="table">
                <thead class="thead-light" >
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Primer Nombre</th>
                        <th scope="col">Segundo Apellido</th>
                        <th scope="col">Fecha Nacimiento</th>
                        <th scope="col">Pais</th>
                        <th scope="col">Telefono Primario</th>
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
                        <td><%=v.getNacimiento()%></td>
                        <td><%=v.getPais()%></td>
                        <td><%=v.getTel1()%></td>
                        <td><%=v.getCorreo()%></td>
                        <td><%=v.getFechaIngreso()%></td>
               
                        <td>
                               <a href="fichaPaciente.jsp?cod=<%=v.getId_cliente()%>">
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






























        <div style="margin: 0 auto; width:850px; ">
            <iframe name="detalle" width="850" height="300"  frameborder="0">

            </iframe> 

        </div>      

                    
                    
                     

    </div>
</html>
