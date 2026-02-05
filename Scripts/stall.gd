extends Node

@onready var error_1: Button = $error1
@onready var er_sound: AudioStreamPlayer2D = $ErSound
@onready var stall_jumpscare: AnimatedSprite2D = $Stall_jumpscare
@onready var stall_jump: AudioStreamPlayer2D = $Stall_Jump
@onready var screen_sprite: AnimatedSprite2D = $"../../Screen/ScreenSprite"
@onready var blink_sprite: AnimatedSprite2D = $"../../Camera/Blink/BlinkSprite"

var time := 0.0
var move_chance := 0
var attack := false
var aggresion := 0
var pause := 0.0

func _ready() -> void:
	error_1.hide()
	aggresion = Aggresion.stall_ag

func _process(delta: float) -> void:
	
	#Hidding UI when screen is down
	if ScreenStatus.show == false and attack == true:
		error_1.hide()
		
	if ScreenStatus.show == true and attack == true:
		error_1.show()
		
	
	time += delta
	if time >= 4.0 and attack == false:
		move_chance = (randi_range(1, aggresion))
		if move_chance == 1:
			attack = true
			PowerDrain.er1 = true
			er_sound.play()
		
		time = 0.0
			
	
	if PowerDrain.poweroff == true:
		pause += delta
		if pause >= 0.8:
			BlinkStatus.blink_active = false
			ScreenStatus.screen_active = false
			ScreenStatus.show = false
			blink_sprite.hide()
			screen_sprite.hide()
			stall_jump.play()
			stall_jumpscare.show()
			if pause >= 2.2:
				get_tree().change_scene_to_file("res://Scenes/die.tscn")






func _on_error_1_button_up() -> void:
	PowerDrain.er1 = false
	attack = false
	error_1.hide()
