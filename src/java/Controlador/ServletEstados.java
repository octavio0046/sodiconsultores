/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Estado;
import Modelo.EstadoBD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author OCTAVIOH
 */
@WebServlet(name = "ServletEstados", urlPatterns = {"/ServletEstados"})
public class ServletEstados extends HttpServlet {

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
    if  (accion.equals("actualizarEstado")) {
     actualizarEstado(request, response);
    } else if (accion.equals("BuscarUnCliente")) {
      //buscarUnCliente(request, response);
    } else if (accion.equals("ActualizarCliente")) {
     // actualizarCliente(request, response);
    } else if (accion.equals("RegistrarUsuario")) {
      //registrarUsuario(request, response);
    
    }else if (accion.equals("RegistrarCliente")) {
      //registrarCliente(request, response);
    
    }
  }
  
  

  
   private void actualizarEstado(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
   
        int id_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
        String nombre_estado = request.getParameter("txtEstadoPersona");
        String estatus_actual = request.getParameter("txtEstatusActual");
        String fecha_colocacion = request.getParameter("txtFechaColocacion");
        String entrevista = request.getParameter("txtEntrevista");
        String pruebapsico = request.getParameter("txtPruebaPsico");

        
        Estado p = new Estado(id_cliente, nombre_estado, estatus_actual, fecha_colocacion, entrevista, pruebapsico);
      
         boolean rpta = EstadoBD.actualizarEstado(p);
    if (rpta) {
      response.sendRedirect("mensaje2.jsp?men=Se actualizo de manera correcta");
    } else {
      response.sendRedirect("mensaje2.jsp?men=No se actualizo ");
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
