extends Node

@onready var crooked_sprite: AnimatedSprite2D = $Crooked_Sprite
@onready var heat_button: Button = $HeatButton
@onready var fan: AnimatedSprite2D = $Fan
@onready var crooked_jumpscare: AnimatedSprite2D = $Crooked_Jumpscare
@onready var crook_scream: AudioStreamPlayer2D = $Crook_scream

var time := 0.0
var move_chance := 0
var attack := false
var wait := false
var kill_time := 0
var jumpscare_time := 0.0
var HeatTime := 0.0
const aggresion := 2



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	crooked_sprite.hide()
	heat_button.hide()
	fan.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ScreenStatus.screen_active == true:
		crooked_sprite.show()
		heat_button.show()
		fan.show()
	else:
		crooked_sprite.hide()
		heat_button.hide()
		fan.hide()
	
	time += delta
	if time >= 5.0 and attack == false:
		move_chance = (randi_range(1, aggresion))
		if move_chance == 1:
			attack = true
			
		time = 0.0
	
	if attack == true:
		crooked_sprite.animation = "Attack"
		kill_time = (randi_range(12, 15))
		
		if time >= kill_time:
			attack = false
			crook_scream.play()
			wait = true
			crooked_jumpscare.show()
			
	if wait == true:
		jumpscare_time += delta
		if jumpscare_time >= 1.2:
				get_tree().change_scene_to_file("res://Scenes/die.tscn")
				
			
	if Heating.HeatOn == true:
		HeatTime += delta
		fan.animation = "On"
		if HeatTime >= 3.0:
			attack = false
			crooked_sprite.animation = "gone"
	else:
		fan.animation = "Off"
		HeatTime = 0.0

func _on_heat_button_pressed() -> void:
	Heating.HeatOn = !Heating.HeatOn
