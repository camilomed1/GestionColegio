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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sistema Colegio</title>
</head>
<body>
<h2>Iniciar Sesión - Sistema de Gestión Escolar</h2>

<c:if test="${error != null || param.error != null}">
    <p style="color:red;">❌ Usuario o contraseña incorrectos</p>
</c:if>

<c:if test="${logout != null || param.logout != null}">
    <p style="color:green;">✅ Has cerrado sesión correctamente</p>
</c:if>

<form action="${pageContext.request.contextPath}/perform-login" method="post">
    <div>
        <label for="username">Email o Usuario:</label>
        <input type="text" id="username" name="username" placeholder="Ingresa tu email" required />
    </div>
    <br/>
    <div>
        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" placeholder="Ingresa tu contraseña" required />
    </div>
    <br/>
    <button type="submit">Ingresar</button>
</form>
</body>
</html>

