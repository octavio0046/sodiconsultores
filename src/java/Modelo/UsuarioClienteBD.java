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
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author OCTAVIOH
 */
public class UsuarioClienteBD {
    
    
    public static int insertarUsuariosCliente(UsuarioCliente p)
  {
    int rpta = 0;
    try
    {
      Connection cn = Conexion.getConexion();
      CallableStatement cl = cn.prepareCall("{call insertar_usuario_cliente(?,?,?)}");
      cl.registerOutParameter(1,Types.INTEGER);
      cl.setString(2, p.getCorreo());
      cl.setString(3, p.getPass());
      int i = cl.executeUpdate();
      if (i == 1) {
          p.setId_usu_clie(cl.getInt(1));
         } else {
        rpta = 0;
      }
    }
    catch (Exception localException) {}
    return p.getId_usu_clie();
  }
    
   
    //este metodo trae todo los datos de la tabla tb_usuario_cliente
    //muestra en formFichaUsuarioCliente
public static ArrayList<UsuarioCliente> obtenerUsuarioCliente(int num)
  {
    ArrayList<UsuarioCliente> lista = new ArrayList();
    try
    {
      CallableStatement cl = Conexion.getConexion().prepareCall("SELECT * FROM tb_usuario_cliente where id_usu_clie = ?");
      
      cl.setInt(1, num);
      ResultSet rs = cl.executeQuery();
      while (rs.next())
      {
        UsuarioCliente v = new UsuarioCliente(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5));
        lista.add(v);
      }
    }
    catch (Exception e)
    {
      System.out.println(e);
    }
    return lista;
  }    
    
    
    
    
    
}
