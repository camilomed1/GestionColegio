package com.test.gestioncol.controller;

import com.test.gestioncol.model.Asignatura;
import com.test.gestioncol.services.AsignaturaService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/asignaturas")
@Tag(name = "Gestión de Asignaturas", description = "API REST para la gestión de asignaturas del colegio")
public class AsignaturaRestController {

    @Autowired
    private AsignaturaService asignaturaService;

    @GetMapping
    @Operation(
            summary = "Listar todas las asignaturas",
            description = "Retorna la lista completa de asignaturas. Accesible para RECTOR, DOCENTE y ESTUDIANTE."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Lista obtenida exitosamente"),
            @ApiResponse(responseCode = "403", description = "Acceso denegado")
    })
    @PreAuthorize("hasAnyRole('RECTOR', 'DOCENTE', 'ESTUDIANTE')")
    public ResponseEntity<List<Asignatura>> listarTodas() {
        return ResponseEntity.ok(asignaturaService.listarTodos());
    }

    @GetMapping("/{id}")
    @Operation(
            summary = "Obtener asignatura por ID",
            description = "Retorna los detalles de una asignatura específica por su ID."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Asignatura encontrada"),
            @ApiResponse(responseCode = "404", description = "Asignatura no encontrada"),
            @ApiResponse(responseCode = "403", description = "Acceso denegado")
    })
    @PreAuthorize("hasAnyRole('RECTOR', 'DOCENTE', 'ESTUDIANTE')")
    public ResponseEntity<Asignatura> obtenerPorId(@PathVariable Integer id) {
        Asignatura asignatura = asignaturaService.buscarPorId(id);
        return asignatura != null ? ResponseEntity.ok(asignatura) : ResponseEntity.notFound().build();
    }

    @PostMapping
    @Operation(
            summary = "Crear nueva asignatura",
            description = "Crea una nueva asignatura. Solo accesible para usuarios con rol RECTOR."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Asignatura creada exitosamente"),
            @ApiResponse(responseCode = "403", description = "Acceso denegado - Solo RECTOR")
    })
    @PreAuthorize("hasRole('RECTOR')")
    public ResponseEntity<Asignatura> crear(@RequestBody Asignatura asignatura) {
        return ResponseEntity.ok(asignaturaService.guardar(asignatura));
    }

    @PutMapping("/{id}")
    @Operation(
            summary = "Actualizar asignatura",
            description = "Actualiza una asignatura existente. Solo accesible para usuarios con rol RECTOR."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Asignatura actualizada exitosamente"),
            @ApiResponse(responseCode = "404", description = "Asignatura no encontrada"),
            @ApiResponse(responseCode = "403", description = "Acceso denegado - Solo RECTOR")
    })
    @PreAuthorize("hasRole('RECTOR')")
    public ResponseEntity<Asignatura> actualizar(@PathVariable Integer id, @RequestBody Asignatura asignatura) {
        Asignatura existente = asignaturaService.buscarPorId(id);
        if (existente == null) {
            return ResponseEntity.notFound().build();
        }
        asignatura.setId(id);
        return ResponseEntity.ok(asignaturaService.guardar(asignatura));
    }

    @DeleteMapping("/{id}")
    @Operation(
            summary = "Eliminar asignatura",
            description = "Elimina una asignatura del sistema. Solo accesible para usuarios con rol RECTOR."
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Asignatura eliminada exitosamente"),
            @ApiResponse(responseCode = "404", description = "Asignatura no encontrada"),
            @ApiResponse(responseCode = "403", description = "Acceso denegado - Solo RECTOR")
    })
    @PreAuthorize("hasRole('RECTOR')")
    public ResponseEntity<Void> eliminar(@PathVariable Integer id) {
        Asignatura asignatura = asignaturaService.buscarPorId(id);
        if (asignatura != null) {
            asignaturaService.eliminar(asignatura);
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.notFound().build();
    }
}
