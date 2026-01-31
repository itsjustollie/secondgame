extends Node

@onready var blink_sprite: AnimatedSprite2D = $BlinkSprite
@onready var blink_icon: AnimatedSprite2D = $BlinkButton/Blink_Icon

var animating := false

func _ready():
	blink_sprite.hide()




func _on_blink_button_pressed() -> void:
	if ScreenStatus.screen_active:
		return

	if animating:
		return

	animating = true
	BlinkStatus.blink_active = !BlinkStatus.blink_active

	if BlinkStatus.blink_active:
		blink_sprite.show()
		blink_sprite.stop()
		blink_sprite.play("Close")
		blink_icon.play("Close")
	else:
		blink_sprite.stop()
		blink_sprite.play("Open")
		await blink_sprite.animation_finished
		blink_sprite.hide()
		blink_icon.play("Open")

	animating = false

func _process(delta: float) -> void:
	if BlinkStatus.blink_active == true:
		BlinkStatus.blink_time += delta
	else:
		BlinkStatus.blink_time = 0.0
