/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Estudio;
import Modelo.EstudioBD;
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
@WebServlet(name = "ServletEstudios", urlPatterns = {"/ServletEstudios"})
public class ServletEstudios extends HttpServlet {

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
     //buscarCliente(request, response);
    } else if (accion.equals("BuscarUnCliente")) {
      //buscarUnCliente(request, response);
    } else if (accion.equals("ActualizarCliente")) {
     // actualizarCliente(request, response);
    } else if (accion.equals("RegistrarUsuario")) {
      //registrarUsuario(request, response);
    
    }else if (accion.equals("ActualizarEstudio")) {
      actualizarEstudio(request, response);
    
    }
  }
  

  //servlet para ACTUALIZAR EL formulario de estudio
  
   private void actualizarEstudio(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
   
        int id_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
        String nombre1 = request.getParameter("txtNombre_nivel_estudio");
        String nombreformacion = request.getParameter("txtNombre_formacion");
        String nombrecampoestudio = request.getParameter("txtNombre_campo_estudio");

        
        Estudio e = new Estudio(id_cliente, nombre1, nombreformacion, nombrecampoestudio);
         boolean rpta = EstudioBD.actualizarEstudio(e);
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