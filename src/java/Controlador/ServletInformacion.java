/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Informacion;
import Modelo.InformacionBD;
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
@WebServlet(name = "ServletInformacion", urlPatterns = {"/ServletInformacion"})
public class ServletInformacion extends HttpServlet {

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
     // buscarUnCliente(request, response);
    } else if (accion.equals("ActualizarInformacion")) {
      actualizarInformacion(request, response);
    } else if (accion.equals("RegistrarUsuario")) {
      //registrarUsuario(request, response);
    
    }
  }
  
  
  
  
  
   private void actualizarInformacion(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
   
        int id_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
        int numero = Integer.parseInt(request.getParameter("txtNumero"));
        int duracion_promedio = Integer.parseInt(request.getParameter("txtDuracion"));
        
        Informacion i = new Informacion(id_cliente, numero, duracion_promedio);
      
         boolean rpta = InformacionBD.actualizarInformacion(i);
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
