extends Line2D

@onready var collision_shape_2d: CollisionShape2D = $"Physics Body/CollisionShape2D"

func _ready() -> void:
	var pointa := get_point_position(0)
	var pointb := get_point_position(1)
	var segment := collision_shape_2d.shape as SegmentShape2D
	segment.set_a(pointa)
	segment.set_b(pointb)
