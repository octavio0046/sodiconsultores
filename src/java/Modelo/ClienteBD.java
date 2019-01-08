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
import java.util.ArrayList;


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
    
    
     
    public static ArrayList<Cliente> obtenerCodCliente(int num)
  {
    ArrayList<Cliente> lista2 = new ArrayList();
    try
    {
      CallableStatement cl = Conexion.getConexion().prepareCall(" select  * from tb_clientes where id_cliente=? ");
      cl.setInt(1, num);
      ResultSet rs = cl.executeQuery();
      while (rs.next())
      {
        Cliente v = new Cliente(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getString(16),rs.getString(17),rs.getString(18),rs.getString(19),rs.getInt(20));
        lista2.add(v);
      }
    }
    catch (Exception e)
    {
      System.out.println(e);
    }
    return lista2;
  }
    
    
 public static Cliente obtenerClientePrueba(int codigo) {
        Cliente p=null;
        try {
            CallableStatement  cl = Conexion.getConexion().prepareCall("select * from tb_clientes where id_cliente = ?");
            cl.setInt(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                p=new Cliente(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getString(16),rs.getString(17),rs.getString(18),rs.getString(19),rs.getInt(20)); 
                        
            }
        }catch (Exception e) {}
        return p;
    }
 
    
    
    
    
    
    
    
    
}
