extends CanvasLayer
@onready var time_label: Label = $"Control/CenterContainer/VBoxContainer/Time Label"
var time : float :
	set(value):
		time_label.text = "%.2f sec" % value
