// =============================================================
// EJERCICIO 3 — AL: Microsoft Dynamics 365 Business Central
// =============================================================
//
// 🎯 OBJETIVO: Practicar cómo Copilot entiende el lenguaje AL
//    usado en Business Central para crear páginas, tablas y
//    codeunits propias de una empresa de auditoría/consultoría.
//
// 📋 INSTRUCCIONES:
//    1. Lee el comentario antes de cada bloque
//    2. Coloca el cursor donde indica 👇 y pulsa ENTER
//    3. Si Copilot no sugiere nada, escribe las primeras letras
//       de la estructura (ej: "field(") para activarlo
//    4. Usa el chat con /explain para entender cualquier parte
//
// 💡 TIP: AL es menos común que C# o JS, así que las sugerencias
//    pueden ser más genéricas. Prueba a ser más específico en
//    tus comentarios para obtener mejores resultados.
// =============================================================


// -------------------------------------------------------------
// EJERCICIO 3.1 — Tabla personalizada para gestión de proyectos
// -------------------------------------------------------------
//
// 👇 Coloca el cursor después de este comentario y pulsa ENTER.
//    Copilot generará la estructura de tabla completa.
//
// Tabla AL para gestionar Proyectos de Auditoría en Business Central.
// Campos: No. (código), Descripción, Cliente No., Fecha Inicio, Fecha Fin,
// Estado (enum: Abierto, En Curso, Cerrado), Responsable, Importe Presupuestado.
// Clave primaria: No.


// -------------------------------------------------------------
// EJERCICIO 3.2 — Página de lista para la tabla anterior
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Escribe en el chat:
//    "Crea una página de tipo List en AL para la tabla
//    ProyectoAuditoria que muestre los campos principales
//    y tenga acciones para Abrir y Cerrar el proyecto"

// 👇 Pega aquí lo que genere Copilot


// -------------------------------------------------------------
// EJERCICIO 3.3 — Codeunit con lógica de negocio
// -------------------------------------------------------------
//
// 👇 Pulsa ENTER después del comentario para que Copilot
//    complete la codeunit.
//
// Codeunit AL para gestionar el ciclo de vida de proyectos de auditoría.
// Procedimientos: AbrirProyecto, CerrarProyecto, ValidarFechas, CalcularDuracion.
// Al cerrar un proyecto debe verificar que tiene fecha fin y cambiar el estado.
// Al abrir debe verificar que no está ya en curso o cerrado.


// -------------------------------------------------------------
// EJERCICIO 3.4 — Practicar con /explain
// -------------------------------------------------------------
//
// El siguiente código AL es real pero puede ser confuso
// si no estás familiarizado con el lenguaje.
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona todo el bloque de código de abajo y escribe:
//    "/explain ¿Qué hace este código y para qué sirve
//    cada sección en Business Central?"

codeunit 50100 "Gestión IVA Auditoría"
{
    procedure CalcularIVASoportado(var LineaCompra: Record "Purchase Line"): Decimal
    var
        ConfigIVA: Record "VAT Posting Setup";
        BaseImponible: Decimal;
        CuotaIVA: Decimal;
    begin
        if not ConfigIVA.Get(LineaCompra."VAT Bus. Posting Group",
                             LineaCompra."VAT Prod. Posting Group") then
            exit(0);

        BaseImponible := LineaCompra.Amount;

        case ConfigIVA."VAT Calculation Type" of
            ConfigIVA."VAT Calculation Type"::"Normal VAT":
                CuotaIVA := BaseImponible * ConfigIVA."VAT %" / 100;
            ConfigIVA."VAT Calculation Type"::"Reverse Charge VAT":
                CuotaIVA := 0;
            else
                CuotaIVA := BaseImponible * ConfigIVA."VAT %" / 100;
        end;

        exit(CuotaIVA);
    end;
}


// -------------------------------------------------------------
// EJERCICIO 3.5 — Generar un informe (Report)
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Escribe en el chat:
//    "Crea un Report en AL que liste todos los proyectos
//    de auditoría abiertos, agrupados por cliente,
//    mostrando el total de importe presupuestado por cliente"

// 👇 Pega aquí lo que genere Copilot
