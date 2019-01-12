<%-- 
    Document   : index
    Created on : 9/05/2018, 09:51:48 PM
    Author     : Octavio Herrera
--%>

<%
  response.setHeader("Pragma", "no-cache");
  response.addHeader("Cache-control", "must-revalidate");
  response.addHeader("Cache-control", "no-cache");
  response.addHeader("Cache-control", "no-store");
  response.setDateHeader("Expires", 0);

%>

<!DOCTYPE html>

<html>
    <div class="cabecera">
        
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="template1.jsp" %>
     </div>
        <div class="contenido">
            
<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="https://scontent.fgua3-1.fna.fbcdn.net/v/t1.0-9/50218052_1027260150812623_6873991416607932416_n.png?_nc_cat=110&_nc_ht=scontent.fgua3-1.fna&oh=eda91803b6c9998b99b768b0b3c0a5d6&oe=5C8B397B" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://scontent.fgua3-1.fna.fbcdn.net/v/t1.0-0/p200x200/44110724_976997462505559_8514165308699705344_n.png?_nc_cat=111&_nc_ht=scontent.fgua3-1.fna&oh=83d775a3d6d5dda137c05d0a41cafd31&oe=5CBF10C6" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://scontent.fgua3-2.fna.fbcdn.net/v/t1.0-9/35229045_873774136161226_346042134899458048_n.jpg?_nc_cat=104&_nc_ht=scontent.fgua3-2.fna&oh=55315ba44f07a63890eabf3fa3bad9f7&oe=5CBDFD84" alt="Third slide">
    </div>
  </div>
</div>
       
            
            
        </div>          
</html>
