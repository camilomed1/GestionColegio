# Sistema de Gestión de Asignaturas - Colegio

Aplicación web desarrollada con Spring Boot para la gestión de asignaturas de un colegio con control de roles y permisos.

## 📋 Descripción

Sistema que permite gestionar asignaturas con tres roles de usuario:
- **RECTOR**: CRUD completo de asignaturas
- **DOCENTE**: Visualizar y actualizar horarios de sus asignaturas
- **ESTUDIANTE**: Solo visualizar asignaturas

## 🛠️ Tecnologías

- Java 17+
- Spring Boot 3.x
- Spring Security
- Spring Data JPA
- PostgreSQL
- JSP + JSTL
- Maven
- Swagger/OpenAPI
- Lombok
- Bootstrap

## 📦 Requisitos Previos

- JDK 17 o superior
- Maven 3.6+
- PostgreSQL 12+
- IDE Java

## ⚙️ Instalación y Configuración

### 1. Clonar el repositorio
```bash
git clone https://github.com/TU_USUARIO/TU_REPOSITORIO.git
cd TU_REPOSITORIO
```

### 2. Crear la base de datos
```bash
psql -U postgres
CREATE DATABASE col;
\q
```

### 3. Configurar application.properties

Edita `src/main/resources/application.properties` con tus credenciales:
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/col
spring.datasource.username=TU_USUARIO
spring.datasource.password=TU_CONTRASEÑA
```

### 4. Ejecutar scripts de base de datos (opcional)

Si prefieres crear las tablas manualmente:
```bash
psql -U postgres -d col -f database/schema.sql
psql -U postgres -d col -f database/data.sql
```

### 5. Compilar y ejecutar
```bash
mvn clean install
mvn spring-boot:run
```

La aplicación estará disponible en: `http://localhost:8080`

## 👥 Credenciales de Prueba

| Rol | Email | Contraseña |
|-----|-------|------------|
| Rector | rector1@colegio.com | 1234 |
| Docente | docente1@colegio.com | 1234 |
| Estudiante | estudiante1@colegio.com | 1234 |

## 📚 Documentación API

La documentación de la API REST está disponible en Swagger UI:
```
http://localhost:8080/swagger-ui.html
```

### Endpoints disponibles:

- `GET /api/asignaturas` - Listar todas las asignaturas
- `GET /api/asignaturas/{id}` - Obtener asignatura por ID
- `POST /api/asignaturas` - Crear asignatura (Solo RECTOR)
- `PUT /api/asignaturas/{id}` - Actualizar asignatura (Solo RECTOR)
- `DELETE /api/asignaturas/{id}` - Eliminar asignatura (Solo RECTOR)

## 🎯 Funcionalidades

### RECTOR
- ✅ Crear asignaturas
- ✅ Editar asignaturas
- ✅ Eliminar asignaturas
- ✅ Visualizar todas las asignaturas
- ✅ Actualizar horarios

### DOCENTE
- ✅ Visualizar asignaturas (solo las que tiene a cargo)
- ✅ Actualizar horarios de sus asignaturas

### ESTUDIANTE
- ✅ Visualizar todas las asignaturas (solo lectura)

## 📁 Estructura del Proyecto
```
src/
├── main/
│   ├── java/com/test/gestioncol/
│   │   ├── controller/      # Controladores (JSP y REST)
│   │   ├── model/           # Entidades JPA
│   │   ├── repository/      # Repositorios Spring Data
│   │   ├── service/         # Lógica de negocio
│   │   └── security/        # Configuración de seguridad
│   ├── resources/
│   │   ├── application.properties
│   │   └── import.sql       # Datos iniciales
│   └── webapp/WEB-INF/views/
│       ├── login.jsp
│       ├── acceso-denegado.jsp
│       └── asignatura/
│           ├── lista.jsp
│           ├── form.jsp
│           ├── form-horario.jsp
│           └── detalle.jsp
└── database/
    ├── schema.sql           # Script de creación de tablas
    └── data.sql             # Script de datos iniciales
```

## 🔒 Seguridad

- Autenticación basada en formulario con Spring Security
- Contraseñas encriptadas con BCrypt
- Control de acceso basado en roles (RBAC)

## 👨‍💻 Autor

Camilo Andres Medina Correa
- Código: 20241220193
- Email: u20241220193@usco.edu.co
- Universidad Surcolombiana

## 📅 Fecha de Desarrollo

Noviembre 2025 - Parcial 2 Programación Web

