extends Node

var time = 0.0
@onready var shock_icon: AnimatedSprite2D = $Shock_Icon
@onready var sparks: GPUParticles2D = $Sparks


func _on_shock_button_pressed() -> void:
		if ScreenStatus.screen_active == false and BlinkStatus.blink_active == false and ShockStatus.shock_active == false:
			ShockStatus.shock_active = true
			

func _process(delta: float) -> void:
	if ShockStatus.shock_active == true:
		time += delta
		shock_icon.play("On")
		if time >= 1.5:
			shock_icon.play("Off")
			time = 0.0
			ShockStatus.shock_active = false
			
