"""Operaciones aritméticas básicas de la calculadora."""

# Integrantes del equipo, en el mismo orden de la sección Integrantes del README.
AUTOR = "Jose Miguel Blanco"


def sumar(a, b):
    """Devuelve la suma de a y b."""
    return a + b


def restar(a, b):
    """Devuelve la resta de a menos b."""
    return a - b


def multiplicar(a, b):
    """Devuelve el producto de a por b."""
    return a * b


def dividir(a, b):
    """Devuelve a dividido entre b; lanza ZeroDivisionError si b es cero."""
    if b == 0:
        raise ZeroDivisionError("No se puede dividir por cero")
    return a / b


def potencia(a, b):
    """Devuelve a elevado a la potencia b."""
    return a**b


def modulo(a, b):
    """Devuelve el resto de dividir a entre b; lanza ZeroDivisionError si b es cero."""
    if b == 0:
        raise ZeroDivisionError("No se puede dividir por cero")
    return a % b
