# =============================================================
# EJERCICIO 8 — PowerShell: Automatización y DevOps
# =============================================================
#
# 🎯 OBJETIVO: Usar Copilot para generar scripts de PowerShell
#    de automatización — ideal para tareas de DevOps, gestión
#    de servidores y automatización de procesos de empresa.
#
# 📋 INSTRUCCIONES:
#    1. Lee el comentario de cada ejercicio
#    2. Coloca el cursor donde indica 👇 y pulsa ENTER
#    3. En el CHAT puedes usar @terminal para dar más contexto
#    4. Para scripts largos, divide en funciones pequeñas
#
# 💡 TIP: PowerShell es uno de los lenguajes donde Copilot
#    aporta más valor porque los cmdlets son difíciles de recordar.
#    Describe lo que quieres hacer y Copilot elige los cmdlets correctos.
# =============================================================


# -------------------------------------------------------------
# EJERCICIO 8.1 — Script de generación de informes
# -------------------------------------------------------------
#
# 👇 Pulsa ENTER después del comentario.
#    Copilot completará el script completo.
#
# Script PowerShell que genera un informe diario del estado de los servidores.
# Para cada servidor de la lista: verifica si está accesible (ping),
# obtiene el uso de CPU, RAM libre, espacio en disco C: y D:,
# y los últimos 10 errores del Event Log de Application.
# Exporta el resultado a un CSV con la fecha de hoy en el nombre.
# Si un servidor no está accesible, lo marca como "OFFLINE" en el informe.

$servidores = @("servidor-web-01", "servidor-db-01", "servidor-app-01")

# 👇 Copilot completará el script aquí


# -------------------------------------------------------------
# EJERCICIO 8.2 — Gestión de usuarios y permisos
# -------------------------------------------------------------
#
# 💬 INSTRUCCIÓN PARA EL CHAT (usando @terminal):
#    "@terminal Genera un script PowerShell que lea un CSV con
#    columnas Nombre, Email, Departamento, GruposAD y cree los
#    usuarios en Active Directory con contraseña inicial aleatoria,
#    los añada a los grupos especificados y envíe un email de
#    bienvenida a cada usuario con sus credenciales.
#    Incluye manejo de errores y un log de las acciones realizadas."

# 👇 Pega aquí el script generado:


# -------------------------------------------------------------
# EJERCICIO 8.3 — Automatización de backups
# -------------------------------------------------------------
#
# 👇 Pulsa ENTER después del comentario.
#
# Función PowerShell para hacer backup de bases de datos SQL Server.
# Parámetros: servidor, lista de bases de datos, carpeta destino,
# número de días de retención (eliminar backups más antiguos).
# Comprime el backup en .zip, genera un log con el resultado
# y devuelve un objeto con el resumen (exitosos, fallidos, espacio liberado).

function Invoke-DatabaseBackup {
    # 👇 Copilot completará aquí
}


# -------------------------------------------------------------
# EJERCICIO 8.4 — Usa /explain para entender este script
# -------------------------------------------------------------
#
# 💬 INSTRUCCIÓN PARA EL CHAT:
#    Selecciona todo el bloque de abajo y escribe:
#    "/explain ¿Qué hace este script paso a paso?
#    ¿Hay alguna forma más eficiente o segura de hacerlo?"

$ErrorActionPreference = "Stop"
$logFile = "C:\Logs\cleanup_$(Get-Date -Format 'yyyyMMdd').log"

function Write-Log {
    param([string]$Mensaje, [string]$Nivel = "INFO")
    $entrada = "[$(Get-Date -Format 'HH:mm:ss')] [$Nivel] $Mensaje"
    Add-Content -Path $logFile -Value $entrada
    if ($Nivel -eq "ERROR") { Write-Host $entrada -ForegroundColor Red }
    else { Write-Host $entrada }
}

try {
    Write-Log "Iniciando limpieza de archivos temporales"

    $rutas = @("C:\Windows\Temp", "$env:TEMP", "C:\IIS\Logs")
    $totalLiberado = 0
    $totalArchivos = 0

    foreach ($ruta in $rutas) {
        if (-not (Test-Path $ruta)) {
            Write-Log "Ruta no encontrada: $ruta" -Nivel "WARN"
            continue
        }

        $archivos = Get-ChildItem -Path $ruta -Recurse -File -ErrorAction SilentlyContinue |
                    Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) }

        foreach ($archivo in $archivos) {
            $tamaño = $archivo.Length
            Remove-Item -Path $archivo.FullName -Force -ErrorAction SilentlyContinue
            if (-not (Test-Path $archivo.FullName)) {
                $totalLiberado += $tamaño
                $totalArchivos++
            }
        }
    }

    $mbLiberados = [math]::Round($totalLiberado / 1MB, 2)
    Write-Log "Limpieza completada. Archivos: $totalArchivos. Espacio liberado: $mbLiberados MB"
}
catch {
    Write-Log "Error inesperado: $($_.Exception.Message)" -Nivel "ERROR"
    exit 1
}


# -------------------------------------------------------------
# EJERCICIO 8.5 — Optimiza y añade funcionalidades
# -------------------------------------------------------------
#
# 💬 INSTRUCCIÓN PARA EL CHAT:
#    Selecciona el script del ejercicio 8.4 y escribe:
#    "Mejora este script añadiendo:
#    1. Parámetros configurables (rutas, días de retención)
#    2. Modo -WhatIf para simular sin borrar nada
#    3. Notificación por email si se liberan más de 1GB
#    4. Exportar el resultado a un CSV"

# 👇 Pega el script mejorado aquí
