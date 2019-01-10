/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import Modelo.ClienteBD;
import Modelo.Enlace;
import Modelo.EnlaceBD;
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
@WebServlet(name = "ServletEnlaces", urlPatterns = {"/ServletEnlaces"})
public class ServletEnlaces extends HttpServlet {

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
    if  (accion.equals("actualizarEnlace")) {
     actualizarEnlace(request, response);
    } else if (accion.equals("BuscarUnCliente")) {
    //  buscarUnCliente(request, response);
    } else if (accion.equals("ActualizarCliente")) {
     // actualizarCliente(request, response);
    } else if (accion.equals("RegistrarUsuario")) {
      //registrarUsuario(request, response);
    
    }else if (accion.equals("RegistrarCliente")) {
      //registrarCliente(request, response);
    
    }
  }

   private void actualizarEnlace(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
   
        int id_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
        String nombre_enlace = request.getParameter("txtNombre_enlace");
        String link = request.getParameter("txtLink");
   
        
        Enlace p = new Enlace(id_cliente, nombre_enlace, link);
      
         boolean rpta = EnlaceBD.actualizarEnlace(p);
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