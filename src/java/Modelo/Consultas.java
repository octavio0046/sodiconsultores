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
   private String carrera;
   private String estado;

    public Consultas(int id_cliente, String nombre1, String apellido1, int edad, String resicencia, String nivel, String carrera, String estado) {
        this.id_cliente = id_cliente;
        this.nombre1 = nombre1;
        this.apellido1 = apellido1;
        this.edad = edad;
        this.resicencia = resicencia;
        this.nivel = nivel;
        this.carrera = carrera;
        this.estado = estado;
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

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

  

   
   
}
