extends Node

func _on_h_0_pressed() -> void:
	Aggresion.stall_ag = 40000000
	Aggresion.crook_ag = 1000000
	Aggresion.false_ag = 5000000000
	Aggresion.aware_ag = 60000000000
	
	get_tree().change_scene_to_file("res://Scenes/Night.tscn")
	

func _on_h_1_pressed() -> void:
	Aggresion.stall_ag = 40000000
	Aggresion.crook_ag = 1000000
	Aggresion.false_ag = 5000000000
	Aggresion.aware_ag = 6
	
	get_tree().change_scene_to_file("res://Scenes/Night.tscn")

func _on_h_2_pressed() -> void:
	Aggresion.stall_ag = 4
	Aggresion.crook_ag = 1000000
	Aggresion.false_ag = 5000000000
	Aggresion.aware_ag = 5
	
	get_tree().change_scene_to_file("res://Scenes/Night.tscn")

func _on_h_3_pressed() -> void:
	Aggresion.stall_ag = 4
	Aggresion.crook_ag = 5
	Aggresion.false_ag = 10000000
	Aggresion.aware_ag = 4
	
	get_tree().change_scene_to_file("res://Scenes/Night.tscn")
	
	
func _on_h_4_pressed() -> void:
	Aggresion.stall_ag = 3
	Aggresion.crook_ag = 5
	Aggresion.false_ag = 5
	Aggresion.aware_ag = 4
	
	get_tree().change_scene_to_file("res://Scenes/Night.tscn")


func _on_h_5_pressed() -> void:
	Aggresion.stall_ag = 3
	Aggresion.crook_ag = 4
	Aggresion.false_ag = 5
	Aggresion.aware_ag = 3
	
	get_tree().change_scene_to_file("res://Scenes/Night.tscn")
	
