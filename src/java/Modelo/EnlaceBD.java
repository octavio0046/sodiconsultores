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
public class EnlaceBD {
    
    
     public static boolean actualizarEnlace(Enlace p)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      
      CallableStatement cl = cn.prepareCall("{call actualizar_enlace(?,?,?)}");
      cl.setInt(1, p.getId_cliente());
      cl.setString(2, p.getNombre_enlace());
      cl.setString(3, p.getLink());
;
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
  

    
    
    
    
    
    
    
    
    
    
    
    
    //metodo para mostrar la table informacion en la ficha usuariocliente.jsp para el formulario 3
          public static Enlace obtenerEnlace(int codigo,String codigo2) {
        Enlace e=null;
        try {
            CallableStatement  cl = Conexion.getConexion().prepareCall("select * from tb_enlaces where id_cliente=? and nombre_enlace=?");
            cl.setInt(1, codigo);
            cl.setString(2, codigo2);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                e=new Enlace(rs.getInt(1), rs.getString(2),rs.getString(3));
                        
            }
        }catch (Exception a) {}
        return e;
    }   
    
          
      
                
                
       
        
            
          
    
}
