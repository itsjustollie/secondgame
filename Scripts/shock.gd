extends Node

var time = 0.0


func _on_shock_button_pressed() -> void:
		if ScreenStatus.screen_active == false and BlinkStatus.blink_active == false and ShockStatus.shock_active == false:
			ShockStatus.shock_active = true

func _process(delta: float) -> void:
	if ShockStatus.shock_active == true:
		time += delta
		if time >= 3.0:
			ShockStatus.shock_active = false
			
