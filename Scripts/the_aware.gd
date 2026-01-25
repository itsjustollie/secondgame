extends Node

@onready var aware_sprite: AnimatedSprite2D = $AwareSprite
@onready var aware_shocked: AudioStreamPlayer2D = $AwareShocked
@onready var aware_jumpscare: AnimatedSprite2D = $Aware_Jumpscare
@onready var aware_jumpscaresound: AudioStreamPlayer2D = $Aware_Jumpscaresound


var time := 0.0
var move_chance := 0
var attack := false
var kill_time := 0
var stage = "Stage1"
var wait = 0.0
var pause = false
var jumpscare_time = 0.0
const aggresion := 6



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("F"):
		aware_sprite.animation = stage
	else:
		aware_sprite.animation = "Hide"
		
	time += delta
	if time >= 6.0 and attack == false:
		move_chance = (randi_range(1, aggresion))
		if move_chance == 1:
			if stage == "Stage1":
				stage = "Stage2"
				time = 0.0
			
			elif stage == "Stage2":
				stage = "Stage3"
				time = 0.0
				attack = true
	
	if attack == true:
		kill_time = (randi_range(8, 13))
		
		if time >= kill_time:
			attack = false
			aware_jumpscare.show()
			aware_jumpscaresound.play()
			pause = true
		
		if ShockStatus.shock_active == true:
			aware_shocked.play()
			attack = false
			aware_sprite.animation = "Hide"
			stage = "Stage1"
	
	if pause == true:
		jumpscare_time += delta
		if jumpscare_time >= 1.2:
			get_tree().change_scene_to_file("res://Scenes/die.tscn")

			
