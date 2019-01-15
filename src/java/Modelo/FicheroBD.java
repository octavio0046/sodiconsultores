/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Conexion;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

/**
 *
 * @author OCTAVIOH
 */
public class FicheroBD {

    public static boolean actualizarFichero(Fichero p) {
        boolean rpta = false;
        try {
            Connection cn = Conexion.getConexion();
            CallableStatement cl = cn.prepareCall("{call actualizar_pdf(?,?,?)}");
            cl.setInt(1, p.getCodigo_cliente());
            cl.setString(2, p.getNombrepdf());
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

    //metodo para mostrar ña tabla tb_pdf y mostrara el el formulario formUsuarioCliente
    public static Fichero obtenerCV(int codigo) {
        Fichero f = null;
        try {
            CallableStatement cl = Conexion.getConexion().prepareCall("select * from tb_pdf where id_cliente=? ");
            cl.setInt(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                f = new Fichero(rs.getInt(1), rs.getString(2), rs.getBytes(3));

            }
        } catch (Exception a) {
        }
        return f;
    }

   

}
