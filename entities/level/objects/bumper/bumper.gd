extends Area2D

@onready var reset_timer: Timer = $"Reset Timer"
@export var bounce_force := 20.0
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
var disabled := false

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group(Globals.PLAYER_GROUP):
		return
	if disabled:
		return
	# bounce it back
	var rigidbody := body as RigidBody2D
	var bounce_direction := (rigidbody.position - position).normalized()
	var bounce_vector := bounce_direction.rotated(0) * bounce_force
	rigidbody.apply_central_impulse(bounce_vector)
	# temp disable
	disabled = true
	reset_timer.start()
	# juice
	gpu_particles_2d.emitting = true

func _on_reset_timer_timeout() -> void:
	disabled = false
