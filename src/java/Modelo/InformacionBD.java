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
public class InformacionBD {

    public static boolean actualizarInformacion(Informacion i) {
        boolean rpta = false;
        try {
            Connection cn = Conexion.getConexion();

            CallableStatement cl = cn.prepareCall("{call actualizar_info(?,?,?)}");
            cl.setInt(1, i.getId_cliente());
            cl.setInt(2, i.getNumero());
            cl.setInt(3, i.getDuracion_promedio());

            int i2 = cl.executeUpdate();
            if (i2 == 1) {
                rpta = true;
            } else {
                rpta = false;
            }
        } catch (Exception localException) {
        }
        return rpta;
    }
    
    
    //metodo para mostrar la table informacion en la ficha usuariocliente.jsp para el formulario 3
          public static Informacion obtenerInformacion(int codigo) {
        Informacion i=null;
        try {
            CallableStatement  cl = Conexion.getConexion().prepareCall("select * from tb_info where id_cliente=?");
            cl.setInt(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                i=new Informacion(rs.getInt(1), rs.getInt(2), rs.getInt(3));
                        
            }
        }catch (Exception a) {}
        return i;
    }
    
    

}
