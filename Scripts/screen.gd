extends Node

@onready var screen_sprite = $ScreenSprite
@onready var screenbuttronsprite: AnimatedSprite2D = $Screenbuttronsprite
@onready var bar: AnimatedSprite2D = $Bar
@onready var glow: Sprite2D = $Glow

var click := false
var clicktime := 0.0
var animating := false


func _ready():
	screen_sprite.hide()
	glow.hide()

func _on_screen_button_pressed():
	if BlinkStatus.blink_active:
		return

	if animating:
		return

	animating = true
	click = true

	ScreenStatus.screen_active = !ScreenStatus.screen_active

	if ScreenStatus.screen_active:
		screen_sprite.show()
		screen_sprite.stop()
		screen_sprite.play("Open")
		await screen_sprite.animation_finished

		ScreenStatus.show = true
		
	else:
		ScreenStatus.show = false
		bar.hide()
		glow.hide()

		screen_sprite.stop()
		screen_sprite.play("Close")
		await screen_sprite.animation_finished
		screen_sprite.hide()

	animating = false

	

func _process(delta: float) -> void:
	if click == true:
		clicktime += delta
		screenbuttronsprite.play("Click")
		if clicktime >= 0.1:
			click = false
			screenbuttronsprite.play("Normal")
			clicktime = 0.0
	
	if ScreenStatus.show == true:
		bar.show()
		glow.show()
	
	else:
		bar.hide()
		glow.hide()
		
			
