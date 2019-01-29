/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Imagen;
import Modelo.ImagenBD;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author OCTAVIOH
 */
@WebServlet(name = "ServletImagen", urlPatterns = {"/ServletImagen"})
@MultipartConfig(maxFileSize = 16177215)
public class ServletImagen extends HttpServlet {

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
            throws ServletException, IOException {
  
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        String accion = request.getParameter("accion");
    if  (accion.equals("actualizarImagen")) {
     actualizarImagen(request, response);
    }
  }
           
    private void actualizarImagen(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
   
        int id_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
      
   
          InputStream inputStream = null;
        try {
            Part filePart = request.getPart("fichero");
            if (filePart.getSize() > 0) {
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                inputStream = filePart.getInputStream();
            }
        } catch (Exception ex) {
            System.out.println("fichero: "+ex.getMessage());
        }
        Imagen p = new Imagen(id_cliente,inputStream);
      
         boolean rpta = ImagenBD.actualizarImagen(p);
    if (rpta) {
      response.sendRedirect("formFichaUsuarioCliente.jsp?cod="+id_cliente+"");
    } else {
      response.sendRedirect("mensaje2.jsp?men=No se actualizo ");
    }
  }


    
    
    
        
      

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
