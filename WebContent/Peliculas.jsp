<%@page import="java.util.*" %>
<%@page import="entities.Persona" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>---PELICULAS---</title>
        <link href="style/css/styles.css" rel="stylesheet" />
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		 <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="style/css/navbar.css" rel="stylesheet">
    <%
		Integer isEmpleado = 0;
		Persona per = (Persona)request.getSession().getAttribute("usuario");
		
		if ( !(per==null)){
			isEmpleado = per.getHabilitado();
		} else {isEmpleado = 0;}
		
		%>
</head>
<body>

<div id="page-top" class="fondo">
	<header>
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
           
	</header>
		
		<div class="filtroNombre">
		<h1>Nombre</h1>
		<form action="MostrarPeliculas" method="get">
		<input name="nombre" type=text>
		<input type="submit" value="buscar">
		</form>
		</div>
		
		<div class="filtroGenero">
		<h1>Buscar por genero</h1>	
		
		<form action="MostrarPeliculas" method="get">
			<label>Elegir genero:
			<input list="generos" name="genero" /></label>
			<datalist id="generos">
			<option value="romance">Romance</option>
			<option value="terror">Terror</option>
			<option value="suspenso">Suspenso</option>
			<option value="todas">Ver todas</option>
			</datalist>
			<input type="submit" value="buscar">
		</form>
		</div>	
		
		<div class="filtroEdad">
		<h1>Buscar por edad</h1>	
		<form action="MostrarPeliculas" method="get">
			<label>Elegir edad:
			<input list="edades" name="edad" /></label>
			<datalist id="edades">
			<option value="+3">+3</option>
			<option value="+7">+7</option>
			<option value="+16">+16</option>
			<option value="Apta para todo publico">Apta para todo publico</option>
			</datalist>
			<input type="submit" value="buscar">
		</form>
		</div>		
		</div>		
		<div style="clear:both"></div>
		<%if (!(request.getAttribute("noEncontrada")==(null))){  %>
		<script type="text/javascript">
		Swal.fire({
		  imageUrl: 'https://images.emojiterra.com/twitter/v13.1/512px/2639.png',
		  imageHeight: 100,
		  text: 'No hay peliculas que coincidan con la busqueda',
		  timer: 2000,
		  timerProgressBar: true,
		  allowOutsideClick: false,
		  didOpen: () => {
			    Swal.showLoading()
			    const b = Swal.getHtmlContainer().querySelector('b')
			    timerInterval = setInterval(() => {
			      b.textContent = Swal.getTimerLeft()
			    }, 100)
			  },
		})
		setTimeout( function() { window.location.href = "Peliculas.jsp"; }, 2000 );
		</script>
    <%}%>
</body>
</html>