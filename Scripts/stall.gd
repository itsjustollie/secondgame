extends Node

@onready var error_1: Button = $error1
@onready var er_sound: AudioStreamPlayer2D = $ErSound
@onready var stall_jumpscare: AnimatedSprite2D = $Stall_jumpscare
@onready var stall_jump: AudioStreamPlayer2D = $Stall_Jump

var time := 0.0
var move_chance := 0
var attack := false
var aggresion := 3
var pause := 0.0

func _ready() -> void:
	error_1.hide()

func _process(delta: float) -> void:
	
	#Hidding UI when screen is down
	if ScreenStatus.screen_active == false and attack == true:
		error_1.hide()
		
	if ScreenStatus.screen_active == true and attack == true:
		error_1.show()
		
	
	time += delta
	if time >= 8.0 and attack == false:
		move_chance = (randi_range(1, aggresion))
		if move_chance == 1:
			attack = true
			PowerDrain.er1 = true
			er_sound.play()
		
		time = 0.0
			
	
	if PowerDrain.poweroff == true:
		pause += delta
		if pause >= 0.8:
			stall_jump.play()
			stall_jumpscare.show()
			if pause >= 2.2:
				get_tree().change_scene_to_file("res://Scenes/die.tscn")






func _on_error_1_button_up() -> void:
	PowerDrain.er1 = false
	attack = false
	error_1.hide()
