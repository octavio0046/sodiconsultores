package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion
{
  public static Connection getConexion()
  {
    Connection cn = null;
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
     cn = DriverManager.getConnection("jdbc:mysql://localhost/RECLUTAMIENTOBD", "root", "ABc_123.");
     //cn = DriverManager.getConnection("jdbc:mysql://localhost/BD_SODI_CONSULTORES", "root", "OCTAVIO0046");
      System.out.print("Conexion Satisfactoria");
    }
    catch (Exception e)
    {
      System.out.print("Error de Conexion" + e);
    }
    return cn;
  }
  
  public static void main(String[] args)
  {
    getConexion();
  }
}
