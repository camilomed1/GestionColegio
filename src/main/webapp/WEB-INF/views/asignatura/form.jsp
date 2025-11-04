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
    <title>${asignatura.id == null ? 'Nueva' : 'Editar'} Asignatura</title>
</head>
<body>
<h2>📝 ${asignatura.id == null ? 'Nueva' : 'Editar'} Asignatura</h2>

<form action="${pageContext.request.contextPath}/asignatura" method="post">
    <input type="hidden" name="id" value="${asignatura.id}" />

    <label>Nombre de la Asignatura: *</label><br/>
    <input type="text" name="nombre" value="${asignatura.nombre}" maxlength="30" required /><br/>
    <small>Máximo 30 caracteres</small><br/><br/>

    <label>Descripción:</label><br/>
    <textarea name="descripcion" rows="3" maxlength="100">${asignatura.descripcion}</textarea><br/>
    <small>Máximo 100 caracteres</small><br/><br/>

    <label>Salón: *</label><br/>
    <input type="number" name="salon" value="${asignatura.salon}" required /><br/><br/>

    <label>Hora de Inicio: *</label><br/>
    <input type="time" name="horaInicio" value="${asignatura.horaInicio}" required /><br/><br/>

    <label>Hora de Finalización: *</label><br/>
    <input type="time" name="horaFin" value="${asignatura.horaFin}" required /><br/><br/>

    <label>Docente Encargado: *</label><br/>
    <select name="docente.id" required>
        <option value="">-- Seleccione un docente --</option>
        <c:forEach items="${docentes}" var="doc">
            <option value="${doc.id}" ${asignatura.docente.id == doc.id ? 'selected' : ''}>
                    ${doc.nombreDocente}
            </option>
        </c:forEach>
    </select><br/><br/>

    <button type="submit">Guardar</button>
    <a href="${pageContext.request.contextPath}/asignatura">Cancelar</a>
</form>
</body>
</html>
