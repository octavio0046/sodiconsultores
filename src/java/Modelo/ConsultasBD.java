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
    
    
    
     // metodo para realizar la consulta de 8 parametros el resultado lo arroja en formbusquedaCompleja 
    public static ArrayList<Consultas> obtenerConsultaCompleja(String genero,int edad,String residencia,String nivel,String carrera,String estado)
  {
      
    ArrayList<Consultas> lista = new ArrayList();
    try
    {
      CallableStatement cl = Conexion.getConexion().prepareCall("{call BusquedaCompleja(?,?,?,?,?,?)}");
      cl.setString(1, genero);
       cl.setInt(2, edad);
       cl.setString(3, residencia);
       cl.setString(4, nivel);
       cl.setString(5, carrera);
       cl.setString(6, estado);
      ResultSet rs = cl.executeQuery();
      while (rs.next())
      {
        Consultas v = new Consultas(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
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
