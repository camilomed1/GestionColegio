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
    <title>Lista de Asignaturas</title>
</head>
<body>
<h2>📚 Lista de Asignaturas</h2>

<p>Rol: <strong>${rol}</strong> | <a href="${pageContext.request.contextPath}/logout">Cerrar Sesión</a></p>

<hr/>


<c:if test="${rol == 'RECTOR'}">
    <a href="${pageContext.request.contextPath}/asignatura/nueva">➕ Nueva Asignatura</a>
    <br/><br/>
</c:if>


<c:if test="${empty asignaturas}">
    <p>No hay asignaturas registradas.</p>
</c:if>


<c:if test="${not empty asignaturas}">
    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Salón</th>
            <th>Horario</th>
            <th>Docente</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${asignaturas}" var="asignatura">
            <tr>
                <td>${asignatura.id}</td>
                <td><strong>${asignatura.nombre}</strong></td>
                <td>${asignatura.descripcion}</td>
                <td>${asignatura.salon}</td>
                <td>${asignatura.horaInicio} - ${asignatura.horaFin}</td>
                <td>${asignatura.docente.nombreDocente}</td>
                <td>
                    <!-- Ver (TODOS) -->
                    <a href="${pageContext.request.contextPath}/asignatura/ver/${asignatura.id}">Ver</a>

                    <!-- Editar/Eliminar (SOLO RECTOR) -->
                    <c:if test="${rol == 'RECTOR'}">
                        | <a href="${pageContext.request.contextPath}/asignatura/editar/${asignatura.id}">Editar</a>
                        | <a href="${pageContext.request.contextPath}/asignatura/eliminar/${asignatura.id}"
                             onclick="return confirm('¿Eliminar ${asignatura.nombre}?')">Eliminar</a>
                    </c:if>

                    <!-- Actualizar horario (RECTOR y DOCENTE) -->
                    <c:if test="${rol == 'RECTOR' || rol == 'DOCENTE'}">
                        | <a href="${pageContext.request.contextPath}/asignatura/actualizar-horario/${asignatura.id}">Horario</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
