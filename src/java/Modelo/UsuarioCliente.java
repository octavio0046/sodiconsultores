/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author OCTAVIOH
 */
public class UsuarioCliente {

private int id_usu_clie;    
private String correo;
private String pass;
private String fecha_creacion;
private int estado;

//esete constructor lo utiliza el metodo obtenerUsuarioCliente  en la clase UsuarioClienteBD para traer todo los 
//usuariosClientes
    public UsuarioCliente(int id_usu_clie, String correo, String pass, String fecha_creacion, int estado) {
        this.id_usu_clie = id_usu_clie;
        this.correo = correo;
        this.pass = pass;
        this.fecha_creacion = fecha_creacion;
        this.estado = estado;
    }







   ///este constructor es para el insertar en la tabla tb_usuario_cliente en e
//la clase UsuarioClienteBD y en el controlador Servlet UsuarioCliente
    public UsuarioCliente(String correo, String pass) {
        this.correo = correo;
        this.pass = pass;
    }

    public int getId_usu_clie() {
        return id_usu_clie;
    }

    public void setId_usu_clie(int id_usu_clie) {
        this.id_usu_clie = id_usu_clie;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    


}
