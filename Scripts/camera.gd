extends Camera2D

@export var sway_strength := 20.0   # how far it moves (pixels)
@export var sway_speed := 5.0       # smoothness

var target_offset := 0.0

func _process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	var screen_width = get_viewport_rect().size.x

	# Convert mouse position to -1 → 1
	var normalized = (mouse_x / screen_width) * 2.0 - 1.0

	target_offset = normalized * sway_strength

	offset.x = lerp(offset.x, target_offset, delta * sway_speed)
	
func get_sway_offset() -> float:
	return offset.x
