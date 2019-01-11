/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Modelo.Cliente;
import Modelo.ClienteBD;
import Modelo.Usuarios;
import Modelo.UsuariosBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author OCTAVIOH
 */
@WebServlet(name = "ServletUsuarios", urlPatterns = {"/ServletUsuarios"})
public class ServletUsuarios extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String accion = request.getParameter("accion");
    if  (accion.equals("MostrarUsuarios")) {
      mostrarUsuarios(request, response);
    } else if (accion.equals("EliminarUsuario")) {
      eliminarUsuarios(request, response);
    } else if (accion.equals("ModificarUsuario")) {
      actualizarUsuario(request, response);
    } else if (accion.equals("RegistrarUsuario")) {
      registrarUsuario(request, response);
    
    }else if (accion.equals("RegistrarUsuarioA")) {
      registrarCliente(request, response);
    
    }
  }
  
  
  

  


  
  private void eliminarUsuarios(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    int cod = Integer.parseInt(request.getParameter("txtCodigoUsuario"));
    
    boolean rpta = UsuariosBD.EliminarUsuario(cod);
    if (rpta) {
      response.sendRedirect("formFichaUsuarioCliente.jsp?cod="+cod+"");
    } else {
      response.sendRedirect("mensaje2.jsp?men = No se elimino el Usuario correctamente");
    }
  }
  
 
  
  private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
    String apellido = request.getParameter("txtApellido");
    String nombre = request.getParameter("txtNombre");
    String pais = request.getParameter("txtPais");
    String perfil = request.getParameter("txtPerfil");
    String correo = request.getParameter("txtCorreo");
    String clave = request.getParameter("txtClave");
    String fecha = request.getParameter("txtFecha");
    String estado = request.getParameter("txtEstado");
    
    Usuarios p = new Usuarios(codigo, apellido, nombre, pais, perfil, correo, clave, fecha, estado);
    boolean rpta = UsuariosBD.actualizarUsuario(p);
    if (rpta) {
      response.sendRedirect("mensaje2.jsp?men=Se actualizo de manera correcta");
    } else {
      response.sendRedirect("mensaje2.jsp?men=No se actualizo ");
    }
  }
  

  
  
 
  private void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    ArrayList<Usuarios> lista = new ArrayList();
    lista = UsuariosBD.obtenerUsuarios();
    request.setAttribute("lista", lista);
    request.getRequestDispatcher("mostrarUsuarios.jsp").forward(request, response);
  }
  
  
  private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String ape = request.getParameter("txtApellido");
    String nom = request.getParameter("txtNombre");
    String pais = request.getParameter("txtPais");
    String perfil = request.getParameter("txtPerfil");
    String correo = request.getParameter("txtCorreo");
    String clave = request.getParameter("txtClave");
    String estado = request.getParameter("txtEstado");
    
    Usuarios p = new Usuarios(ape, nom, pais, perfil, correo, clave, estado);
    
    boolean rpta = UsuariosBD.insertarUsuarios(p);
    if (rpta) {
      response.sendRedirect("mensaje2.jsp?men=se Registro  correctamente");
    } else {
      response.sendRedirect("mensaje2.jsp?men=No se regisro  correctamente");
    }
  }
  
  
    private void registrarCliente(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
     int id_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
        String nombre_usuario = request.getParameter("txtNombreUsuario");
        int id_usuario_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
        String nombre1 = request.getParameter("txtNombre1");
        String nombre2 = request.getParameter("txtNombre2");
        String apellido1 = request.getParameter("txtApellido1");
        String apellido2 = request.getParameter("txtApellido2");
        String nacimiento = request.getParameter("txtNacimiento");
        int edad = Integer.parseInt(request.getParameter("txtEdad"));
        String pais = request.getParameter("txtPais");
        String departamento = request.getParameter("txtDepartamento");
        String recidencia = request.getParameter("txtRecidencia");
        String direccion = request.getParameter("txtDireccion");
        int tel1 = Integer.parseInt(request.getParameter("txtTelefono1"));
        int tel2 = Integer.parseInt(request.getParameter("txtTelefono2"));
        int recidencial = Integer.parseInt(request.getParameter("txtRecidencial"));
        String correo = request.getParameter("txtCorreo");


     Cliente p = new Cliente(id_cliente, nombre_usuario, id_usuario_cliente, nombre1, nombre2, apellido1,
            apellido2, nacimiento, edad, pais, departamento, recidencia, direccion, tel1, tel2, recidencial, correo);
    
    boolean rpta = ClienteBD.insertarCliente(p);
    if (rpta) {
      response.sendRedirect("mensaje2.jsp?men=se Registro  correctamente");
    } else {
      response.sendRedirect("mensaje2.jsp?men=No se regisro  correctamente");
    }
  }

  

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  
  public String getServletInfo()
  {
    return "Short description";
  }
}
