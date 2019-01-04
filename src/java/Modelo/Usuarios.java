package Modelo;

public class Usuarios
{
  private int codigo_usuario;
  private String apellido_usuario;
  private String nombre_usuario;
  private String pais;
  private String perfil;
  private String correo;
  private String clave;
  private String fecha;
  private String estado;
  
  public Usuarios(String apellido_usuario, String nombre_usuario, String pais, String perfil, String correo, String clave, String estado)
  {
    this.apellido_usuario = apellido_usuario;
    this.nombre_usuario = nombre_usuario;
    this.pais = pais;
    this.perfil = perfil;
    this.correo = correo;
    this.clave = clave;
    
    this.estado = estado;
  }
  
  public Usuarios(int codigo_usuario, String apellido_usuario, String nombre_usuario, String pais, String perfil, String correo, String clave, String fecha, String estado)
  {
    this.codigo_usuario = codigo_usuario;
    this.apellido_usuario = apellido_usuario;
    this.nombre_usuario = nombre_usuario;
    this.pais = pais;
    this.perfil = perfil;
    this.correo = correo;
    this.clave = clave;
    this.fecha = fecha;
    this.estado = estado;
  }
  
  public int getCodigo_usuario()
  {
    return this.codigo_usuario;
  }
  
  public void setCodigo_usuario(int codigo_usuario)
  {
    this.codigo_usuario = codigo_usuario;
  }
  
  public String getApellido_usuario()
  {
    return this.apellido_usuario;
  }
  
  public void setApellido_usuario(String apellido_usuario)
  {
    this.apellido_usuario = apellido_usuario;
  }
  
  public String getNombre_usuario()
  {
    return this.nombre_usuario;
  }
  
  public void setNombre_usuario(String nombre_usuario)
  {
    this.nombre_usuario = nombre_usuario;
  }
  
  public String getPais()
  {
    return this.pais;
  }
  
  public void setPais(String pais)
  {
    this.pais = pais;
  }
  
  public String getPerfil()
  {
    return this.perfil;
  }
  
  public void setPerfil(String perfil)
  {
    this.perfil = perfil;
  }
  
  public String getCorreo()
  {
    return this.correo;
  }
  
  public void setCorreo(String correo)
  {
    this.correo = correo;
  }
  
  public String getClave()
  {
    return this.clave;
  }
  
  public void setClave(String clave)
  {
    this.clave = clave;
  }
  
  public String getFecha()
  {
    return this.fecha;
  }
  
  public void setFecha(String fecha)
  {
    this.fecha = fecha;
  }
  
  public String getEstado()
  {
    return this.estado;
  }
  
  public void setEstado(String estado)
  {
    this.estado = estado;
  }
}
