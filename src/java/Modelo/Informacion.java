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
public class Informacion {
    
private int id_cliente;
private int numero;
private int duracion_promedio;



//constructor para la actualizacion del formulario info de la vista formFichaUsuarioCliente y para obtener (mostrar) los datos
// en la vista formFichaUsuario
    public Informacion(int id_cliente, int numero, int duracion_promedio) {
        this.id_cliente = id_cliente;
        this.numero = numero;
        this.duracion_promedio = duracion_promedio;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getDuracion_promedio() {
        return duracion_promedio;
    }

    public void setDuracion_promedio(int duracion_promedio) {
        this.duracion_promedio = duracion_promedio;
    }
    



    
}
