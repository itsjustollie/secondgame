extends Node

@onready var blink_sprite: AnimatedSprite2D = $BlinkSprite


func _ready():
	blink_sprite.hide()




func _on_blink_button_pressed() -> void:
	if ScreenStatus.screen_active == false:
		BlinkStatus.blink_active = !BlinkStatus.blink_active

		if BlinkStatus.blink_active:
			blink_sprite.show()
		else:
			blink_sprite.hide()

func _process(delta: float) -> void:
	if BlinkStatus.blink_active == true:
		BlinkStatus.blink_time += delta
	else:
		BlinkStatus.blink_time = 0.0
