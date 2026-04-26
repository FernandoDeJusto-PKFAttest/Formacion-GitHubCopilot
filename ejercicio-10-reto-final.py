# =============================================================
# EJERCICIO 10 — Reto Final: Agent Mode y copilot-instructions.md
# =============================================================
#
# 🎯 OBJETIVO: Practicar el flujo de trabajo completo con Copilot:
#    instrucciones personalizadas + Agent Mode + revisión de código.
#    Este ejercicio integra todo lo aprendido en la formación.
#
# 📋 INSTRUCCIONES GENERALES:
#    Lee cada reto, usa el chat de Copilot con los prompts sugeridos
#    y documenta aquí el resultado. El objetivo no es el código
#    perfecto, sino practicar el proceso de iterar con Copilot.
#
# ⏱️  Tiempo estimado: 30-45 minutos
# 👥  Se puede hacer en parejas — uno escribe el prompt,
#     el otro revisa el código generado
# =============================================================


# =============================================================
# RETO 10.1 — Configura tu copilot-instructions.md
# =============================================================
#
# ANTES de hacer los siguientes retos, crea o actualiza el archivo
# .github/copilot-instructions.md de este repositorio con
# las instrucciones de tu equipo.
#
# 📝 INSTRUCCIÓN:
#    Abre el chat y escribe:
#    "Genera un archivo copilot-instructions.md para un equipo
#    de desarrollo de PKF Attest. Tenemos proyectos en:
#    - C# con ASP.NET Core 8 y Entity Framework
#    - TypeScript con React
#    - AL para Business Central
#    - SQL Server
#    Los comentarios siempre en español.
#    Usamos xUnit para tests de backend y Vitest para frontend.
#    Aplicamos siempre el patrón Repository y SOLID.
#    Las variables y métodos en inglés, los comentarios en español."
#
# Crea el archivo y cierra este. Luego vuelve para los retos.


# =============================================================
# RETO 10.2 — Genera una mini-aplicación con Agent Mode
# =============================================================
#
# 🤖 AGENT MODE: Activa el modo Agent en el chat de Copilot
#    (icono de agente o selector de modo)
#
# 💬 PROMPT PARA AGENT MODE:
#    "Crea la estructura de un microservicio REST en C# para
#    gestionar Proyectos de Auditoría. Necesito:
#    1. Carpetas: Controllers/, Services/, Repositories/, Models/, DTOs/
#    2. Un modelo Project con: Id, Name, ClientId, StartDate, EndDate,
#       Status (enum), BudgetHours, ConsumedHours
#    3. Un servicio IProjectService con métodos CRUD
#    4. Un controlador ProjectsController con endpoints REST completos
#    5. Un archivo de tests ProjectServiceTests.cs con xUnit
#    Sigue las convenciones del copilot-instructions.md"
#
# ⚠️  IMPORTANTE antes de aceptar los cambios:
#    - Revisa cada archivo propuesto antes de aplicarlo
#    - Verifica que sigue las convenciones del instructions.md
#    - Comprueba que los tests tienen sentido
#    - Asegúrate de que Git está limpio antes de activar Agent Mode


# =============================================================
# RETO 10.3 — Iteración sobre el código generado
# =============================================================
#
# Una vez generado el código del Reto 10.2, practica la iteración:
#
# 💬 PROMPTS DE ITERACIÓN (úsalos uno a uno):
#
# ITERACIÓN 1 — Añadir validación:
# "El endpoint POST /api/projects no valida que la fecha de inicio
#  sea anterior a la fecha de fin, ni que el presupuesto de horas
#  sea positivo. Añade las validaciones necesarias con DataAnnotations
#  o FluentValidation y actualiza los tests."
#
# ITERACIÓN 2 — Añadir paginación:
# "El endpoint GET /api/projects devuelve todos los proyectos.
#  Añade paginación con parámetros page y pageSize,
#  y devuelve también el total de registros en la respuesta."
#
# ITERACIÓN 3 — Revisar seguridad:
# "@workspace /fix Revisa todos los controladores generados
#  en busca de problemas de seguridad: falta de autorización,
#  exposición de datos sensibles, falta de validación de entrada."
#
# 📝 Documenta aquí qué cambios propuso Copilot en cada iteración:
#
# Iteración 1 — Resultado:
# Iteración 2 — Resultado:
# Iteración 3 — Resultado:


# =============================================================
# RETO 10.4 — Debugging con Copilot
# =============================================================
#
# El siguiente pseudocódigo tiene 3 bugs intencionados.
# Tu misión: encontrarlos TÚ primero, luego compara con lo
# que detecta Copilot.
#
# 💬 INSTRUCCIÓN PARA EL CHAT:
#    Selecciona todo el bloque y escribe:
#    "/fix Encuentra y corrige todos los bugs de este código.
#    Explica qué estaba mal en cada caso."

"""
PSEUDOCÓDIGO CON BUGS (para el ejercicio):

class ProyectoService:

    def calcular_rentabilidad(proyecto):
        # Bug 1: División por cero no controlada
        margen = (proyecto.importe - proyecto.coste) / proyecto.importe * 100
        return margen

    def obtener_proyectos_activos(todos_proyectos):
        # Bug 2: Comparación incorrecta de fechas
        hoy = "2024-01-01"  # Fecha hardcodeada en lugar de datetime.now()
        activos = [p for p in todos_proyectos if p.fecha_fin > hoy]
        return activos

    def asignar_empleado(proyecto, empleado):
        # Bug 3: Mutación del objeto original sin copia
        proyecto.empleados.append(empleado)
        proyecto.horas_asignadas += empleado.horas_disponibles
        return proyecto  # El objeto original ha sido modificado
"""

# 📝 Bugs que encontré yo antes de usar Copilot:
# Bug 1:
# Bug 2:
# Bug 3:
#
# 📝 Bugs que encontró Copilot:
# (rellena después de usar /fix)


# =============================================================
# RETO 10.5 — Reflexión final
# =============================================================
#
# Después de completar los ejercicios, reflexiona sobre estas
# preguntas. Puedes incluso preguntárselas al propio Copilot:
#
# 💬 "Basándote en los ejercicios que hemos hecho hoy,
#     ¿en qué tareas de desarrollo te parece que Copilot
#     aporta más valor para un equipo de auditoría y consultoría?"
#
# 📝 Mi reflexión:
# (escribe aquí tu respuesta)
#
#
# 💬 "¿Qué casos de uso de mi trabajo diario me gustaría probar
#     con Copilot durante las próximas semanas?"
#
# 📝 Casos de uso que quiero explorar:
# 1.
# 2.
# 3.


# =============================================================
# 🎉 ¡Enhorabuena! Has completado todos los ejercicios.
#
# Recuerda:
# ✅ Siempre revisa el código generado antes de aceptarlo
# ✅ Usa Copilot para aprender, no solo para generar
# ✅ Actualiza el copilot-instructions.md cuando cambien
#    las convenciones del equipo
# ✅ Comparte los prompts que funcionan bien con el resto del equipo
# =============================================================
