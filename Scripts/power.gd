extends Node

@onready var powerlabel: Label = $Panel/Powerlabel
@onready var charge_sprite: AnimatedSprite2D = $Powersupply/ChargeSprite

var regen = false
var regenTime = 0.0
var power = 100
var time = 0.0
var pause = 0.0
var shocktime = 0.0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if power >= 1 and time >= 0.5:
		power -= 1
		time = 0.0
		powerlabel.text = str("Power: ",power)
		
		if PowerDrain.er1 == true:
			power -= 1
	
	if regen == true and ScreenStatus.screen_active == false and BlinkStatus.blink_active == false:
		regenTime += delta
		if power <= 99 and regenTime >= 0.25:
			power += 2
			regenTime = 0.0
	
	if regen == true:
			charge_sprite.animation = "ON"
	else:
			charge_sprite.animation = "default"
			
			


func _on_powersupply_button_down() -> void:
	regen = true

func _on_powersupply_button_up() -> void:
	regen = false

	
