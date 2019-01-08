/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;


public class ClienteBD {
    
    
    
     public static boolean insertarCliente(Cliente p)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      CallableStatement cl = cn.prepareCall("{call insertar_cliente (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
      cl.setInt(1, p.getId_cliente());
      cl.setString(2, p.getNombre_usuario());
      cl.setInt(3, p.getId_usu_clie());
      cl.setString(4, p.getNombre1());
      cl.setString(5, p.getNombre2());
      cl.setString(6, p.getApellido1());
      cl.setString(7, p.getApellido2());
      cl.setString(8, p.getNacimiento());
      cl.setInt(9, p.getEdad());
      cl.setString(10, p.getPais());
      cl.setString(11, p.getDepartamento());
      cl.setString(12, p.getRecidencia());
      cl.setString(13, p.getDireccion());
      cl.setInt(14, p.getTel1());
      cl.setInt(15, p.getTel2());
      cl.setInt(16, p.getRecidencial());
      cl.setString(17, p.getCorreo());
      
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
