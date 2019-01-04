package Controlador;

import Utils.Conexion;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="ServletLogueo", urlPatterns={"/ServletLogueo"})
public class ServletLogueo
  extends HttpServlet
{
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String accion = request.getParameter("accion");
    if (accion.equals("loguin"))
    {
      String usu = request.getParameter("txtUsu");
      String pas = request.getParameter("txtPas");
      try
      {
        CallableStatement cl = Conexion.getConexion().prepareCall("SELECT * FROM TB_USUARIOS WHERE NOMBRE_USUARIO = ? AND CLAVE_USUARIO = ?");
        
        cl.setString(1, usu);
        cl.setString(2, pas);
        ResultSet rs = cl.executeQuery();
        if (rs.next())
        {
          HttpSession sesionOK = request.getSession();
          sesionOK.setAttribute("perfil", rs.getString(5));
          sesionOK.setAttribute("nom", rs.getString(3));
          sesionOK.setAttribute("ape", rs.getString(2));
          request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        else
        {
          request.setAttribute("msg", "Error de Usu o pas");
          request.getRequestDispatcher("login.jsp").forward(request, response);
        }
      }
      catch (Exception e)
      {
        System.out.println(e);
      }
    }
    else if (accion.equals("cerrar"))
    {
      HttpSession cerrar_sesion = request.getSession();
      
      cerrar_sesion.removeAttribute("perfil");
      cerrar_sesion.removeAttribute("nom");
      cerrar_sesion.removeAttribute("ape");
      cerrar_sesion.invalidate();
      request.getRequestDispatcher("index.jsp").forward(request, response);
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
