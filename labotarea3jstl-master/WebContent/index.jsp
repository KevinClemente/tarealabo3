<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- HAY QUE PONER UNA CABECERA PARA IMPORTAR LA LIBRERIA CORE DE JSTL --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!-- HAY QUE PONER UNA CABECERA PARA IMPORTAR LA LIBRERIA FMT DE JSTL -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 
<!-- HAY QUE PONER UNA CABECERA PARA IMPORTAR LA LIBRERIA XML DE JSTL -->
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tarea 3</title>
</head>
<body>

<!--USANDO ETIQUETAS CORE-->
	<h3>Usando etiquetas C:</h3>

	<!-- Usando la etiqueta c:out para imprimir un mensaje en pantalla -->
		<c:out value="Usando c:out para imprimir este mensaje"/><p>
	
	<!-- Usando la etiqueta c:out y c:foreach para imprimir un arreglo -->
		<c:forEach var = "contador" items="1,2,3,4,5">
	    	Conteo usando c:foreach <c:out value = "Contando: ${contador}"/><p>
		</c:forEach>
	
<!--USANDO ETIQUETAS FMT-->
 	 <h3>Usando etiquetas FMT:</h3>
      
     <!-- Declarando una variable --> 
    	 <c:set var = "prueba" value = "120000.2309" />
   	
   	<!-- Imprimiendo valor original de la variable -->
   		<c:out value="Variable prueba sin formatear: ${prueba}"/><p>

	<!-- Dandaole formato a la variable "prueba" -->
		<p>Variable prueba con formato: 
			<fmt:formatNumber type = "number" maxIntegerDigits = "3" value = "${prueba}" />
		</p>
		
	<!-- Usando etiqueta fmt:formatdate para imprimir fecha-->
	
		<!-- Declarando variable que contendra la fecha -->	
	      <c:set var = "fechaActual" value = "<%=new java.util.Date()%>" />
	      
	     <p>Fecha sin formatear:
	     	<c:out value="${fechaActual}"/><p>
	     </p>
	    	    
	    <!-- Imprimiendo fecha con formato DATE-->
		    <p>Fecha actual con formato: 
				<fmt:formatDate type="date" value="${fechaActual}"/>
	         </p>

<!--USANDO ETIQUETAS XML-->
	<h3>Usando etiquetas X:</h3>

     <!-- Declarando una variable que contendra una estructura XML -->
	     <c:set var = "estructuraLibros">
	         <books>
	            <book>
	               <name>La gran Muralla China</name>
	               <author>Un chino</author>
	               <price>10</price>
	            </book>
	            
	            <book>
	               <name>Fisica 3 facil para tontos</name>
	               <author>Alguien que desea ashudarnos a entender</author>
	               <price>Tu alma por pasar la materias</price>
	            </book>
	         </books>
	      </c:set>
	      
	  <!-- Parseando estructura HTML -->   
	      <x:parse xml = "${estructuraLibros}" var = "imprimirEstructura"/>
      
     <!-- Imprimiendo estructura con x:forEach -->
	     <table border="1">
            <tr>
	       		<td>Nombre del libro: </td>
	         	<td>Autor: </td>
	      		<td>Precio: </td> 
	        </tr>
		    <x:forEach select = "$imprimirEstructura/books/book" var="imprimirEstructura">
		        <tr>       
		      		<td><x:out select="name" /></td>
		         	<td><x:out select="author" /></td>
		      		<td><x:out select="price" /></td>                      
		        </tr>       
		   </x:forEach>
	  	</table>

</body>
</html>