-- =============================================================
-- EJERCICIO 7 — SQL Server: Consultas y Optimización
-- =============================================================
--
-- 🎯 OBJETIVO: Usar Copilot para generar consultas SQL complejas,
--    optimizarlas y detectar problemas de rendimiento.
--    SQL es uno de los puntos fuertes de Copilot.
--
-- 📋 INSTRUCCIONES:
--    1. Lee el comentario de cada ejercicio
--    2. Coloca el cursor donde indica 👇 y pulsa ENTER
--    3. Para consultas complejas, describe con precisión
--       las tablas, los joins y los filtros que necesitas
--    4. Usa /optimize para mejorar el rendimiento
--
-- 💡 TIP: Cuanto más describes el esquema de las tablas
--    en el comentario, mejor genera Copilot el SQL.
-- =============================================================


-- =============================================================
-- ESQUEMA DE BASE DE DATOS (contexto para Copilot)
-- Mantén este bloque visible — Copilot lo usará como referencia
-- =============================================================

/*
TABLAS DISPONIBLES:

Clientes (ClienteId, Nombre, CIF, Sector, FechaAlta, Activo)
Proyectos (ProyectoId, ClienteId, Nombre, FechaInicio, FechaFin,
           Estado, PresupuestoHoras, HorasConsumidas, ImporteTotal)
Empleados (EmpleadoId, Nombre, Apellidos, Email, Departamento, HoraCoste)
AsignacionesProyecto (ProyectoId, EmpleadoId, HorasAsignadas, Rol)
RegistrosHoras (RegistroId, ProyectoId, EmpleadoId, Fecha, Horas,
                Descripcion, Facturable)
Facturas (FacturaId, ClienteId, ProyectoId, FechaEmision,
          FechaVencimiento, Importe, Estado, FechaCobro)
*/


-- =============================================================
-- PARTE A — Genera las consultas desde cero
-- =============================================================

-- -----------------------------------------------------------
-- EJERCICIO 7.1 — Consulta simple con agregación
-- -----------------------------------------------------------
--
-- 👇 Pulsa ENTER después del comentario.
--
-- Consulta que muestra el resumen de proyectos por cliente:
-- nombre del cliente, número de proyectos activos, total de horas
-- consumidas, importe total facturado y porcentaje de proyectos
-- completados. Ordenado por importe total descendente.
-- Solo clientes con al menos un proyecto.



-- -----------------------------------------------------------
-- EJERCICIO 7.2 — Consulta con lógica de negocio compleja
-- -----------------------------------------------------------
--
-- 👇 Pulsa ENTER después del comentario.
--
-- Consulta para el informe de rentabilidad de proyectos.
-- Para cada proyecto muestra: nombre del proyecto, cliente,
-- horas presupuestadas vs consumidas, coste real de las horas
-- (horas * HoraCoste de cada empleado), importe facturado,
-- margen en euros y margen en porcentaje.
-- Clasifica como "Rentable", "En riesgo" o "Deficitario"
-- según el margen sea >20%, entre 0-20% o negativo.



-- -----------------------------------------------------------
-- EJERCICIO 7.3 — Detectar proyectos con problemas
-- -----------------------------------------------------------
--
-- 💬 INSTRUCCIÓN PARA EL CHAT:
--    Escribe en el chat:
--    "Genera una consulta SQL Server que identifique proyectos
--    'en riesgo' usando estas tablas. Un proyecto está en riesgo si:
--    - Ha consumido más del 80% de horas presupuestadas pero no está al 80% de su duración
--    - Tiene facturas vencidas sin cobrar hace más de 30 días
--    - No tiene registros de horas en los últimos 15 días y sigue activo
--    Devuelve el proyecto, el cliente, el motivo del riesgo y un nivel de alerta."

-- 👇 Pega aquí la consulta generada:



-- =============================================================
-- PARTE B — Optimización de consultas lentas
-- =============================================================

-- -----------------------------------------------------------
-- EJERCICIO 7.4 — Optimiza esta consulta lenta
-- -----------------------------------------------------------
--
-- 💬 INSTRUCCIÓN PARA EL CHAT:
--    Selecciona la consulta de abajo y escribe:
--    "/optimize Esta consulta tarda más de 30 segundos en producción
--    con 500.000 registros de horas. ¿Cómo la optimizas?
--    Sugiere también qué índices crear."

SELECT
    e.Nombre + ' ' + e.Apellidos AS Empleado,
    e.Departamento,
    (SELECT COUNT(*) FROM Proyectos p
     JOIN AsignacionesProyecto ap ON p.ProyectoId = ap.ProyectoId
     WHERE ap.EmpleadoId = e.EmpleadoId) AS TotalProyectos,
    (SELECT SUM(rh.Horas) FROM RegistrosHoras rh
     WHERE rh.EmpleadoId = e.EmpleadoId
     AND rh.Fecha >= DATEADD(MONTH, -1, GETDATE())) AS HorasUltimoMes,
    (SELECT SUM(rh.Horas * e2.HoraCoste)
     FROM RegistrosHoras rh
     JOIN Empleados e2 ON rh.EmpleadoId = e2.EmpleadoId
     WHERE rh.EmpleadoId = e.EmpleadoId
     AND YEAR(rh.Fecha) = YEAR(GETDATE())) AS CosteAnual
FROM Empleados e
WHERE e.Departamento IN ('Auditoría', 'Consultoría')
ORDER BY CosteAnual DESC;


-- -----------------------------------------------------------
-- EJERCICIO 7.5 — Stored Procedure con manejo de errores
-- -----------------------------------------------------------
--
-- 👇 Pulsa ENTER después del comentario.
--
-- Stored Procedure SQL Server llamado sp_CerrarProyecto.
-- Recibe @ProyectoId. Debe:
-- 1. Verificar que el proyecto existe y está activo
-- 2. Verificar que no tiene facturas pendientes de cobro
-- 3. Calcular las horas finales y el coste real
-- 4. Actualizar el estado a "Cerrado" y registrar la fecha de cierre
-- 5. Usar transacción con TRY/CATCH y rollback si hay error
-- 6. Devolver 0 si fue exitoso, -1 si el proyecto no existe,
--    -2 si tiene facturas pendientes, -99 si hubo error inesperado



-- -----------------------------------------------------------
-- EJERCICIO 7.6 — Detectar vulnerabilidades SQL
-- -----------------------------------------------------------
--
-- 💬 INSTRUCCIÓN PARA EL CHAT:
--    Selecciona el procedimiento de abajo y escribe:
--    "Revisa este código SQL en busca de vulnerabilidades
--    de seguridad y corrígelas. Explica qué tipo de ataque
--    permite cada vulnerabilidad."

CREATE PROCEDURE sp_BuscarClienteVulnerable
    @Nombre NVARCHAR(100)
AS
BEGIN
    -- ⚠️  VULNERABLE — generado a propósito para el ejercicio
    DECLARE @SQL NVARCHAR(500)
    SET @SQL = 'SELECT * FROM Clientes WHERE Nombre LIKE ''%' + @Nombre + '%'''
    EXEC(@SQL)
END
