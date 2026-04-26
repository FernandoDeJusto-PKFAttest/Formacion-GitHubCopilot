// =============================================================
// EJERCICIO 1 — JavaScript: Funciones y Manipulación de Arrays
// =============================================================
//
// 🎯 OBJETIVO: Practicar cómo Copilot completa funciones a partir
//    de un comentario descriptivo y cómo sugiere métodos de array.
//
// 📋 INSTRUCCIONES:
//    1. Coloca el cursor al final de cada comentario de función
//    2. Pulsa ENTER y espera la sugerencia de Copilot (gris)
//    3. Si te gusta, acepta con TAB. Si no, prueba ALT+] para ver
//       la siguiente sugerencia
//    4. Usa Ctrl+Enter para ver hasta 10 alternativas a la vez
//
// ▶️  EMPIEZA AQUÍ — Déjate guiar por los comentarios
// =============================================================


// -------------------------------------------------------------
// EJERCICIO 1.1 — Deja que Copilot complete esta función
// -------------------------------------------------------------

// Función que recibe un array de números y devuelve
// la suma de todos los números pares del array


// -------------------------------------------------------------
// EJERCICIO 1.2 — Nombres descriptivos = mejores sugerencias
// Compara los dos ejemplos siguientes:
// -------------------------------------------------------------

// ❌ MAL: nombre vago — Copilot no sabe qué hacer
function proc(d) {
    // Borra el contenido y observa qué sugiere Copilot aquí...
}

// ✅ BIEN: nombre descriptivo — prueba a borrar el cuerpo
// y deja que Copilot lo regenere
function calcularDescuentoPorVolumen(cantidad, precioUnitario) {
    if (cantidad >= 100) return precioUnitario * 0.85;
    if (cantidad >= 50) return precioUnitario * 0.90;
    if (cantidad >= 10) return precioUnitario * 0.95;
    return precioUnitario;
}


// -------------------------------------------------------------
// EJERCICIO 1.3 — Pide a Copilot que genere el resto del array
// -------------------------------------------------------------

// Array de objetos representando empleados de una empresa de auditoría.
// Copilot completará más empleados siguiendo el mismo patrón.
const empleados = [
    { id: 1, nombre: "Ana García", departamento: "Auditoría", horasSemanales: 40 },
    { id: 2, nombre: "Carlos López", departamento: "Consultoría", horasSemanales: 35 },
    // 👇 Pulsa ENTER aquí y deja que Copilot añada más empleados


];


// -------------------------------------------------------------
// EJERCICIO 1.4 — Usa el CHAT para esto
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT DE COPILOT:
//    Selecciona el array 'empleados' de arriba y escribe en el chat:
//
//    "/explain ¿Qué métodos de array puedo usar para filtrar
//    los empleados del departamento de Auditoría y ordenarlos
//    por horas semanales de mayor a menor?"
//
//    Después pide: "Ahora escríbeme el código"

// 👇 Escribe aquí el código que te genere Copilot


// -------------------------------------------------------------
// EJERCICIO 1.5 — Genera los tests
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona la función calcularDescuentoPorVolumen y escribe:
//    "/tests Genera tests con Jest cubriendo todos los umbrales
//    de descuento, incluyendo casos límite (exactamente 10, 50 y 100)"

// 👇 Copilot generará los tests aquí
