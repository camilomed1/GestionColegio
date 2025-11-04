<%--
  Created by IntelliJ IDEA.
  User: CAMILO1
  Date: 4/11/2025
  Time: 7:11 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle de Asignatura</title>
</head>
<body>
<h2>📖 Detalle de Asignatura</h2>

<table border="1" cellpadding="10" cellspacing="0">
    <tr>
        <th>ID:</th>
        <td>${asignatura.id}</td>
    </tr>
    <tr>
        <th>Nombre:</th>
        <td><strong>${asignatura.nombre}</strong></td>
    </tr>
    <tr>
        <th>Descripción:</th>
        <td>${asignatura.descripcion}</td>
    </tr>
    <tr>
        <th>Salón:</th>
        <td>${asignatura.salon}</td>
    </tr>
    <tr>
        <th>Horario:</th>
        <td>${asignatura.horaInicio} - ${asignatura.horaFin}</td>
    </tr>
    <tr>
        <th>Docente:</th>
        <td>${asignatura.docente.nombreDocente}</td>
    </tr>
    <c:if test="${not empty asignatura.docente.especialidad}">
        <tr>
            <th>Especialidad:</th>
            <td>${asignatura.docente.especialidad}</td>
        </tr>
    </c:if>
</table>

<br/>

<a href="${pageContext.request.contextPath}/asignatura">← Volver</a>

<c:if test="${rol == 'RECTOR'}">
    | <a href="${pageContext.request.contextPath}/asignatura/editar/${asignatura.id}">Editar</a>
</c:if>

<c:if test="${rol == 'RECTOR' || rol == 'DOCENTE'}">
    | <a href="${pageContext.request.contextPath}/asignatura/actualizar-horario/${asignatura.id}">Actualizar Horario</a>
</c:if>
</body>
</html>
