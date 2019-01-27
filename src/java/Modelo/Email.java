/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author OCTAVIOH
 */
public class Email {
    
    
 public boolean enviarCorreo(String para){
     String de="octavioherreraing@gmail.com";
     String clave="octavio2019";
     String asunto="SodiConsultores";
     String mensaje="Su curriculum ha sido ingresado a nuestra base de datos ";
     
     boolean enviado=false;
     try {
         
     String host="smtp.gmail.com";
     Properties prop=System.getProperties();
     prop.put("mail.smtp.starttls.enable","true");
     prop.put("mail.smtp.host", host);
     prop.put("mail.smtp.user", de);
     prop.put("mail.smtp.password", clave);
     prop.put("mail.smtp.port", 587);
     prop.put("mail.smtp.auth", "true");
     
     Session sesion = Session.getDefaultInstance(prop, null);
     
     MimeMessage message = new MimeMessage(sesion);
     
     message.setFrom(new InternetAddress(de));
     
     message.setRecipient(Message.RecipientType.TO, new InternetAddress(para));
     message.setSubject(asunto);
     message.setText(mensaje);
     
     Transport transport = sesion.getTransport("smtp");
     transport.connect(host,de,clave);
     transport.sendMessage(message, message.getAllRecipients());
     transport.close();
     enviado= true;
     } catch (Exception e) {
     e.printStackTrace();
     }
     return enviado;
 }   
    
}
