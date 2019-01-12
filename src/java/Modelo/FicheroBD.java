/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;

/**
 *
 * @author OCTAVIOH
 */
public class FicheroBD {
    
    
     public static boolean insertarFichero(Fichero p)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      CallableStatement cl = cn.prepareCall("{call insertar_pdf(?,?)}");
      cl.setInt(1, p.getCodigo_cliente());
      cl.setString(2, p.getNombrepdf());
  
      
      int i = cl.executeUpdate();
      if (i == 1) {
        rpta = true;
      } else {
        rpta = false;
      }
    }
    catch (Exception localException) {}
    return rpta;
  }
    
    
     
    
    
    
}
