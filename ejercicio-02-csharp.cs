// =============================================================
// EJERCICIO 2 — C#: Controlador REST con ASP.NET Core
// =============================================================
//
// 🎯 OBJETIVO: Ver cómo Copilot genera un controlador completo
//    a partir de un comentario descriptivo, siguiendo las
//    convenciones de PKF Attest definidas en copilot-instructions.md
//
// 📋 INSTRUCCIONES:
//    1. Empieza leyendo el comentario de cada sección
//    2. Coloca el cursor donde indica la flecha 👇
//    3. Pulsa ENTER y observa la sugerencia de Copilot
//    4. En el chat usa /explain para entender lo generado
//    5. Usa /fix si ves algún error o /tests para generar tests
//
// ⚠️  IMPORTANTE: Este archivo no compila solo — es un ejercicio
//     de práctica con Copilot, no un proyecto completo.
// =============================================================

using Microsoft.AspNetCore.Mvc;

namespace PKFAttest.API.Controllers;


// -------------------------------------------------------------
// EJERCICIO 2.1 — Generación de boilerplate con un comentario
// -------------------------------------------------------------
//
// 👇 Coloca el cursor después de este comentario y pulsa ENTER.
//    Copilot generará el controlador completo automáticamente.
//
// Controlador REST para gestionar Clientes de auditoría.
// Operaciones CRUD completas usando IClienteService mediante inyección de dependencias.
// Rutas: GET /api/clientes, GET /api/clientes/{id}, POST /api/clientes,
//        PUT /api/clientes/{id}, DELETE /api/clientes/{id}
// Devuelve 404 si el cliente no existe y 400 si los datos son inválidos.




// -------------------------------------------------------------
// EJERCICIO 2.2 — Refactorizar con Copilot
// -------------------------------------------------------------
//
// El siguiente código funciona pero está mal escrito.
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona el método MalEscrito y escribe en el chat:
//    "/simplify" y después "/fix"
//    Observa cómo Copilot lo mejora.

public class EjercicioRefactor
{
    // ❌ Código mal escrito a propósito para practicar /simplify
    public string MalEscrito(List<string> lista, string buscar)
    {
        string resultado = "";
        for (int i = 0; i < lista.Count; i++)
        {
            if (lista[i] != null)
            {
                if (lista[i].ToLower() == buscar.ToLower())
                {
                    resultado = lista[i];
                }
            }
        }
        if (resultado == "")
        {
            return "No encontrado";
        }
        return resultado;
    }
}


// -------------------------------------------------------------
// EJERCICIO 2.3 — Documentación automática con /doc
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona la clase ServicioFacturacion completa y escribe:
//    "/doc Genera documentación XMLDoc completa en español
//    para todos los métodos públicos"

public class ServicioFacturacion
{
    public decimal CalcularBaseImponible(decimal importe, decimal porcentajeDescuento)
    {
        if (porcentajeDescuento < 0 || porcentajeDescuento > 100)
            throw new ArgumentOutOfRangeException(nameof(porcentajeDescuento));

        return importe * (1 - porcentajeDescuento / 100);
    }

    public decimal CalcularIVA(decimal baseImponible, decimal tipoIVA = 21)
    {
        return baseImponible * (tipoIVA / 100);
    }

    public decimal CalcularTotalFactura(decimal importe, decimal descuento, decimal tipoIVA = 21)
    {
        var baseImponible = CalcularBaseImponible(importe, descuento);
        var iva = CalcularIVA(baseImponible, tipoIVA);
        return baseImponible + iva;
    }
}


// -------------------------------------------------------------
// EJERCICIO 2.4 — Generar tests unitarios con /tests
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona la clase ServicioFacturacion y escribe:
//    "/tests Genera tests con xUnit para todos los métodos.
//    Cubre: valores normales, descuento 0%, descuento 100%,
//    descuento negativo (debe lanzar excepción) y distintos tipos de IVA"

// 👇 Copilot generará los tests aquí (o en un archivo nuevo)


// -------------------------------------------------------------
// EJERCICIO 2.5 — Detección de vulnerabilidades de seguridad
// -------------------------------------------------------------
//
// 💬 INSTRUCCIÓN PARA EL CHAT:
//    Selecciona el método BuscarCliente y escribe:
//    "Revisa este código en busca de vulnerabilidades de seguridad
//    y corrígelas"

public class RepositorioClientes
{
    private readonly string _connectionString;

    public RepositorioClientes(string connectionString)
    {
        _connectionString = connectionString;
    }

    // ⚠️  Este método tiene una vulnerabilidad de SQL Injection a propósito.
    //     Copilot debería detectarla y proponer consultas parametrizadas.
    public string BuscarCliente(string nombre)
    {
        // ❌ VULNERABLE — nunca hagas esto en producción
        var query = "SELECT * FROM Clientes WHERE Nombre = '" + nombre + "'";
        // ... ejecución de la query
        return query; // simplificado para el ejercicio
    }
}
