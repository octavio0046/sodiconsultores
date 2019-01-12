<%-- 
    Document   : uploadfile
    Created on : 11/01/2019, 05:51:15 PM
    Author     : OCTAVIOH
--%>

<%@page import="Modelo.FicheroBD"%>
<%@page import="Modelo.Fichero"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
       
        int codigo = Integer.parseInt(request.getParameter("cod"));
        String arcivourl = "C:\\Users\\OCTAVIOH\\Documents\\SODI_CONSULTORES\\sodiconsultores\\SODI_CONSULTORES\\web\\CV";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024);
        factory.setRepository(new File(arcivourl));
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        String nombre ="";

        try {
            
                List<FileItem> partes = upload.parseRequest(request);
                for(FileItem items: partes){
                  File file =  new File(arcivourl,items.getName());
                  nombre=items.getName();
                items.write(file);
                }
                
          Fichero p = new Fichero(codigo, nombre);
 
           boolean rpta=FicheroBD.actualizarFichero(p);
          
          
    if (rpta) {
      response.sendRedirect("formFichaUsuarioCliente.jsp?cod="+codigo+"");
    } else {
      response.sendRedirect("mensaje2.jsp?men=No se actualizo ");
    }
                
        } catch  (Exception e) {
             out.print("Exception: "+e.getMessage()+"");
            }
        %>     
        


        
    </body>
</html>
