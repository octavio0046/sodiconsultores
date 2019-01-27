<%-- 
    Document   : formFichaUsuarioCliente
    Created on : 7/01/2019, 08:06:33 AM
    Author     : OCTAVIOH
--%>

<%@page import="Modelo.ConsultasBD"%>
<%@page import="Modelo.FicheroBD"%>
<%@page import="Modelo.Fichero"%>
<%@page import="Modelo.EstadoBD"%>
<%@page import="Modelo.Estado"%>
<%@page import="Modelo.EnlaceBD"%>
<%@page import="Modelo.Enlace"%>
<%@page import="Modelo.InformacionBD"%>
<%@page import="Modelo.Informacion"%>
<%@page import="Modelo.Estudio"%>
<%@page import="Modelo.EstudioBD"%>
<%@page import="Modelo.ClienteBD"%>
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.UsuarioClienteBD"%>
<%@page import="Modelo.UsuarioCliente"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);
    try {
        if (session.getAttribute("nom") == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

<!DOCTYPE html>
<html>

    <div class="encabezado">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="template1.jsp" %>
    </div>
    <div class="contenido">

        <%        Cliente a = ClienteBD.obtenerClientePrueba(Integer.parseInt(request.getParameter("cod")));
        %>  

        <%
            ConsultasBD nuevo = new ConsultasBD();
            int Total = nuevo.obtenerTotalDias(Integer.parseInt(request.getParameter("cod")));
            // int totals=Integer.parseInt(request.getParameter("cod"));
            //String Final= String.valueOf(Total.getInt(1));

        %>

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" ><a href="#">DPI: <%=a.getDpi()%></a></li>
                <li class="breadcrumb-item"><a href="#">CORREO: <%=a.getCorreo()%></a></li>
                <li class="breadcrumb-item active" aria-current="page">FECHA INGRESO: <%=a.getFechaIngreso()%></li>
            </ol>
        </nav>
        <center>
            <h9>Dias Transcurridos</h9>
            <h1><%out.println(Total);%></h1>  
        </center>

        <%-- 
     aqui empiezan los menus desplegables
        --%>

        <div class="accordion" id="accordionExample">
            <div class="card">
                <div class="card-header" id="headingOne">
                    <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            INFOMACION PERSONAL
                        </button>
                    </h2>
                </div>

                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                        <center>
                            <%-- Inicio de formualario--%>


                            <form action="ServletClientes" method="get">


                                <input type="text"   name="txtId_cliente"  hidden="" value="<%=a.getId_cliente()%>">
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


                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleFormControlInput1">PRIMER NOMBRE</label>
                                        <input type="text" name="txtNombre1" value="<%=p.getNombre1()%>"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" class="form-control" id="exampleFormControlInput1" placeholder="NOMBRE" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleFormControlInput1">SEGUNDO NOMBRE</label>
                                        <input type="text" name="txtNombre2" value="<%=p.getNombre2()%>"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();"  class="form-control" id="exampleFormControlInput1" placeholder="NOMBRE" >

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleFormControlInput1">PRIMER APELLIDO</label>
                                        <input type="text" name="txtApellido1" value="<%=p.getApellido1()%>"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" class="form-control" id="exampleFormControlInput1" placeholder="NOMBRE" >

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleFormControlInput1">SEGUNDO APELLIDO</label>
                                        <input type="text" name="txtApellido2" value="<%=p.getApellido2()%>"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" class="form-control" id="exampleFormControlInput1" placeholder="NOMBRE" >
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">FECHA NACIMIENTO</label>
                                    <input type="date" id="fecha" name="txtNacimiento" value="<%=p.getNacimiento()%>"  class="form-control" id="exampleFormControlInput1" >
                                </div>


                                <div class="form-row">

                                    <div class="form-group col-md-6">
                                        <label for="exampleFormControlSelect1">PAIS</label>
                                        <select class="form-control" value="<%=p.getPais()%>"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" name="txtPais" id="exampleFormControlSelect1">
                                            <option>GUATEMALA</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleFormControlSelect1">DEPARTAMENTO</label>
                                        <select class="form-control"  value="<%=p.getDepartamento()%>"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" name="txtDepartamento" id="exampleFormControlSelect1">
                                            <option>HUEHUETENANGO</option>
                                            <option>ALTA VERAPAZ</option>
                                            <option>CHIMALTENANGO</option>
                                            <option>EL PROGRESO</option>
                                            <option>GUATEMALA</option>
                                            <option>IZABAL</option>
                                            <option>JUTIAPA</option>
                                            <option>QUETZALTENANGO</option>
                                            <option>RETALHULEU</option>
                                            <option>SAN MARCOS</option>
                                            <option>SOLOLÁ</option>
                                            <option>TOTONICAPÁN</option>
                                            <option>BAJA VERAPAZ</option>
                                            <option>CHIQUIMULA</option>
                                            <option>ESCUINTLA</option>
                                            <option>JALAPA</option>
                                            <option>PETÉN</option>
                                            <option>QUICHÉ</option>
                                            <option>SACATEPEQUEZ</option>
                                            <option>SANTA ROSA</option>
                                            <option>SUCHITEPEQUES</option>
                                            <option>ZACAPA</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="form-row">

                                    <div class="form-group col-md-6">
                                        <label for="exampleFormControlSelect1">GENERO</label>
                                        <select class="form-control"   style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" name="txtGenero" id="exampleFormControlSelect1">
                                            <option><%=p.getGenero()%></option>
                                            <option>MASCULINO</option>
                                            <option>FEMENINO</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleFormControlInput1">EDAD</label>


                                        <input type="text" name="txtEdad" value="<%=p.getEdad()%>" readonly="" class="form-control" id="exampleFormControlInput1" >

                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">

                                        <label for="exampleFormControlSelect1">RESIDENCIA</label>
                                        <select class="form-control"  value="<%=p.getRecidencia()%>"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();"  name="txtRecidencia" id="exampleFormControlSelect1">
                                            <option>HUEHUETENANGO</option>
                                            <option>ALTA VERAPAZ</option>
                                            <option>CHIMALTENANGO</option>
                                            <option>EL PROGRESO</option>
                                            <option>GUATEMALA</option>
                                            <option>IZABAL</option>
                                            <option>JUTIAPA</option>
                                            <option>QUETZALTENANGO</option>
                                            <option>RETALHULEU</option>
                                            <option>SAN MARCOS</option>
                                            <option>SOLOLÁ</option>
                                            <option>TOTONICAPÁN</option>
                                            <option>BAJA VERAPAZ</option>
                                            <option>CHIQUIMULA</option>
                                            <option>ESCUINTLA</option>
                                            <option>JALAPA</option>
                                            <option>PETÉN</option>
                                            <option>QUICHÉ</option>
                                            <option>SACATEPEQUEZ</option>
                                            <option>SANTA ROSA</option>
                                            <option>SUCHITEPEQUES</option>
                                            <option>ZACAPA</option>
                                        </select>



                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleFormControlInput1">DIRECCION</label>
                                        <input type="text" name="txtDireccion" value="<%=p.getDireccion()%>"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" class="form-control" id="exampleFormControlInput1">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="exampleFormControlInput1">Telelefono Primario</label>
                                        <input type="number" name="txtTelefono1" value="<%=p.getTel1()%>" class="form-control" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="exampleFormControlInput1">Telelefono Secundario</label>
                                        <input type="number" name="txtTelefono2" value="<%=p.getTel2()%>" class="form-control" id="exampleFormControlInput1">

                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="exampleFormControlInput1">Telelefono Recidencial</label>
                                        <input type="number" name="txtRecidencial" value="<%=p.getRecidencial()%>" class="form-control" id="exampleFormControlInput1">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Email address</label>
                                    <input type="text" name="txtCorreo" value="<%=p.getCorreo()%>" class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Estado</label>
                                    <input type="number" readonly="" name="txtEstado" hidden="" value="<%=p.getEstado()%>" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                                </div>          


                                <input type="submit" class="btn btn-outline-success" value="ACTUALIZAR"  name="Registrarse" />
                                <input type="hidden"  name="accion" value="ActualizarCliente"/>


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
                            ESTUDIOS
                        </button>
                    </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        <%-- 
                            anicia el formuario2
                        --%>
                        <center>
                            <form action="ServletEstudios" method="get">
                                <input type="text" hidden=""  name="txtId_cliente"   value="<%=a.getId_cliente()%>">
                                <%
                                    Estudio e = EstudioBD.obtenerEstudio(Integer.parseInt(request.getParameter("cod")));
                                %>  
                                <label for="exampleFormControlSelect1">NIVEL DE ESTUDIO</label>
                                <div class="form-group">    
                                    <select name="txtNombre_nivel_estudio"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" class="form-control" id="exampleFormControlSelect1">
                                        <option><%=e.getNombre_nivel_estudio()%></option>
                                        <option>PRIMARIA</option>
                                        <option>BÁSICO</option>
                                        <option>DIVERSIFICADO</option>
                                        <option>UNIVERSITARIO</option>
                                        <option>DOCTORADO</option>
                                        <option>POST-GRADO</option>
                                    </select>
                                </div>   


                                <label for="exampleFormControlSelect1">CARRERA EN CURSO</label>
                                <div class="form-group">    
                                    <select name="txtNombre_formacion"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" class="form-control" id="exampleFormControlSelect1">
                                        <option><%=e.getNombre_formacion()%></option>
                                        <option style="color: red;">LICENCIATURAS</option>
                                        <option>ADMINISTRACION DE EMPRESAS</option>
                                        <option>ANTROPOLOGIA</option>
                                        <option>ARQUEOLOGIA</option>
                                        <option>ARQUITECTURA</option>
                                        <option>ARTE</option>
                                        <option>BALLET CLASICO</option>
                                        <option>BIOLOGIA</option>
                                        <option>CIENCIAS JURIDICAS Y SOCIALES, ABOGADO Y NOTARIO</option>
                                        <option>CIENCIAS LINGUISTICAS TRADUCCION E INTERPRETE</option>
                                        <option>CONTADOR PUBLICO Y AUDITOR</option>
                                        <option>DISEÑO GRAFICO</option>
                                        <option>ECONOMIA</option>
                                        <option>EDUCACION FISICA,DEPORTE Y RECREACION</option>
                                        <option>ENFERMERIA</option>
                                        <option>ENSEÑANZA DE MATEMATICA Y FISICA</option>
                                        <option>FILOSOFIA</option>
                                        <option>HISTORIA</option>
                                        <option>MATEMATICAS</option>
                                        <option>MEDICO VETERINARIO</option>
                                        <option>MEDICO CIRUJARNO</option>
                                        <option>MUSICA</option>
                                        <option>NUTRICION</option>
                                        <option>ODONTOLOGIA</option>
                                        <option>PEDAGOGIA</option>
                                        <option>QUIMICA</option>
                                        <option>TRABAJO SOCIAL</option>
                                        <option>ZOOTECNISTA</option>
                                        <option style="color: red;">INGENIERIA</option>
                                        <option>AGRONOMO EN RECURSOS NATURALES</option>
                                        <option>AGRONOMO EN SISTEMAS DE PRODUCCION AGRICOLA</option>
                                        <option>CIVIL</option>
                                        <option>ELECTRICA</option>
                                        <option>MECANICA</option>
                                        <option>INDUSTRIAL</option>
                                        <option>MECANICA ELECTRICA</option>
                                        <option>INGENIERIA QUIMICA</option>
                                        <option>SISTEMAS</option>
                                        <option>ELECTRONICA</option>
                                        <option>INDUSTRIAS AGROPECUARIAS Y FORESTALES</option>                                   
                                        <option style="color: red;">MAESTRIAS</option>
                                        <option>ANTROPOLOGIA</option>
                                        <option>BUSINESS ANALYTICS</option>
                                        <option>CONSERVACION DE MONUMENTOS</option>
                                        <option>DISEÑO ARQUITECTONICO</option>
                                        <option>GESTION PARA LA REUCCION DE LOS RIEGOS NATURALES</option>



                                    </select>
                                </div>   


                                <label for="exampleFormControlSelect1">CAMPO DE ESTUDIO</label>
                                <div class="form-group">    
                                    <select name="txtNombre_campo_estudio"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" class="form-control" id="exampleFormControlSelect1">
                                        <option><%=e.getNombre_campo_estudio()%></option>
                                        <option>INFORMATICA</option>
                                        <option>AGRICULA</option>
                                        <option>PILITICO</option>
                                        <option>MILITAR</option>
                                        <option>RELIGIOSO</option>
                                        <option>SOCIAL</option>
                                        <option>CULTURAL</option>
                                        <option>DIPLOMATICO</option>
                                        <option>ECONOMICO</option>
                                        <option>AMBIENTAL</option>
                                        <option>MUNDIAL</option>
                                        <option>INTELECTUAL</option>
                                        <option>PUBLICO</option>

                                    </select>
                                </div>   


                                <input type="submit" class="btn btn-outline-success" value="ACTUALIZAR"  name="Registrarse" />
                                <input type="hidden"  name="accion" value="ActualizarEstudio"/>
                                <br>
                                <br>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Nivel de estudio ACTUAL</label>
                                    <input type="text" readonly=""  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();"  value="<%=e.getNombre_nivel_estudio()%>" class="form-control" id="exampleFormControlInput1" >
                                </div>  

                                <label for="exampleFormControlInput1">Formacion Academica ACTUAL</label>
                                <input type="text" readonly="" name=""  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" value="<%=e.getNombre_formacion()%>" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">

                                <label for="exampleFormControlInput1">Campo de Estudio ACTUAL</label>
                                <input type="text" readonly="" name=""  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" value="<%=e.getNombre_campo_estudio()%>" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">



                            </form>
                        </center>
                        <%-- 
                termina  el formuario2
                        --%>            
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingThree">
                    <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            INFORMACION GENERAL
                        </button>
                    </h2>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">

                        <%-- inicio formulario informacion--%>
                        <center>
                            <form action="ServletInformacion" method="get">
                                <%
                                    Informacion i = InformacionBD.obtenerInformacion(Integer.parseInt(request.getParameter("cod")));
                                %> 

                                <input type="text" hidden=""  name="txtId_cliente"   value="<%=a.getId_cliente()%>">


                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Numbero de Empleos</label>
                                    <input type="number" name="txtNumero"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" value="<%=i.getNumero()%>" class="form-control" id="exampleFormControlInput1" >
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Duración promedio duracion en años</label>
                                    <input type="number" name="txtDuracion" value="<%=i.getDuracion_promedio()%>" class="form-control" id="exampleFormControlInput1" >
                                </div>

                                <input type="submit" class="btn btn-outline-success" value="ACTUALIZAR"  name="Registrarse" />
                                <input type="hidden"  name="accion" value="ActualizarInformacion"/>


                            </form>
                        </center>

                        <%-- FIN formulario informacion--%>     



                    </div>
                </div>
            </div>


            <div class="card">
                <div class="card-header" id="headingThree2">
                    <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree2" aria-expanded="false" aria-controls="collapseThree2">
                            REDES SOCIALES
                        </button>
                    </h2>
                </div>



                <div id="collapseThree2" class="collapse" aria-labelledby="headingThree2" data-parent="#accordionExample">
                    <center>
                        <h1>Haz click en los botones para agregar la informacion</h1>
                    </center>
                    <div class="card-body">
                        <%-- 
                EMPIEZA FORMULARIO 3
                        --%>
                        <center>

                            <p>
                                <a class="btn btn-primary" data-toggle="collapse" href="#collapseExamplefacebook" role="button" aria-expanded="false" aria-controls="collapseExample">
                                    Facebook
                                </a>
                                <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExampleinstagram" aria-expanded="false" aria-controls="collapseExample">
                                    Instagram
                                </button>
                                <button class="btn btn-info" type="button"  data-toggle="collapse" data-target="#collapseExamplelinkin" aria-expanded="false" aria-controls="collapseExample">
                                    Linked In
                                </button>
                                <button class="btn btn-dark" type="button" data-toggle="collapse" data-target="#collapseExampleotro" aria-expanded="false" aria-controls="collapseExample">
                                    Otro
                                </button>
                            </p>

                            <div class="collapse" id="collapseExamplefacebook">
                                <div class="card card-body">

                                    <%
                                        //la variable es el coorrelativo
                                        String variable = "FACEBOOK";
                                        Enlace en = EnlaceBD.obtenerEnlace(Integer.parseInt(request.getParameter("cod")), variable);
                                    %>

                                    <form action="ServletEnlaces" method="get">

                                        <input type="text" hidden=""  name="txtId_cliente"   value="<%=a.getId_cliente()%>">
                                        <input type="text" hidden=""   name="txtNombre_enlace"   value="<%=variable%>">
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1"><%=en.getNombre_enlace()%></label>
                                            <input type="text" name="txtLink"  value="<%=en.getLink()%>" class="form-control" id="exampleFormControlInput1" >
                                        </div>
                                        <input type="submit" class="btn btn-outline-success" value="ACTUALIZAR"  name="Registrarse" />
                                        <input type="hidden"  name="accion" value="actualizarEnlace"/>
                                    </form>

                                </div>
                            </div>



                            <div class="collapse" id="collapseExampleinstagram">
                                <div class="card card-body">

                                    <form action="ServletEnlaces" method="get">



                                        <%
                                            String variable2 = "INSTAGRAM";
                                            Enlace en2 = EnlaceBD.obtenerEnlace(Integer.parseInt(request.getParameter("cod")), variable2);
                                        %>

                                        <input type="text" hidden=""  name="txtId_cliente"   value="<%=a.getId_cliente()%>">
                                        <input type="text" hidden=""  name="txtNombre_enlace"   value="<%=variable2%>">

                                        <div class="form-group">
                                            <label for="exampleFormControlInput1"><%=en2.getNombre_enlace()%></label>
                                            <input type="text" name="txtLink"  value="<%=en2.getLink()%>" class="form-control" id="exampleFormControlInput1" >

                                        </div>
                                        <input type="submit" class="btn btn-outline-success" value="ACTUALIZAR"  name="Registrarse" />
                                        <input type="hidden"  name="accion" value="actualizarEnlace"/>
                                    </form>

                                </div>
                            </div>
                            <div class="collapse" id="collapseExamplelinkin">
                                <div class="card card-body">

                                    <form action="ServletEnlaces" method="get">



                                        <%
                                            String variable3 = "LINKIN";
                                            Enlace en3 = EnlaceBD.obtenerEnlace(Integer.parseInt(request.getParameter("cod")), variable3);
                                        %>

                                        <input type="text" hidden=""  name="txtId_cliente"   value="<%=a.getId_cliente()%>">
                                        <input type="text" hidden=""  name="txtNombre_enlace"   value="<%=variable3%>">


                                        <div class="form-group">
                                            <label for="exampleFormControlInput1"><%=en3.getNombre_enlace()%></label>
                                            <input type="text" name="txtLink"  value="<%=en3.getLink()%>" class="form-control" id="exampleFormControlInput1" >
                                        </div>  


                                        <input type="submit" class="btn btn-outline-success" value="ACTUALIZAR"  name="Registrarse" />
                                        <input type="hidden"  name="accion" value="actualizarEnlace"/>
                                    </form>



                                </div>
                            </div>


                            <div class="collapse" id="collapseExampleotro">
                                <div class="card card-body">

                                    <form action="ServletEnlaces" method="get">



                                        <%
                                            String variable4 = "OTRO";
                                            Enlace en4 = EnlaceBD.obtenerEnlace(Integer.parseInt(request.getParameter("cod")), variable4);
                                        %>

                                        <input type="text" hidden=""  name="txtId_cliente"   value="<%=a.getId_cliente()%>">
                                        <input type="text" hidden=""  name="txtNombre_enlace"   value="<%=variable4%>">


                                        <div class="form-group">
                                            <label for="exampleFormControlInput1"><%=en4.getNombre_enlace()%></label>
                                            <input type="text" name="txtLink"  value="<%=en4.getLink()%>" class="form-control" id="exampleFormControlInput1" >
                                        </div>

                                        <input type="submit" class="btn btn-outline-success" value="ACTUALIZAR"  name="Registrarse" />
                                        <input type="hidden"  name="accion" value="actualizarEnlace"/>
                                    </form>
                                </div>
                            </div>    




                        </center>
                        <%-- TERMINA FORMULARIO 4
                        --%> 
                    </div>
                </div>
            </div>



            <%------ Empieza el collapse de estados----%> 
            <div class="card">
                <div class="card-header" id="headingThreeEstados">
                    <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThreeEstados" aria-expanded="false" aria-controls="collapseThreeEstados">
                            ESTADOS
                        </button>
                    </h2>
                </div>

                <div id="collapseThreeEstados" class="collapse" aria-labelledby="headingThreeEstados" data-parent="#accordionExample">
                    <div class="card-body">




                        <%
                            Estado es = EstadoBD.obtenerEstado(Integer.parseInt(request.getParameter("cod")));
                        %>

                        <%------ inicia el formulario de estados----%>     
                        <center>    
                            <form action="ServletEstados" method="get">

                                <input type="text" hidden=""  name="txtId_cliente"   value="<%=a.getId_cliente()%>">

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Estado de la Persona</label>
                                        <select id="inputState"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" name="txtEstadoPersona" class="form-control">
                                            <option selected><%=es.getNombre_estado()%></option>
                                            <option>DESEMPLEADO</option>
                                            <option>EMPLEADO</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputState">Status Actual</label>
                                        <select id="inputState"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" name="txtEstatusActual" class="form-control">
                                            <option selected><%=es.getStaus_actual()%></option>
                                            <option>COLOCADO</option>
                                            <option>SIN COLOCAR</option>
                                            <option>PROCESADO SIN COLOCAR</option>
                                        </select>
                                    </div>


                                </div>
                                <div class="form-group">
                                    <label for="inputAddress">Fecha Colocación</label>
                                    <input type="date" name="txtFechaColocacion" value="<%=es.getFecha_colocacion()%>" class="form-control" id="inputAddress" >
                                </div>




                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">ENTREVISTA</label>
                                        <select id="inputState"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" name="txtEntrevista" class="form-control">
                                            <option selected><%=es.getEntrevista()%></option>
                                            <option>SI</option>
                                            <option>NO</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputState">PRUEBA PSICOMÉTRICA</label>
                                        <select id="inputState"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" name="txtPruebaPsico" class="form-control">
                                            <option selected><%=es.getPrueba_psico()%></option>
                                            <option>SI</option>
                                            <option>NO</option>
                                        </select>
                                    </div>
                                </div>  
                                <input type="submit" class="btn btn-outline-success" value="ACTUALIZAR"  name="Registrarse" />
                                <input type="hidden"  name="accion" value="actualizarEstado"/>
                            </form>
                        </center>

                        <form action="formResultado.jsp" method="post">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Email address</label>
                                <input type="text" name="txtPara" value="<%=p.getCorreo()%>" class="form-control" id="exampleFormControlInput1">
                            </div>
                            <input type="submit" class="btn btn-outline-success" value="ACTUALIZAR"  name="Registrarse" />
                        </form>                   

                    </div>




                    <%------ TERMINA el formulario de estados----%>     
                </div>

                <%------ termina el collapse de estados----%> 





            </div>

            <%------ empieza el collapse de subircurriculum----%>  

            <%------ Empieza el collapse de estados----%> 
            <div class="card">
                <div class="card-header" id="headingThreePDF">
                    <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThreePDF" aria-expanded="false" aria-controls="collapseThreePDF">
                            CURRICULUM
                        </button>
                    </h2>
                </div>

                <div id="collapseThreePDF" class ="collapse" aria-labelledby="headingThreePDF" data-parent="#accordionExample">
                    <div class="card-body">
                        <center>
                            <form action="ServletCV" method="post" enctype="multipart/form-data">
                                <input type="text" hidden=""  name="txtId_cliente"   value="<%=a.getId_cliente()%>">
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Nombre Archivo</label>
                                    <input type="text"   name="txtNombre" class="form-control-file" id="exampleFormControlFile1">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Curriculum</label>
                                    <input type="file" name="fichero" class="form-control-file" id="exampleFormControlFile1">
                                </div>
                                <input type="submit" class="btn btn-outline-success" value="enviar"  name="Registrarse" />
                                <input type="hidden"  name="accion" value="actualizarCV"/>
                            </form>

                            <%
                                Fichero f = FicheroBD.obtenerCV(Integer.parseInt(request.getParameter("cod")));
                            %>

                            <a href="pdf?id=<%=f.getCodigo_cliente()%>" target="_blank"><img src="Imagen/mpdf.png" title="pdf"/></a>

                        </center>
                    </div>
                    <%------ TERMINA el formulario de CURRICULUM----%>     
                </div>

                <%------ termina el collapse de estados----%> 





            </div>

            <%------ empieza el collapse de subircurriculum----%>         


        </div>
</html>