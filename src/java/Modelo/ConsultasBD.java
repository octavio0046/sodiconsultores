/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author OCTAVIOH
 */
public class ConsultasBD {
    
    
    
     // metodo para realizar la consulta completa con 2 o mas campos 
    public static ArrayList<Cliente> obtenerConsultaCompleja(String genero,int edad,String residencia)
  {
      
        
    ArrayList<Cliente> lista = new ArrayList();
    try
    {
      CallableStatement cl = Conexion.getConexion().prepareCall("{call BusquedaCompleja(?,?,?)}");
      cl.setString(1, genero);
       cl.setInt(2, edad);
       cl.setString(3, residencia);
      ResultSet rs = cl.executeQuery();
      while (rs.next())
      {
        Cliente v = new Cliente(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getInt(13),rs.getInt(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18),rs.getInt(19),rs.getString(20)); 
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
