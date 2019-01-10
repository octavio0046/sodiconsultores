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
public class Enlace {

private int id_cliente;
private String nombre_enlace;
private String link;


//constructor para la  obtenecion de todos los campos de la tabla tb_info en la bd
//vista formFichaUsuarios en el formulario informacion
//constructor para la actualizar
//vista formFichaUsuarios en el formulario informacion

    public Enlace(int id_cliente, String nombre_enlace, String link) {
        this.id_cliente = id_cliente;
        this.nombre_enlace = nombre_enlace;
        this.link = link;
    }




    
    

    
    
    
    

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNombre_enlace() {
        return nombre_enlace;
    }

    public void setNombre_enlace(String nombre_enlace) {
        this.nombre_enlace = nombre_enlace;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

  
   




}
