<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="entities.Pelicula" %>
<%@page import="entities.Sala" %>
<%@page import="java.util.LinkedList"%> 
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/Estilo.jsp" %>
	<title>NUEVA FUNCION</title>
	<%	 
	LinkedList<Pelicula> lp=(LinkedList<Pelicula>)request.getAttribute("peliculas");
	LinkedList<Sala> ls=(LinkedList<Sala>)request.getAttribute("salas");
	Pelicula pelActual = (Pelicula)request.getAttribute("pelActual");
	%>
</head>
<body>
<div class="fondo">
	<jsp:include page="/BarraMenu.jsp" />
	<br>
    <br>
    <% if (request.getAttribute("cargada")!=null) {%>
        <div class="alert alert-success">¡Funcion creada con exito!</div>
    <% }%>
    <%if ( request.getAttribute("encontrada")==null ) { %>
    	<div class="alert alert-warning">No se encontro la sala seleccionada</div>
    <% } %>
    <h1>Ingrese los datos de la nueva funcion</h1>
    <form action="NuevaFuncion" method="post">
    	<input type="hidden" name="codigoPel" value="<%= pelActual.getCodigo() %>"/>
		<div>
        	<label>Salas</label>
        	<select name="elegirsala" required="required">
        		<% for (Sala sal: ls){ %>
            		<option value="<%= sal.getNumero() %>"><%= sal.getNumero() %></option>
            	<% } %>
        	</select>
    	</div>
    	<br>
    	<label for="inputFecha" >Fecha y Hora de la Funcion (yyyy-MM-dd HH:mm)</label>
    	<% if (request.getAttribute("errorFormatoFecha")!=null) {%>
        	<div class="alert alert-danger">Formato de fecha invalido</div>
        <%}%>
    	<input id="inputFecha" name="fechahora" class="form-control" placeholder="fechahora" required type="text">
    	<br>
    	<input type="hidden" name="bandera" value="agregar">
    	<button class="btn btn-lg btn-primary btn-block" type="submit" id="botonAgregar" >AGREGAR FUNCION</button>
    </form>
</div>
</body>
</html>