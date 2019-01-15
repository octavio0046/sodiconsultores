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
public class Fichero {
    
    private int codigo_cliente;
    private String nombrepdf;
   private  InputStream archivopdf;
    private byte[] archivopdf2;

    //para actualizar

    public Fichero(int codigo_cliente, String nombrepdf, InputStream archivopdf) {
        this.codigo_cliente = codigo_cliente;
        this.nombrepdf = nombrepdf;
        this.archivopdf = archivopdf;
    }

    //para obtener

    public Fichero(int codigo_cliente, String nombrepdf, byte[] archivopdf2) {
        this.codigo_cliente = codigo_cliente;
        this.nombrepdf = nombrepdf;
        this.archivopdf2 = archivopdf2;
    }
    
    
     public Fichero() {
     
    }


    public int getCodigo_cliente() {
        return codigo_cliente;
    }

    public void setCodigo_cliente(int codigo_cliente) {
        this.codigo_cliente = codigo_cliente;
    }

    public String getNombrepdf() {
        return nombrepdf;
    }

    public void setNombrepdf(String nombrepdf) {
        this.nombrepdf = nombrepdf;
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
