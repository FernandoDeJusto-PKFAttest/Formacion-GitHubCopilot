// =============================================================
// EJERCICIO 6 — TypeScript: Interfaces, Genéricos y Tipos
// =============================================================
//
// 🎯 OBJETIVO: Ver cómo Copilot aprovecha el sistema de tipos
//    de TypeScript para generar código más seguro y preciso.
//    Cuanto más detalladas son las interfaces, mejores son
//    las sugerencias de Copilot.
//
// 📋 INSTRUCCIONES:
//    1. Define primero las interfaces (Copilot te ayudará)
//    2. Luego implementa las funciones — Copilot ya conocerá
//       los tipos y generará código más preciso
//    3. Usa /explain para entender los tipos genéricos
//    4. Usa /tests para generar tests con Vitest
// =============================================================


// -------------------------------------------------------------
// EJERCICIO 6.1 — Define las interfaces y deja que Copilot ayude
// -------------------------------------------------------------
//
// 👇 Coloca el cursor después del comentario y pulsa ENTER.
//    Copilot completará las interfaces restantes.
//
// Interfaces TypeScript para un sistema de gestión de auditorías.
// Incluye: Auditoria, LineaAuditoria, Cliente, Auditor, Hallazgo,
// InformeAuditoria. Cada interface debe tener los campos relevantes
// con tipos correctos. Los estados deben ser string literals o enums.

interface Cliente {
    id: string;
    nombre: string;
    cif: string;
    sector: "banca" | "seguros" | "industria" | "servicios" | "publico";
    fechaAlta: Date;
}

// 👇 Copilot completará las interfaces que faltan aquí...


// -------------------------------------------------------------
// EJERCICIO 6.2 — Funciones genéricas
// -------------------------------------------------------------
//
// 👇 Completa estas funciones. Copilot usará los tipos
//    que has definido arriba para hacer sugerencias precisas.

// Función genérica que pagina cualquier array de elementos.
// Recibe el array, la página actual (desde 1) y el tamaño de página.
// Devuelve los elementos de esa página y metadatos de paginación.


// Función que filtra auditorías por múltiples criterios opcionales:
// estado, auditor responsable, cliente, rango de fechas.
// Todos los criterios son opcionales — si no se pasan, no filtra por ese campo.


// -------------------------------------------------------------
// EJERCICIO 6.3 — Tipos de utilidad de TypeScript
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona la interface Auditoria que has creado y escribe:
//    "Usando tipos de utilidad de TypeScript (Partial, Pick, Omit,
//    Required), crea:
//    1. Un tipo AuditoriaCreacion (campos necesarios para crear una nueva)
//    2. Un tipo AuditoriaResumen (solo campos para mostrar en listado)
//    3. Un tipo AuditoriaActualizacion (todos los campos opcionales menos id)
//    Explica cuándo usar cada uno."

// 👇 Pega los tipos aquí:


// -------------------------------------------------------------
// EJERCICIO 6.4 — Manejo de errores con tipos
// -------------------------------------------------------------
//
// 👇 Pulsa ENTER después del comentario.
//
// Tipo Result<T> genérico al estilo Rust para manejar errores
// sin excepciones en TypeScript. Debe poder representar tanto
// un resultado exitoso con datos de tipo T como un error con
// mensaje y código de error. Incluye funciones helper: isOk(), isError(),
// unwrap() que lanza si hay error, y map() para transformar el resultado.


// -------------------------------------------------------------
// EJERCICIO 6.5 — Genera los tests
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona la función de paginación del ejercicio 6.2 y escribe:
//    "/tests Genera tests con Vitest para la función de paginación.
//    Cubre: primera página, última página, página fuera de rango,
//    array vacío, tamaño de página mayor que el array."

// 👇 Copilot generará los tests aquí


// -------------------------------------------------------------
// EJERCICIO 6.6 — BONUS: Async/Await y manejo de APIs
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    "Crea una función TypeScript fetchAuditorias que llame a
//    GET /api/auditorias con parámetros de filtro opcionales,
//    maneje errores de red y de la API (4xx, 5xx),
//    tenga tipado completo en los parámetros y el retorno,
//    y use el tipo Result<T> del ejercicio anterior."

// 👇 Pega aquí el código generado
