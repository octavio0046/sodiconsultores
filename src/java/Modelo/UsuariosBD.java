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

/**
 *
 * @author OCTAVIOH
 */
public class UsuariosBD {
    
    
   public static boolean actualizarUsuario(Usuarios varproducto)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      
      CallableStatement cl = cn.prepareCall("{call ACTUALIZAR_USUARIO(?,?,?,?,?,?,?,?,?)}");
      cl.setInt(1, varproducto.getCodigo_usuario());
      cl.setString(2, varproducto.getApellido_usuario());
      cl.setString(3, varproducto.getNombre_usuario());
      cl.setString(4, varproducto.getPais());
      cl.setString(5, varproducto.getPerfil());
      cl.setString(6, varproducto.getCorreo());
      cl.setString(7, varproducto.getClave());
      cl.setString(8, varproducto.getFecha());
      cl.setString(9, varproducto.getEstado());
      
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
    
    
    public static boolean EliminarUsuario(int cod)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      CallableStatement cl = cn.prepareCall("{call ELIMINAR_USUARIOS(?)}");
      cl.setInt(1, cod);
      
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
  
  public static boolean EliminarPresupuesto(int cod)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      CallableStatement cl = cn.prepareCall("{call ELIMINAR_PRESUPUESTO(?)}");
      cl.setInt(1, cod);
      
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
    
    public static ArrayList<Usuarios> obtenerUsuarios()
  {
    ArrayList<Usuarios> lista = new ArrayList();
    try
    {
      CallableStatement cl = Conexion.getConexion().prepareCall(" SELECT * FROM TB_USUARIOS WHERE ESTADO='ACTIVO'");
      ResultSet rs = cl.executeQuery();
      while (rs.next())
      {
        Usuarios v = new Usuarios(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
        lista.add(v);
      }
    }
    catch (Exception e)
    {
      System.out.println("ventas-->" + e);
    }
    return lista;
  }
    
    public static boolean insertarUsuarios(Usuarios p)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      CallableStatement cl = cn.prepareCall("{call INSERTAR_USUARIOS(?,?,?,?,?,?,?)}");
      cl.setString(1, p.getApellido_usuario());
      cl.setString(2, p.getNombre_usuario());
      cl.setString(3, p.getPais());
      cl.setString(4, p.getPerfil());
      cl.setString(5, p.getCorreo());
      cl.setString(6, p.getClave());
      cl.setString(7, p.getEstado());
      
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
