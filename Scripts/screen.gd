extends Node

@onready var screen_sprite = $ScreenSprite

func _ready():
	screen_sprite.hide()

func _on_screen_button_pressed():
	if BlinkStatus.blink_active == false:
		ScreenStatus.screen_active = !ScreenStatus.screen_active
		
		if ScreenStatus.screen_active:
			screen_sprite.show()
		else:
			screen_sprite.hide()
