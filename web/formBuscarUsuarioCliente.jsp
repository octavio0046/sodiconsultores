<%-- 
    Document   : formBuscarUsuarioCliente
    Created on : 7/01/2019, 09:12:54 AM
    Author     : OCTAVIOH
--%>
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

            <form action="ServletPacientes" method="get">
                <input type="hidden" name="accion" value="BuscarUNPaciente" />



                <label>Busque por Nombre</label>
                <input type="text" placeholder="Nombre Paciente" name="txtNombre"   style=" width: 250px; height: 50px;text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" >

                <br> <br>  <input type="submit"  class="btn btn-success"  value="Buscar" >    
                <h6>1. Busque por medio del primer nombre del paciente </h6>
                <h6>2. El nombre debe escribirlo igual como lo escribio el paciente al registrarse </h6>

            </form>

        </center>   

        <h2 align="center">Lista de Pacientes</h2>  

        <div class="table-responsive-xl">
            <table class="table">
                <thead class="thead-light" >
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">PRIMER APELLIDO</th>
                        <th scope="col">SEGUNDO APELLIDO</th>
                        <th scope="col">PRIMER NOMBRE</th>
                        <th scope="col">SEGUNDO NOMBRE</th>
                        <th scope="col">FECHA</th>
                        <th scope="col">DIRECCION</th>
                        <th scope="col">RECIDENCIAL</th>
                        <th scope="col">TEL 1</th>
                        <th scope="col">TEL 2</th>
                        <th scope="col">REFERIDO</th>
                        <th scope="col">OCUPACON</th>
                        <th scope="col">DPI</th>
                        <th scope="col">ACCIONES</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <%  ArrayList<Paciente> lista = (ArrayList<Paciente>) request.getAttribute("lista");
                        for (Paciente v : lista) {
                    %>  

                    <tr>
                        <td><%=v.getCodigo_paciente()%></td>
                        <td><%=v.getApellidos()%></td>
                        <td><%=v.getApellidos2()%></td>
                        <td><%=v.getNombres()%></td>
                        <td><%=v.getNombres2()%></td>
                        <td><%=v.getFecha()%></td>
                        <td><%=v.getDireccion()%></td>
                        <td><%=v.getTelefono_recidencial()%></td>
                        <td><%=v.getTelefono1()%></td>
                        <td><%=v.getTelefono2()%></td>
                        <td><%=v.getReferido()%></td>
                        <td><%=v.getOcupacion()%></td>
                        <td><%=v.getDpi()%></td>
                        


                        <td><a href="obtenerDetallePaciente.jsp?cod=<%=v.getCodigo_paciente()%>"
                               target="detalle">Ver Detalle</a>
                        
                        
                               
                               <a href="fichaPaciente.jsp?cod=<%=v.getCodigo_paciente()%>">
                                <img src="ficha.png" whit="30" height="30">
                            </a>
                        </td>





                        <%        if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("ADMIN")) {


                        %>

                        <td><a href="eliminarPaciente.jsp?cod=<%=v.getCodigo_paciente()%>">
                                <img src="eliminar.jpg" whit="30" height="30">
                            </a>
                        
                        
                        <a href="actualizarPaciente.jsp?cod=<%=v.getCodigo_paciente()%>">
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
