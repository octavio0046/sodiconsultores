/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Estado;
import Modelo.EstadoBD;
import Modelo.Fichero;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 import org.apache.commons.fileupload.FileItem;
 import java.util.List;
 import org.apache.commons.fileupload.servlet.ServletFileUpload;
 import java.io.File;
import static java.lang.System.out;
 import org.apache.commons.fileupload.disk.DiskFileItemFactory;

/**
 *
 * @author OCTAVIOH
 */
@WebServlet(name = "ServletCV", urlPatterns = {"/ServletCV"})
public class ServletCV extends HttpServlet {

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
    if  (accion.equals("registrarCV")) {
     registrarCV(request, response);
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
  
  

  
   private void registrarCV(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
   
    String arcivourl = "C:\\Users\\OCTAVIOH\\Documents\\SODI_CONSULTORES\\sodiconsultores\\SODI_CONSULTORES\\web\\CV";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024);
        
        factory.setRepository(new File(arcivourl));
        
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
                List<FileItem> partes = upload.parseRequest(request);
                for(FileItem items: partes){
                  File file =  new File(arcivourl,items.getName()); 
                items.write(file);
                }
               out.print("<h2>ARCIVO CORRECTAMENTE SUBIDO-----------</h2>"+"\n\n"+"<a href='index.jsp'>Ver</a>");
                
        } catch  (Exception e) {
             out.print("Exception: "+e.getMessage()+"");
            }
        
        
       // Estado p = new Estado(id_cliente, nombre_estado, estatus_actual, fecha_colocacion, entrevista, pruebapsico);
      
     //    boolean rpta = EstadoBD.actualizarEstado(p);
   // if (rpta) {
     // response.sendRedirect("formFichaUsuarioCliente.jsp?cod="+id_cliente+"");
   // } else {
    //  response.sendRedirect("mensaje2.jsp?men=No se actualizo ");
  //  }
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
