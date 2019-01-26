<%-- 
    Document   : template1
    Created on : 24/09/2018, 07:19:14 PM
    Author     : OctavioHerrera
--%>

<%@page import="Modelo.ClienteBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  session="true"%>

<!DOCTYPE html>
<%

    String usu = "";
    String nom = "";
    HttpSession sesionOK = request.getSession();

    if (sesionOK.getAttribute("perfil") != null) {
        nom = (String) sesionOK.getAttribute("nom") + " " + (String) sesionOK.getAttribute("ape");

    }


%>
<html>
    <div class="cabecera">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="estilos22.css"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: orange; " >
            <a class="navbar-brand" href="#">
                <img src="logo.png" width="40" height="40" alt="">
            </a>
            <a class="navbar-brand" href="index.jsp">INICIO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                    <% if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("ADMIN")) {


                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            CONSULTAS
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" data-toggle="modal" data-target="#BusquedaCompleja">Realizar Busqueda Personalizada</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">#</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            CLIENTES
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ServletClientes?accion=BuscarCliente">Buscar Clientes</a>
                            <a class="dropdown-item"  data-toggle="modal" data-target="#exampleModalLong2" >Registrar Cliente</a>
                            <a class="dropdown-item"  data-toggle="modal" data-target="#exampleModalLong2" >#</a>
                            <div class="dropdown-divider"></div>

                        </div>
                    </li>



                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            USUARIOS
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="registrarUsuario.jsp">Registrar Usuario</a>
                            <a class="dropdown-item" href="ServletUsuarios?accion=MostrarUsuarios">Mostrar Usuarios</a>

                        </div>
                    </li>

                    <% }
                        if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("EMPRESARIAL")) {

                    %>


                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            PACIENTES
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ServletPacientes?accion=BuscarPaciente">Buscar Paciente</a>
                            <a class="dropdown-item" href="formRegistrarPaciente.jsp">RegistrarPaciente</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">#</a>
                        </div>
                    </li>


                    <%                    }

                    %>


                    <%if (sesionOK.getAttribute("perfil") != null) {

                            //si alguien ya inicio sesion entonces mostrar su nombre 
                    %>


                    <li class="nav-item">
                        <a class="nav-link disabled" href="ServletLogueo?accion=cerrar">CERRAR SESION</a>

                    </li>

                    <li class="nav-item">
                        <a class="nav-link disabled" ><%out.println("Bienvenido:  " + nom);%></a>

                    </li>


                </ul>

                <%
                    }
                %>

                <%
                    //si alguien no ha iniciado sesion entonces muestra el iniciar sesion
                    if (sesionOK.getAttribute("perfil") == null) {


                %>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#exampleModalLong">INICIAR SESION</a>
                </li>

            </div>
        </nav>
        <%                }
        %>


    </div>


    <body>      


        <!-- Modal -->
        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5  class="modal-title" id="exampleModalLongTitle">LOGIN</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">



                        <center>
                            <form class="login" action="ServletLogueo" method="post" >
                                <input type="hidden" name="accion" value="loguin"/>

                                <label>Usuario:</label>
                                <input type="text" placeholder="Usuario" name="txtUsu"    required=""  >
                                <br><br>
                                <label>Contraseña:</label>
                                <input type="password" placeholder="Password" name="txtPas" required="">
                                <br><br> <input type="submit"  class="btn btn-success"  value="Iniciar Sesion" >  
                            </form>
                        </center>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>



        <!-- iinicio Modal para validar Cliente -->
        <div class="modal fade" id="exampleModalLong2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5  class="modal-title" id="exampleModalLongTitle">VALIDACION DE CLIENTE</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <center>
                            <form class="login" action="ServletClientes" method="post" >
                                <input type="hidden" name="accion" value="ValidarCliente"/>
                                <label>DPI</label>
                                <input type="text"  name="txtDpi">
                                <br><br>
                                <input type="submit"  class="btn btn-success"  value="VALIDAR" data-toggle="modal" data-target="#exampleModalLong2" >  
                            </form>
                        </center>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- FIN Modal para validar un cliente -->   

        <!-- Modal para busqueda compleja boton realizar busqueda completa -->
        <!-- Modal -->
        <div class="modal fade" id="BusquedaCompleja" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="width: 500px; height: 500px; ">

                        <form action="ServletConsultas" method="get" style="width: 400px; height:400px; ">
                            <input type="hidden" name="accion" value="BusquedaCompleja" />
                            <label>DATOS PERSONALES</label>
                            <div class="row">
                                <div class="col">
                                    <label for="exampleFormControlSelect1">GENERO</label>
                                    <select class="form-control"  plasholder="Genero"  name="txtGenero" id="exampleFormControlSelect1">
                                        <option></option>
                                        <option>MASCULINO</option>
                                        <option>FEMENINO</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="exampleFormControlSelect1">EDAD</label>
                                    <input type="number" name="txtEdad" value="0" class="form-control" >
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="exampleFormControlSelect1">RESIDENCIA</label>
                                    <select class="form-control"    style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();"  name="txtResidencia" id="exampleFormControlSelect1">
                                        <option></option>
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
                                <div class="col">
                                    <label for="exampleFormControlSelect1">NIVEL ESTUDIO</label>
                                    <select name="txtNombre_nivel_estudio"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" class="form-control" id="exampleFormControlSelect1">
                                        <option></option>
                                        <option>PRIMARIA</option>
                                        <option>BÁSICO</option>
                                        <option>DIVERSIFICADO</option>
                                        <option>UNIVERSITARIO</option>
                                        <option>DOCTORADO</option>
                                        <option>POST-GRADO</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="exampleFormControlSelect1">CARRERA</label>
                                    <select name="txtNombre_formacion"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" class="form-control" id="exampleFormControlSelect1">
                                        <option></option>
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
                                <div class="col">
                                    <label for="exampleFormControlSelect1">ESTADO</label>
                                    <select id="inputState"  style="text-transform:uppercase;" onkeyup="javascript:this.value = this.value.toUpperCase();" name="txtEstadoPersona" class="form-control">
                                        <option selected></option>
                                        <option>DESEMPLEADO</option>
                                        <option>EMPLEADO</option>
                                    </select>
                                </div>
                            </div>

                            <br> <br>  <input type="submit"  class="btn btn-success"  value="Buscar" >    
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
