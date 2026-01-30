extends Node


@onready var f_1_process: Label = $"File 1/F1process"
@onready var file_1: Button = $"File 1"
@onready var file_1_sprite: AnimatedSprite2D = $File1sprite

@onready var f_2_process: Label = $"File 2/F2 process"
@onready var file_2: Button = $"File 2"

@onready var f_3_process: Label = $"File 3/F3 process"
@onready var file_3: Button = $"File 3"


var lengthtime = 0.1

var f1on := false
var f1time := 0.0
var f1per = 0

var f2on := false
var f2time := 0.0
var f2per = 0

var f3on := false
var f3time := 0.0
var f3per = 0
# Test for Oliver
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#Hidding UI when screen is down
	if ScreenStatus.show == false:
		f_1_process.hide()
		file_1.hide()
		file_1_sprite.hide()
		
		f_2_process.hide()
		file_2.hide()
		
		f_3_process.hide()
		file_3.hide()
		
	else:
		f_1_process.show()
		file_1.show()
		file_1_sprite.show()
		
		f_2_process.show()
		file_2.show()
		
		f_3_process.show()
		file_3.show()
		
		
	
	if f1on == true and Tasks.f1done == false:
		f1time += delta
		if f1time >= lengthtime and f1per <= 99:
			f1per += 1
			f1time = 0.0
			f_1_process.text = str(f1per, "%")
		
		if f1per == 100:
			Tasks.f1done = true
			
	
	if f2on == true and Tasks.f2done == false:
		f2time += delta
		if f2time >= lengthtime and f2per <= 99:
			f2per += 1
			f2time = 0.0
			f_2_process.text = str(f2per, "%")
		
		if f2per == 100:
			Tasks.f2done = true
	
	
	if f3on == true and Tasks.f3done == false:
		f3time += delta
		if f3time >= lengthtime and f3per <= 99:
			f3per += 1
			f3time = 0.0
			f_3_process.text = str(f3per, "%")
		
		if f3per == 100:
			Tasks.f3done = true
			
		

#file 1
func _on_file_1_button_down() -> void:
	f1on = true
	file_1_sprite.play("Pressed")
	
func _on_file_1_button_up() -> void:
	f1on = false
	file_1_sprite.play("idle")


#file 2
func _on_file_2_button_down() -> void:
	f2on = true

func _on_file_2_button_up() -> void:
	f2on = false


#file 3
func _on_file_3_button_down() -> void:
	f3on = true

func _on_file_3_button_up() -> void:
	f3on = false
