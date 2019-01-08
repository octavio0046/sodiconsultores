<%-- 
    Document   : formFichaUsuarioCliente
    Created on : 7/01/2019, 08:06:33 AM
    Author     : OCTAVIOH
--%>

<%@page import="Modelo.ClienteBD"%>
<%@page import="Modelo.Cliente"%>
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
        UsuarioCliente a = UsuarioClienteBD.obtenerUsuarioCliente(Integer.parseInt(request.getParameter("cod")));

    %>  
        
        
     <%-- 
 <%   ArrayList<UsuarioCliente> lista = UsuarioClienteBD.obtenerUsuarioCliente(Integer.parseInt(request.getParameter("cod")));

       for (int i = 0; i < lista.size(); i++) {
                UsuarioCliente d = lista.get(i);
     %> 
--%>
   

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" ><a href="#"><%=a.getId_usu_clie()%></a></li>
                <li class="breadcrumb-item"><a href="#"> Bienvenido:    <%=a.getCorreo()%></a></li>
                <li class="breadcrumb-item active" aria-current="page">Fecha Creacion: <%=a.getFecha_creacion()%></li>
            </ol>
        </nav>
            
    
    
     

        <%-- 
     aqui empiezan los menus desplegables
        --%>
        Información Personal
        <div class="accordion" id="accordionExample">
            <div class="card">
                <div class="card-header" id="headingOne">
                    <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Personal #1
                        </button>
                    </h2>
                </div>

                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                        <center>
                            <%-- Inicio de formualario--%>
                            <form action="ServletClientes" method="get">
                              
                                <div class="form-group">
                                    <input type="text"   name="txtId_cliente"  hidden="" value="<%=a.getId_usu_clie()%>">
                                    <%if (sesionOK.getAttribute("perfil") != null) {
                                            //si alguien ya inicio sesion entonces mostrar su nombre 
                                    %>
                                    <td><input type="text" value="<%out.println(nom);%>"  name="txtNombreUsuario" hidden="" ></td>
                                        <%
                                            }
                                        %>


                                   <%
                                       
                                        Cliente p = ClienteBD.obtenerClientePrueba(Integer.parseInt(request.getParameter("cod")));
                                             
                           
                                    %>
                                    

                                   <label for="exampleFormControlInput1">PRIMER NOMBRE</label>
                                    <input type="text" name="txtNombre1" value="<%=p.getNombre1()%>" class="form-control" id="exampleFormControlInput1" >
   
                                    
                                    <label for="exampleFormControlInput1">SEGUNDO NOMBRE</label>
                                    <input type="text" name="txtNombre2" value="<%=p.getNombre2()%>"  class="form-control" id="exampleFormControlInput1" >


                                    
                                    <label for="exampleFormControlInput1">PRIMER APELLIDO</label>
                                    <input type="text" name="txtApellido1" value="<%=p.getApellido1()%>" class="form-control" id="exampleFormControlInput1" >

                                  
                                    <label for="exampleFormControlInput1">SEGUNDO APELLIDO</label>
                                    <input type="text" name="txtApellido2" value="<%=p.getApellido2()%>" class="form-control" id="exampleFormControlInput1" >

                                     
                                    <label for="exampleFormControlInput1">FECHA NACIMIENTO</label>
                                    <input type="date" name="txtNacimiento" value="<%=p.getNacimiento()%>" class="form-control" id="exampleFormControlInput1" >

                                    
                                    
                                    
                                    <label for="exampleFormControlInput1">EDAD</label>
                                    <input type="int" name="txtEdad" value="<%=p.getEdad()%>" class="form-control" id="exampleFormControlInput1" >

                                     
                                    
                                    
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">PAIS</label>
                                        <select class="form-control" value="<%=p.getPais()%>"  name="txtPais" id="exampleFormControlSelect1">
                                            <option>GUATEMALA</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">DEPARTAMENTO</label>
                                        <select class="form-control"  value="<%=p.getDepartamento()%>" name="txtDepartamento" id="exampleFormControlSelect1">
                                            <option>HUEHUETENANGO</option>
                                            <option>CHIQUIMULA</option>
                                            <option>CHIANTLA</option>
                                        </select>
                                    </div>

                                    <label for="exampleFormControlInput1">RECIDENCIA</label>
                                    <input type="text" value="<%=p.getRecidencia()%>" name="txtRecidencia" class="form-control"

                                           <label for="exampleFormControlInput1">DIRECCION</label>
                                    <input type="text" name="txtDireccion" value="<%=p.getDireccion()%>" class="form-control"

                                           <label for="exampleFormControlInput1">Telelefono Primario</label>
                                    <input type="number" name="txtTelefono1" value="<%=p.getTel1()%>" class="form-control"

                                           <label for="exampleFormControlInput1">Telelefono Secundario</label>
                                    <input type="number" name="txtTelefono2" value="<%=p.getTel2()%>" class="form-control"

                                           <label for="exampleFormControlInput1">Telelefono Recidencial</label>
                                    <input type="number" name="txtRecidencial" value="<%=p.getRecidencial()%>" class="form-control"


                                           <label for="exampleFormControlInput1">Email address</label>
                                    <input type="email" name="txtCorreo" value="<%=p.getCorreo()%>" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                              
                               
                                 
  
                                </div>
                                        
                               <input type="submit" class="btn btn-outline-success" value="Registrar"  name="Registrarse" />
                           <input type="hidden"  name="accion" value="RegistrarCliente"/>
                           
 
                            </form>
                                  
                               

                        </center>
                        <%-- Fin de formualario--%>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingTwo">
                    <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            #2
                        </button>
                    </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        contendio para el #2 
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingThree">
                    <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            #3
                        </button>
                    </h2>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                        contenido para #3 
                    </div>
                </div>
            </div>
        </div>
 

         
        
      
     

    </div>
</html>

