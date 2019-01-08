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
public class Cliente {
   private int id_cliente;
   private int id_usu_clie;
   private String nombre1;
   private String nombre2;
   private String apellido1;
   private String apellido2;
   private String nacimiento;
   private int edad;
   private String pais;
   private String departamento;
   private String recidencia;
   private String direccion;
   private int tel1;
   private int tel2;
   private int recidencial;
   private String correo;
   private String fechaIngreso;
   private String fecha_final;
   private String nombre_usuario;
  //nuevo
   private int estado;

   

   //constructor para ingresar los datos del cliente en la tabla tb_clientes para la clase 
   //ClienteBD y para el sevlet Cliente

    public Cliente(int id_cliente, String nombre_usuario, int id_usu_clie, String nombre1, String nombre2, String apellido1, String apellido2, String nacimiento, int edad, String pais, String departamento, String recidencia, String direccion, int tel1, int tel2, int recidencial, String correo) {
        this.id_cliente = id_cliente;
        this.nombre_usuario = nombre_usuario;
        this.id_usu_clie = id_usu_clie;
        this.nombre1 = nombre1;
        this.nombre2 = nombre2;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.nacimiento = nacimiento;
        this.edad = edad;
        this.pais = pais;
        this.departamento = departamento;
        this.recidencia = recidencia;
        this.direccion = direccion;
        this.tel1 = tel1;
        this.tel2 = tel2;
        this.recidencial = recidencial;
        this.correo = correo;
    }

    //este construcor sera para la actualizacion se usara en el metodo actualizar en servletClientes

    public Cliente(int id_cliente, String nombre1, String nombre2, String apellido1, String apellido2, String nacimiento, int edad, String pais, String departamento, String recidencia, String direccion, int tel1, int tel2, int recidencial, String correo, String nombre_usuario, int estado) {
        this.id_cliente = id_cliente;
        this.nombre1 = nombre1;
        this.nombre2 = nombre2;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.nacimiento = nacimiento;
        this.edad = edad;
        this.pais = pais;
        this.departamento = departamento;
        this.recidencia = recidencia;
        this.direccion = direccion;
        this.tel1 = tel1;
        this.tel2 = tel2;
        this.recidencial = recidencial;
        this.correo = correo;
        this.nombre_usuario = nombre_usuario;
        this.estado = estado;
    }

    
    //construcor para obtner todos los campos de la tabla
    public Cliente(int id_cliente, int id_usu_clie, String nombre1, String nombre2, String apellido1, String apellido2, String nacimiento, int edad, String pais, String departamento, String recidencia, String direccion, int tel1, int tel2, int recidencial, String correo, String fechaIngreso, String fecha_final, String nombre_usuario, int estado) {
        this.id_cliente = id_cliente;
        this.id_usu_clie = id_usu_clie;
        this.nombre1 = nombre1;
        this.nombre2 = nombre2;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.nacimiento = nacimiento;
        this.edad = edad;
        this.pais = pais;
        this.departamento = departamento;
        this.recidencia = recidencia;
        this.direccion = direccion;
        this.tel1 = tel1;
        this.tel2 = tel2;
        this.recidencial = recidencial;
        this.correo = correo;
        this.fechaIngreso = fechaIngreso;
        this.fecha_final = fecha_final;
        this.nombre_usuario = nombre_usuario;
        this.estado = estado;
    }

  

    
    
    
    
    
    
    
    
    
    
    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

 
   
    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public int getId_usu_clie() {
        return id_usu_clie;
    }

    public void setId_usu_clie(int id_usu_clie) {
        this.id_usu_clie = id_usu_clie;
    }

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getRecidencia() {
        return recidencia;
    }

    public void setRecidencia(String recidencia) {
        this.recidencia = recidencia;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getTel1() {
        return tel1;
    }

    public void setTel1(int tel1) {
        this.tel1 = tel1;
    }

    public int getTel2() {
        return tel2;
    }

    public void setTel2(int tel2) {
        this.tel2 = tel2;
    }

    public int getRecidencial() {
        return recidencial;
    }

    public void setRecidencial(int recidencial) {
        this.recidencial = recidencial;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getFecha_final() {
        return fecha_final;
    }

    public void setFecha_final(String fecha_final) {
        this.fecha_final = fecha_final;
    }

  
   
   
   
   
   
   
}
