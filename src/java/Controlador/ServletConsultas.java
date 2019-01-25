/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import Modelo.Consultas;
import Modelo.ConsultasBD;
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
@WebServlet(name = "ServletConsultas", urlPatterns = {"/ServletConsultas"})
public class ServletConsultas extends HttpServlet {

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
    if  (accion.equals("")) {
     //buscarCliente(request, response);
    } else if (accion.equals("BusquedaCompleja")) {
      BusquedaCompleja(request, response);
    } else if (accion.equals("")) {
     // actualizarCliente(request, response);
    } else if (accion.equals("")) {
      //registrarUsuario(request, response);
    }else if (accion.equals("")) {
      //RegistrarCliente(request, response);
    
    }
  }
  
  
  private void BusquedaCompleja(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
      String genero = request.getParameter("txtGenero");
      int edad= Integer.parseInt(request.getParameter("txtEdad"));
      String residencia = request.getParameter("txtResidencia");
      String nivel = request.getParameter("txtNombre_nivel_estudio");
      String carrera = request.getParameter("txtNombre_formacion");
      String estado = request.getParameter("txtEstadoPersona");
      
      //if(genero.equals("")||residencia.equals("")){
        //genero=null;
       // residencia=null; 
      //}else{
     //    }
    ArrayList<Consultas> lista = new ArrayList();
    lista = ConsultasBD.obtenerConsultaCompleja(genero, edad, residencia, nivel,carrera,estado);
    request.setAttribute("lista", lista);
    request.getRequestDispatcher("formBusquedaCompleja.jsp").forward(request, response);
          
      };
      
      
   

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
