// =============================================================
// EJERCICIO 4 — Expresiones Regulares (Regex)
// =============================================================
//
// 🎯 OBJETIVO: Usar Copilot para generar, explicar y depurar
//    expresiones regulares — uno de los casos de uso donde
//    Copilot resulta más útil porque las regex son difíciles
//    de escribir y de leer.
//
// 📋 INSTRUCCIONES:
//    1. Para GENERAR una regex: describe en un comentario
//       exactamente qué debe validar y deja que Copilot la escriba
//    2. Para EXPLICAR una regex existente: selecciónala en el chat
//       y escribe "/explain"
//    3. Para DEPURAR: pega la regex y los casos que fallan
//       y pide "/fix"
//
// 💡 TIP: Las regex son el ejemplo perfecto de por qué los
//    comentarios descriptivos mejoran las sugerencias de Copilot.
// =============================================================


// =============================================================
// PARTE A — Genera tú mismo las regex (ejercicio principal)
// =============================================================

// -------------------------------------------------------------
// EJERCICIO 4.1 — Validación de NIF/NIE español
// -------------------------------------------------------------
//
// 👇 Pulsa ENTER después de este comentario.
//    Copilot generará la regex y la función de validación.
//
// Regex que valida un NIF español (8 dígitos + letra) o
// NIE (X/Y/Z + 7 dígitos + letra). No distingue mayúsculas/minúsculas.
// Función que devuelve true si el documento es válido.


// -------------------------------------------------------------
// EJERCICIO 4.2 — Validación de IBAN español
// -------------------------------------------------------------
//
// 👇 Pulsa ENTER aquí para que Copilot genere la función.
//
// Regex y función para validar un IBAN español.
// Formato: ES seguido de 22 dígitos (total 24 caracteres).
// Debe aceptar el IBAN con o sin espacios (ES12 1234 1234 1234 1234 1234).


// -------------------------------------------------------------
// EJERCICIO 4.3 — Extracción de datos de texto
// -------------------------------------------------------------
//
// 👇 Completa esta función con Copilot.
//
// Función que recibe un texto libre y extrae todos los importes
// en euros que encuentre. Los importes pueden tener el formato:
// "1.234,56 €", "1234.56€", "€ 1,234.56" o "EUR 1234,56".
// Devuelve un array con todos los importes encontrados como números.


// =============================================================
// PARTE B — Explica estas regex existentes con /explain
// =============================================================

// -------------------------------------------------------------
// EJERCICIO 4.4 — ¿Sabes qué hace esta regex?
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona la línea de la regex y escribe en el chat:
//    "/explain ¿Qué valida exactamente esta expresión regular?
//    Explícame cada parte con ejemplos de lo que acepta y rechaza"

const regexMisteriosa1 = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;

// -------------------------------------------------------------
// EJERCICIO 4.5 — Otra regex para explicar
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona la regex y el texto de prueba y escribe:
//    "/explain ¿Qué hace esta regex? Dame 3 ejemplos
//    de strings que la cumplan y 3 que no"

const regexMisteriosa2 = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

const testPasswords = [
    "password",           // ¿Válido?
    "Password1",          // ¿Válido?
    "P@ssw0rd",          // ¿Válido?
    "abc",               // ¿Válido?
    "MiClave2024!",      // ¿Válido?
];


// =============================================================
// PARTE C — Depurar regex que no funcionan bien
// =============================================================

// -------------------------------------------------------------
// EJERCICIO 4.6 — Esta regex tiene un error, ¿lo detecta Copilot?
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona toda la función y escribe:
//    "/fix Esta función debería validar emails corporativos
//    de pkf-attest.com pero está fallando con algunos casos válidos.
//    Encuentra el error y corrígelo."

function validarEmailPKF(email) {
    // Intenta validar emails del dominio pkf-attest.com o pkf-attest.es
    // ❌ Esta regex tiene un error sutil
    const regex = /^[a-zA-Z0-9._%+-]+@pkf-attest\.(com|es)$/;

    const casosQueDeberianFuncionar = [
        "usuario@pkf-attest.com",       // ✅ debe ser válido
        "nombre.apellido@pkf-attest.es", // ✅ debe ser válido
        "user+tag@pkf-attest.com",      // ✅ debe ser válido
    ];

    const casosQueDeberianFallar = [
        "usuario@gmail.com",            // ❌ debe fallar
        "usuario@pkf_attest.com",       // ❌ debe fallar (guión bajo)
        "@pkf-attest.com",              // ❌ debe fallar
    ];

    return regex.test(email);
}
