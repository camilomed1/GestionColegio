<%--
  Created by IntelliJ IDEA.
  User: CAMILO1
  Date: 4/11/2025
  Time: 7:08 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Acceso Denegado</title>
</head>
<body>
<h2>⛔ Acceso Denegado</h2>
<p>No tienes permisos para acceder a esta página.</p>
<br/>
<a href="${pageContext.request.contextPath}/asignatura">← Volver al inicio</a>
<br/><br/>
<a href="${pageContext.request.contextPath}/logout">Cerrar Sesión</a>
</body>
</html>
