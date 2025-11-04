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
    <title>Actualizar Horario</title>
</head>
<body>
<h2>🕒 Actualizar Horario</h2>

<h3>Asignatura: ${asignatura.nombre}</h3>
<p><strong>Salón:</strong> ${asignatura.salon}</p>
<p><strong>Docente:</strong> ${asignatura.docente.nombreDocente}</p>
<p><strong>Horario actual:</strong> ${asignatura.horaInicio} - ${asignatura.horaFin}</p>

<hr/>

<form action="${pageContext.request.contextPath}/asignatura/actualizar-horario" method="post">
    <input type="hidden" name="id" value="${asignatura.id}" />

    <label>Nueva Hora de Inicio: *</label><br/>
    <input type="time" name="horaInicio" value="${asignatura.horaInicio}" required /><br/><br/>

    <label>Nueva Hora de Finalización: *</label><br/>
    <input type="time" name="horaFin" value="${asignatura.horaFin}" required /><br/><br/>

    <button type="submit">Actualizar</button>
    <a href="${pageContext.request.contextPath}/asignatura">Cancelar</a>
</form>
</body>
</html>
