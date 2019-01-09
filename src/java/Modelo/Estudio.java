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
public class Estudio {
  private int id_cliente;
  private String nombre_nivel_estudio;
  private String nombre_formacion;
  private String nombre_campo_estudio;

  
  //constructor para insertar niveles de estudio

    public Estudio(int id_cliente, String nombre_nivel_estudio, String nombre_formacion, String nombre_campo_estudio) {
        this.id_cliente = id_cliente;
        this.nombre_nivel_estudio = nombre_nivel_estudio;
        this.nombre_formacion = nombre_formacion;
        this.nombre_campo_estudio = nombre_campo_estudio;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNombre_nivel_estudio() {
        return nombre_nivel_estudio;
    }

    public void setNombre_nivel_estudio(String nombre_nivel_estudio) {
        this.nombre_nivel_estudio = nombre_nivel_estudio;
    }

    public String getNombre_formacion() {
        return nombre_formacion;
    }

    public void setNombre_formacion(String nombre_formacion) {
        this.nombre_formacion = nombre_formacion;
    }

    public String getNombre_campo_estudio() {
        return nombre_campo_estudio;
    }

    public void setNombre_campo_estudio(String nombre_campo_estudio) {
        this.nombre_campo_estudio = nombre_campo_estudio;
    }
  
  
}

