extends CanvasLayer

@onready var fuel_bar: TextureProgressBar = $Control/TextureProgressBar

func _process(delta: float) -> void:
	var game := Globals.game
	fuel_bar.value = game.fuel / game.max_fuel
