<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.time.*"%>
<%@page import="java.time.format.*"%>
<%@page import="entities.Sala"%>
<%@page import="logic.LogicSala"%>
<%@page import="entities.Persona"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>---EDIT SALAS---</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" ></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="style/css/styles.css" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" >
		<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">

<%  
	
	String bandera1 = "";
	
	 if ( !(request.getAttribute("bandera1")==(null)) ){
		 bandera1 = request.getAttribute("bandera1").toString();
	}
	 
	 String bandera3 = "";
		
	 if ( !(request.getAttribute("bandera3")==(null)) ){
		 bandera3 = request.getAttribute("bandera3").toString();
	} 
	 
	 
		Sala sala = (Sala)request.getAttribute("sala");
	
		Integer isEmpleado = 0;
		Persona per = (Persona)request.getSession().getAttribute("usuario");
			
			if ( !(per==null)){
				isEmpleado = per.getHabilitado();
			} else {isEmpleado = 0;}	 
	 
%>
</head>
<body>
<div class="fondo">
<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
            <div class="container px-5">
                <a class="navbar-brand" href="index.jsp">NUESTRO CINE</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">	
                    <%if ( isEmpleado==1){ %>
                    	<li class="nav-item"><a class="nav-link" href="Empleados.jsp">EMPLEADOS</a></li> 
                    <%} else {%>
                    	<%} %>	 
                    	<li class="nav-item"><a class="nav-link" href="Peliculas.jsp">Cartelera</a></li>
                        
                        <% if ( request.getSession().getAttribute("usuario")==null ) {%>
                        
                        <li class="nav-item"><a class="nav-link" href="SignUp.html">Registrarse</a></li>
                        <li class="nav-item"><a class="nav-link" href="SignIn.html" id="signin">Iniciar sesion</a></li>
                        <%}else {%> 
                        <li class="nav-item"><a class="nav-link">HOLA, <%=per.getNombre().toUpperCase()%>!</a></li>
                        <li class="nav-item"><a class="nav-link" id="signout" href="SignOut" >Cerrar sesion</a></li>
                        
                   		<%} %>	
                    </ul>
                     
                </div>
            </div>
        </nav>
	
	
	<%	if ( request.getAttribute("bandera1")==(null) ){ %>
	<br>
	<br>
	<h2>Ingrese numero de la sala</h2>
	<form class="addPelicula" action="BuscarSala" method="post" >
    <input id="inputNumero" name="numero" class="form-control" placeholder="numero de la sala" required type="text">
    <br>
    <button class="btn btn-lg btn-primary btn-block" >BUSCAR</button>
    </form>
	
	<%} if (!(request.getAttribute("bandera1")==(null)) && bandera1.equals("encontrada")){  %>
		<br>
		<br>
			
			<div class="pelicula">
							<div class="infopelicula">
							<p class="infopelicula"> <b>Numero Sala :</b> <%= sala.getNumero() %></p>
                            <p class="infopelicula"> <b>Cupo :</b> <%= sala.getCupo() %></p>
                            <form action="ActualizarSala" method="post">
                            <input type="hidden" name="numerosala" value="<%= sala.getNumero() %>">
                            <button class="buttonClass">Editar</button>
                            </form>
                            </div>
              </div>
              
	<%} %>
	<br>
	<a class="boton_volver" href="Empleados.jsp">VOLVER </a> 
<br>	

</div>

</body>
</html>