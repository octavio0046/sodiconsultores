/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.InputStream;

/**
 *
 * @author OCTAVIOH
 */
public class Imagen {
    
    private int codigo_cliente;
    private  InputStream archivopdf;
    private byte[] archivopdf2;

    
    
     public Imagen() {

    }
    
    
    ///metodo para listar
    public Imagen(int codigo_cliente, byte[] archivopdf2) {
        this.codigo_cliente = codigo_cliente;
        this.archivopdf2 = archivopdf2;
    }
 
    
   //para actualizar

    public Imagen(int codigo_cliente, InputStream archivopdf) {
        this.codigo_cliente = codigo_cliente;
        this.archivopdf = archivopdf;
    }

    public int getCodigo_cliente() {
        return codigo_cliente;
    }

    public void setCodigo_cliente(int codigo_cliente) {
        this.codigo_cliente = codigo_cliente;
    }

    public InputStream getArchivopdf() {
        return archivopdf;
    }

    public void setArchivopdf(InputStream archivopdf) {
        this.archivopdf = archivopdf;
    }

    public byte[] getArchivopdf2() {
        return archivopdf2;
    }

    public void setArchivopdf2(byte[] archivopdf2) {
        this.archivopdf2 = archivopdf2;
    }
   
    
}
