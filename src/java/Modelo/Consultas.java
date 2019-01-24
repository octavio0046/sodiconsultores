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
public class Consultas {
   
   private int id_cliente ;
   private String nombre1;
   private String apellido1;
   private int edad;
   private String resicencia;
   private String nivel;
   private String correo;
   private String fecha_registro;

    public Consultas(int id_cliente, String nombre1, String apellido1, int edad, String resicencia, String nivel, String correo, String fecha_registro) {
        this.id_cliente = id_cliente;
        this.nombre1 = nombre1;
        this.apellido1 = apellido1;
        this.edad = edad;
        this.resicencia = resicencia;
        this.nivel = nivel;
        this.correo = correo;
        this.fecha_registro = fecha_registro;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getResicencia() {
        return resicencia;
    }

    public void setResicencia(String resicencia) {
        this.resicencia = resicencia;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
   
   
   
   
}
