extends Node



func _on_retry_button_pressed() -> void:
	ScreenStatus.screen_active = false
	BlinkStatus.blink_active = false
	PowerDrain.poweroff = false
	get_tree().change_scene_to_file("res://Scenes/Night.tscn")
