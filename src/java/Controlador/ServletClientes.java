/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import Modelo.ClienteBD;
import Utils.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author OCTAVIOH
 */
@WebServlet(name = "ServletClientes", urlPatterns = {"/ServletClientes"})
public class ServletClientes extends HttpServlet {

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
    if  (accion.equals("BuscarCliente")) {
     buscarCliente(request, response);
    } else if (accion.equals("BuscarUnCliente")) {
      buscarUnCliente(request, response);
    } else if (accion.equals("ActualizarCliente")) {
      actualizarCliente(request, response);
    } else if (accion.equals("ValidarCliente")) {
      ValidarCliente(request, response);
    }else if (accion.equals("RegistrarCliente")) {
      RegistrarCliente(request, response);
    
    }
  }
  
  
  private void ValidarCliente(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String dpi = request.getParameter("txtDpi");  
   
    

         Cliente e = ClienteBD.validarCliente(dpi);
    if (e!=null) {
      response.sendRedirect("formFichaUsuarioCliente.jsp?cod="+e.getId_cliente()+"");
    } else {
      response.sendRedirect("formRegistrarCliente.jsp?dpi="+dpi+"");
    }
    
    
    
         //request.setAttribute("msg", "no existe la persona");
          //request.getRequestDispatcher("formRegistrarCliente.jsp?dpi="+dpi+"").forward(request, response);
      
    
  }
  
  
  private void buscarUnCliente(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    ArrayList<Cliente> lista = new ArrayList();
    lista = ClienteBD.obtenerUnCliente(request.getParameter("txtNombre"));
    request.setAttribute("lista", lista);
    request.getRequestDispatcher("formBuscarCliente.jsp").forward(request, response);
  }
  
  
  private void buscarCliente(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    ArrayList<Cliente> lista = new ArrayList();
    lista = ClienteBD.obtenerClientes();
    request.setAttribute("lista", lista);
    request.getRequestDispatcher("formBuscarCliente.jsp").forward(request, response);
  }
  
 
  
   private void actualizarCliente(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
   
        int id_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
         String dpi = request.getParameter("txtDpi");
        String nombre1 = request.getParameter("txtNombre1");
        String nombre2 = request.getParameter("txtNombre2");
        String apellido1 = request.getParameter("txtApellido1");
        String apellido2 = request.getParameter("txtApellido2");
        String nacimiento = request.getParameter("txtNacimiento");
        String pais = request.getParameter("txtPais");
        String departamento = request.getParameter("txtDepartamento");
        String recidencia = request.getParameter("txtRecidencia");
        String direccion = request.getParameter("txtDireccion");
        int tel1 = Integer.parseInt(request.getParameter("txtTelefono1"));
        int tel2 = Integer.parseInt(request.getParameter("txtTelefono2"));
        int recidencial = Integer.parseInt(request.getParameter("txtRecidencial"));
        String correo = request.getParameter("txtCorreo"); 
        String nombre_usuario = request.getParameter("txtNombreUsuario");
        int estado = Integer.parseInt(request.getParameter("txtEstado"));
        String genero=request.getParameter("txtGenero");
        
        Cliente p = new Cliente(id_cliente,dpi, nombre1, nombre2, apellido1, 
                apellido2, nacimiento, pais, departamento, recidencia, direccion,
                tel1, tel2, recidencial, correo, nombre_usuario,estado,genero);
      
         boolean rpta = ClienteBD.actualizarCliente(p);
    if (rpta) {
      response.sendRedirect("formFichaUsuarioCliente.jsp?cod="+id_cliente+"");
    } else {
      response.sendRedirect("mensaje2.jsp?men=Realize el procedimiento nuevamente ");
    }
  }
   
    private void RegistrarCliente(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {   
           String dpi = request.getParameter("txtDpi");  
          
         int variable = ClienteBD.insertarCliente(dpi);
    if (variable!=0) {
     response.sendRedirect("formFichaUsuarioCliente.jsp?cod="+variable+"");
    } else {
      response.sendRedirect("mensaje2.jsp?men=Realize el procedimiento nuevamente ");
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
