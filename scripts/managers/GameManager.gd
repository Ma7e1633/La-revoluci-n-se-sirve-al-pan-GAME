# ============================================================================
# GameManager.gd
# ============================================================================
# Gestor principal del juego BAEL - El Imperio del Choripán
# Autoload centralizado para gestionar el estado global del juego
# ============================================================================

extends Node

# ============================================================================
# Variables de Estado del Juego
# ============================================================================

## Cantidad de pesos ilegales acumulados en el imperio criminal
var pesos_ilegales: int = 0

## Índice metabólico para el sistema de recursos
var indice_metabolico: int = 100

## Cantidad de ingredientes disponibles
var ingredientes: int = 0

# ============================================================================
# Ciclo de Vida
# ============================================================================

func _ready() -> void:
	# Inicializar valores por defecto del juego
	pesos_ilegales = 0
	indice_metabolico = 100
	ingredientes = 0
	
	# Mensaje de confirmación en consola
	print("GameManager inicializado correctamente")
	print("Valores iniciales - Pesos: %d | Metabolismo: %d | Ingredientes: %d" % 
		[pesos_ilegales, indice_metabolico, ingredientes])

# ============================================================================
# Métodos de Gestión de Pesos Ilegales
# ============================================================================

## Añade una cantidad de pesos al empire
func agregar_pesos(cantidad: int) -> void:
	if cantidad > 0:
		pesos_ilegales += cantidad
		print("Se añadieron %d pesos. Total: %d" % [cantidad, pesos_ilegales])
	else:
		push_error("No se pueden añadir pesos negativos")

## Resta una cantidad de pesos del imperio
func restar_pesos(cantidad: int) -> void:
	if cantidad > 0 and pesos_ilegales >= cantidad:
		pesos_ilegales -= cantidad
		print("Se restaron %d pesos. Total: %d" % [cantidad, pesos_ilegales])
	else:
		push_error("No hay suficientes pesos o cantidad inválida")

# ============================================================================
# Métodos de Gestión del Índice Metabólico
# ============================================================================

## Incrementa el índice metabólico
func aumentar_metabolismo(cantidad: int) -> void:
	if cantidad > 0:
		indice_metabolico += cantidad
		print("Metabolismo aumentado en %d. Total: %d" % [cantidad, indice_metabolico])

## Reduce el índice metabólico
func reducir_metabolismo(cantidad: int) -> void:
	if cantidad > 0:
		indice_metabolico = max(0, indice_metabolico - cantidad)
		print("Metabolismo reducido en %d. Total: %d" % [cantidad, indice_metabolico])

# ============================================================================
# Métodos de Gestión de Ingredientes
# ============================================================================

## Añade ingredientes al inventario
func agregar_ingredientes(cantidad: int) -> void:
	if cantidad > 0:
		ingredientes += cantidad
		print("Se añadieron %d ingredientes. Total: %d" % [cantidad, ingredientes])
	else:
		push_error("No se pueden añadir ingredientes negativos")

## Utiliza ingredientes del inventario
func usar_ingredientes(cantidad: int) -> bool:
	if cantidad > 0 and ingredientes >= cantidad:
		ingredientes -= cantidad
		print("Se utilizaron %d ingredientes. Total: %d" % [cantidad, ingredientes])
		return true
	else:
		push_warning("No hay suficientes ingredientes")
		return false

# ============================================================================
# Métodos Utilitarios
# ============================================================================

## Reinicia el estado completo del juego a valores iniciales
func reiniciar_juego() -> void:
	pesos_ilegales = 0
	indice_metabolico = 100
	ingredientes = 0
	print("Juego reiniciado a valores iniciales")

## Retorna un diccionario con el estado actual del juego
func obtener_estado_juego() -> Dictionary:
	return {
		"pesos_ilegales": pesos_ilegales,
		"indice_metabolico": indice_metabolico,
		"ingredientes": ingredientes
	}
