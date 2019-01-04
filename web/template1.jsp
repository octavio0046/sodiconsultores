<%-- 
    Document   : template1
    Created on : 24/09/2018, 07:19:14 PM
    Author     : OctavioHerrera
--%>

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
         
<nav class="navbar navbar-expand-lg navbar-dark bg-primary " >
  <a class="navbar-brand" href="index.jsp">INICIO</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
 
   
      
    
              <%                   if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("ADMIN")) {


                    %>
      
      
      
      
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            CONSULTAS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="obtenerPagosInter.jsp">Buscar Pagos en Intervalo</a>
        
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">#</a>
        </div>
      </li>
      
      
      
               
                    <%                }

                        
                    %>

         
                 

                <%        if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("ADMIN")) {


                %>
      
          <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   PACIENTES A
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="ServletPacientes?accion=BuscarPaciente">Buscar Paciente</a>
          <a class="dropdown-item" href="formRegistrarPaciente.jsp">Registrar Paciente</a>
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

      
      
             <%                    }

                if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("ASISTENTE")) {



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
        <a class="nav-link" data-toggle="modal" data-target="#exampleModalLong" >INICIAR SESION</a>
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
                <input type="text" placeholder="Usuario" name="txtUsu"  pattern="[A-Z]+"  required=""  title="SOLO MAYUSCULAS">
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
        
        
    </body>
</html>
