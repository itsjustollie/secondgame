extends Node

@onready var error_1: Button = $error1

var time := 0.0
var move_chance := 0
var attack := false
var aggresion := 3

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
		
		time = 0.0
			






func _on_error_1_button_up() -> void:
	PowerDrain.er1 = false
	attack = false
	error_1.hide()
