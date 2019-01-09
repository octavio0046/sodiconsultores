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
public class EstudioBD {
    
   public static boolean actualizarEstudio(Estudio e)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      
      CallableStatement cl = cn.prepareCall("{call actualizar_estudio(?,?)}");
      cl.setInt(1, e.getId_cliente());
      cl.setString(2, e.getNombre_nivel_estudio());
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
     
     
     
      public static Estudio obtenerEstudio(int codigo) {
        Estudio e=null;
        try {
            CallableStatement  cl = Conexion.getConexion().prepareCall("select * from tb_estudios where id_cliente=?");
            cl.setInt(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                e=new Estudio(rs.getInt(1), rs.getString(2));
                        
            }
        }catch (Exception a) {}
        return e;
    }
 
    
    
    
}
