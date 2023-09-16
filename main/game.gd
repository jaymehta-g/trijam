extends Node
class_name Game
@export var max_fuel := 10.0
var fuel := 0.0

func _ready() -> void:
	Globals.game = self
	fuel = max_fuel
	SignalBus.fuel_pickup_used.connect(func():
		fuel = max_fuel
		)

func _process(delta: float) -> void:
	if Globals.player.boosting:
		fuel -= delta
		print_debug(fuel)
