extends Node

@onready var false_sprite: AnimatedSprite2D = $FalseSprite
@onready var leave: AudioStreamPlayer2D = $Leave
@onready var breathing: AudioStreamPlayer2D = $Breathing
@onready var scream: AudioStreamPlayer2D = $Scream


var time := 0.0
var move_chance := 0
var attack := false
var wait := false
var kill_time := 0
var jumpscare_time := 0.0
var aggresion := 0



func _ready():
	aggresion = Aggresion.false_ag



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if time >= 5.0 and attack == false:
		move_chance = (randi_range(1, aggresion))
		if move_chance == 1:
			attack = true
			breathing.play()
			
		time = 0.0
	
	if attack == true:
		false_sprite.play("default")
		false_sprite.show()
		kill_time = (randi_range(8, 13))
		
		if time >= kill_time:
			attack = false
			jumpscare_time += delta
			breathing.stop()
			false_sprite.play("Jumpscare")
			scream.play()
			wait = true
			
			
		if BlinkStatus.blink_active == true:
			if BlinkStatus.blink_time >= 3.0:
				attack = false
				breathing.stop()
				leave.play()
				false_sprite.hide()
	
	if wait == true:
		jumpscare_time += delta
		if jumpscare_time >= 1.2:
			get_tree().change_scene_to_file("res://Scenes/die.tscn")
