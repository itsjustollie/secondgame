extends Node

var f1done := false
var f2done := false
var f3done := false

var buffer = 0.0



func _process(delta: float) -> void:
	buffer += delta
	if f1done == true and f2done == true and f3done == true and buffer >= 0.5:
		get_tree().change_scene_to_file("res://Scenes/Win.tscn")
