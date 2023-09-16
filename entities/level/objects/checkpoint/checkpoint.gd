extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group(Globals.PLAYER_GROUP):
		return
	(body as Player).checkpoint = position
	SignalBus.fuel_pickup_used.emit()
