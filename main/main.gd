extends Node2D
@onready var game: Node = $Game
@export var end_screen_scene: PackedScene
var start_time : float
var total_time_taken : float
const MS_IN_SECOND := 0.001
func _ready() -> void:
	SignalBus.first_input_made.connect(func():
		start_time = Time.get_ticks_msec()
		print_debug(start_time)
	)
	SignalBus.end_game.connect(func():
		game.queue_free()
		total_time_taken = Time.get_ticks_msec() - start_time
		print_debug(total_time_taken)
		var end_screen = end_screen_scene.instantiate()
		add_child(end_screen)
		end_screen.time = total_time_taken * MS_IN_SECOND
	)
