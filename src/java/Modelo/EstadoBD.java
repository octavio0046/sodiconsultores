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
public class EstadoBD {
    
    
    
    
     public static boolean actualizarEstado(Estado p)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      
      CallableStatement cl = cn.prepareCall("{call actualizar_estado(?,?,?,?,?,?)}");
      cl.setInt(1, p.getId_cliente());
      cl.setString(2, p.getNombre_estado());
      cl.setString(3, p.getStaus_actual());
      cl.setString(4, p.getFecha_colocacion());
      cl.setString(5, p.getEntrevista());
      cl.setString(6, p.getPrueba_psico());
    
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
          public static Estado obtenerEstado(int codigo) {
        Estado es=null;
        try {
            CallableStatement  cl = Conexion.getConexion().prepareCall("select * from tb_estados where id_cliente=?");
            cl.setInt(1, codigo);
  
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                es=new Estado(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                        
            }
        }catch (Exception a) {}
        return es;
    }       
    
    
}
