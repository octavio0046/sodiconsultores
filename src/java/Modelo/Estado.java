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
public class Estado {
   
    
private int id_cliente;
private String nombre_estado;
private String staus_actual;
private String fecha_colocacion;
private String entrevista;
private String prueba_psico;


//metodo para obteener todos los campos de la tabla estados y para actualizarlos en el servlet Estados

    public Estado(int id_cliente, String nombre_estado, String staus_actual, String fecha_colocacion, String entrevista, String prueba_psico) {
        this.id_cliente = id_cliente;
        this.nombre_estado = nombre_estado;
        this.staus_actual = staus_actual;
        this.fecha_colocacion = fecha_colocacion;
        this.entrevista = entrevista;
        this.prueba_psico = prueba_psico;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNombre_estado() {
        return nombre_estado;
    }

    public void setNombre_estado(String nombre_estado) {
        this.nombre_estado = nombre_estado;
    }

    public String getStaus_actual() {
        return staus_actual;
    }

    public void setStaus_actual(String staus_actual) {
        this.staus_actual = staus_actual;
    }

    public String getFecha_colocacion() {
        return fecha_colocacion;
    }

    public void setFecha_colocacion(String fecha_colocacion) {
        this.fecha_colocacion = fecha_colocacion;
    }

    public String getEntrevista() {
        return entrevista;
    }

    public void setEntrevista(String entrevista) {
        this.entrevista = entrevista;
    }

    public String getPrueba_psico() {
        return prueba_psico;
    }

    public void setPrueba_psico(String prueba_psico) {
        this.prueba_psico = prueba_psico;
    }
  
    
}
