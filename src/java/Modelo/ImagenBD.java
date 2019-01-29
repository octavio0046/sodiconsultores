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
public class ImagenBD {
    
    /**
      public static ArrayList<Imagen> obtenerImaPerfil (int id) {
        ArrayList<Imagen> lista = new ArrayList();
        try {
            CallableStatement cl = Conexion.getConexion().prepareCall("select * from tb_imagen where id_cliente=?");
            cl.setInt(1, id);

            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                Imagen v = new Imagen(rs.getInt(1),);
                lista.add(v);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return lista;
    }  
    */ 
      
    public static boolean actualizarImagen(Imagen p) {
        boolean rpta = false;
        try {
            Connection cn = Conexion.getConexion();
            CallableStatement cl = cn.prepareCall("{call actualizar_imagen(?,?)}");
            cl.setInt(1, p.getCodigo_cliente());
            cl.setBlob(3, p.getArchivopdf());
            int i = cl.executeUpdate();
            if (i == 1) {
                rpta = true;
            } else {
                rpta = false;
            }
        } catch (Exception localException) {
        }
        return rpta;
    }
   
      
    
}
