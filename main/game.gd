extends Node2D

@export var max_fuel := 10.0
var fuel := 0.0

func _ready() -> void:
	fuel = max_fuel

func _process(delta: float) -> void:
	if Globals.player.boosting:
		fuel -= delta
		print_debug(fuel)
