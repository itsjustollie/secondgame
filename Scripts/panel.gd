extends Panel

@export var ui_sway_strength := 1.0
var base_position: Vector2


func _ready():
	base_position = position


func _process(delta):
	var cam = get_viewport().get_camera_2d()
	if cam:
		position.x = base_position.x + cam.get_sway_offset() * ui_sway_strength
