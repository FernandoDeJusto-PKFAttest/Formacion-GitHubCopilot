# =============================================================
# EJERCICIO 9 — Python: Análisis de Datos y Automatización
# =============================================================
#
# 🎯 OBJETIVO: Ver cómo Copilot genera código Python para
#    análisis de datos, procesamiento de ficheros Excel/CSV
#    y automatización — muy útil en auditoría y consultoría.
#
# 📋 INSTRUCCIONES:
#    1. Lee el comentario de cada ejercicio
#    2. Coloca el cursor donde indica 👇 y pulsa ENTER
#    3. Usa el CHAT para pedir variaciones o explicaciones
#    4. Usa /tests para generar tests con pytest
#
# 💡 TIP: Python + pandas es uno de los combos donde Copilot
#    brilla más. Describe los datos que tienes y el resultado
#    que quieres — Copilot escribe las transformaciones solo.
# =============================================================

import pandas as pd
import openpyxl
from datetime import datetime, timedelta
from pathlib import Path
from typing import Optional


# -------------------------------------------------------------
# EJERCICIO 9.1 — Procesamiento de ficheros Excel de auditoría
# -------------------------------------------------------------
#
# 👇 Pulsa ENTER después del comentario.
#    Copilot completará la función.
#
# Función que lee un fichero Excel de registro de horas de auditoría.
# Columnas esperadas: Empleado, Proyecto, Cliente, Fecha, Horas, Facturable.
# Debe: limpiar datos nulos, convertir Fecha a datetime, validar que
# Horas sea numérico y positivo, y devolver un DataFrame limpio.
# Si hay errores de formato, los registra en un log y omite esas filas.

def cargar_registro_horas(ruta_excel: str) -> pd.DataFrame:
    # 👇 Copilot completará aquí


# -------------------------------------------------------------
# EJERCICIO 9.2 — Análisis y métricas
# -------------------------------------------------------------
#
# 👇 Pulsa ENTER después del comentario.
#
# Función que recibe el DataFrame del ejercicio anterior y genera
# un diccionario con métricas: total horas por empleado, total horas
# por cliente, porcentaje de horas facturables, top 5 proyectos por horas,
# horas por semana del mes, y empleados con más de 45 horas semanales.

def calcular_metricas(df: pd.DataFrame) -> dict:
    # 👇 Copilot completará aquí


# -------------------------------------------------------------
# EJERCICIO 9.3 — Generación de informe Excel formateado
# -------------------------------------------------------------
#
# 💬 INSTRUCCIÓN PARA EL CHAT:
#    Escribe en el chat:
#    "Crea una función Python que reciba el diccionario de métricas
#    del ejercicio anterior y genere un fichero Excel con:
#    - Una hoja por cada métrica
#    - La primera hoja con un resumen ejecutivo
#    - Colores corporativos (azul #1A3C6B para cabeceras)
#    - Formato de número con separador de miles
#    - Gráfico de barras en la hoja de horas por empleado
#    Usa openpyxl para el formato y los gráficos."

# 👇 Pega aquí la función generada:


# -------------------------------------------------------------
# EJERCICIO 9.4 — Explica este código con /explain
# -------------------------------------------------------------
#
# 💬 INSTRUCCIÓN PARA EL CHAT:
#    Selecciona la función de abajo y escribe:
#    "/explain ¿Qué hace esta función paso a paso?
#    ¿Por qué se usa cada parámetro de groupby y pivot_table?"

def analizar_tendencia_facturacion(df: pd.DataFrame) -> pd.DataFrame:
    df["Fecha"] = pd.to_datetime(df["Fecha"])
    df["Mes"] = df["Fecha"].dt.to_period("M")
    df["Semana"] = df["Fecha"].dt.isocalendar().week

    facturacion_mensual = (
        df[df["Facturable"] == True]
        .groupby(["Mes", "Cliente"])
        .agg(
            horas_facturables=("Horas", "sum"),
            num_proyectos=("Proyecto", "nunique"),
            num_empleados=("Empleado", "nunique"),
        )
        .reset_index()
    )

    pivot = facturacion_mensual.pivot_table(
        values="horas_facturables",
        index="Mes",
        columns="Cliente",
        fill_value=0,
        aggfunc="sum",
    )

    pivot["TOTAL"] = pivot.sum(axis=1)
    pivot["variacion_pct"] = pivot["TOTAL"].pct_change() * 100

    return pivot.round(2)


# -------------------------------------------------------------
# EJERCICIO 9.5 — Detección de anomalías en datos
# -------------------------------------------------------------
#
# 👇 Pulsa ENTER después del comentario.
#
# Función que detecta registros anómalos en el DataFrame de horas:
# - Empleados que superan 10 horas en un día
# - Registros en festivos o fines de semana (lista de festivos configurable)
# - Proyectos con horas registradas después de su fecha de cierre
# - Empleados con gaps de más de 5 días laborables sin registrar horas
# Devuelve un DataFrame con los registros anómalos y el tipo de anomalía.

def detectar_anomalias(
    df: pd.DataFrame,
    festivos: Optional[list] = None
) -> pd.DataFrame:
    # 👇 Copilot completará aquí


# -------------------------------------------------------------
# EJERCICIO 9.6 — Tests con pytest
# -------------------------------------------------------------
#
# 💬 INSTRUCCIÓN PARA EL CHAT:
#    Selecciona las funciones cargar_registro_horas y calcular_metricas
#    y escribe en el chat:
#    "/tests Genera tests con pytest para estas funciones.
#    Crea fixtures con DataFrames de ejemplo.
#    Cubre: datos correctos, columnas faltantes, valores nulos,
#    tipos incorrectos y DataFrame vacío."

# 👇 Copilot generará los tests aquí
