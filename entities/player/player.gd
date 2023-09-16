extends RigidBody2D
class_name Player

@export var friction := 0.01
@export var accel := 5.0
@export var turn_speed := 2.0
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

var boosting : bool :
	get:
		return Input.is_action_pressed("boost") and Globals.game.fuel >= 0

func _ready() -> void:
	Globals.player=self

func _physics_process(_delta: float) -> void:
	# turning
	var turn_input = Input.get_action_raw_strength(&"turn_left") - Input.get_action_raw_strength(&"turn_right")
	var turn_amount = -turn_input * turn_speed
	apply_torque(turn_amount)
	
	# boosting
	if boosting:
		var boost_amount = (Vector2.RIGHT*accel).rotated(rotation)
		apply_force(boost_amount)
	
	# fuel signals
#	if Input.is_action_just_pressed("boost"):
#		SignalBus.boost_start.emit()
#	if Input.is_action_just_released("boost"):
#		SignalBus.boost_stop.emit()
	
	#juice
	if boosting:
		gpu_particles_2d.emitting = true
	else:
		gpu_particles_2d.emitting = false
