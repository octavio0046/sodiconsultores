/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

/**
 *
 * @author OCTAVIOH
 */
public class FicheroBD {
    
    
     public static boolean actualizarFichero(Fichero p)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      CallableStatement cl = cn.prepareCall("{call actualizar_pdf(?,?)}");
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
    
    
     
    
      //metoo para obtener el df del cliente
          public static Fichero obtenerFichero(int codigo) {
        Fichero f=null;
        try {
            CallableStatement  cl = Conexion.getConexion().prepareCall("select * from tb_pdf where id_cliente=?");
            cl.setInt(1, codigo);
  
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                f=new Fichero(rs.getInt(1), rs.getString(2));
                        
            }
        }catch (Exception a) {}
        return f;
    } 
    
}
