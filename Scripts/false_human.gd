extends Node

@onready var false_sprite: AnimatedSprite2D = $FalseSprite
@onready var leave: AudioStreamPlayer2D = $Leave
@onready var breathing: AudioStreamPlayer2D = $Breathing
@onready var scream: AudioStreamPlayer2D = $Scream

enum State {
	IDLE,
	PUT_UP,
	WAITING,
	JUMPSCARE
}

var state: State = State.IDLE

var time := 0.0
var jumpscare_time := 0.0
var kill_time := 0.0
var aggresion := 0


func _ready():
	false_sprite.hide()
	aggresion = Aggresion.false_ag
	false_sprite.animation_finished.connect(_on_animation_finished)


func _process(delta: float) -> void:
	time += delta

	match state:
		State.IDLE:
			handle_idle()

		State.WAITING:
			handle_waiting(delta)

		State.JUMPSCARE:
			handle_jumpscare(delta)

func handle_idle():
	if time >= 5.0:
		time = 0.0
		if randi_range(1, aggresion) == 1:
			start_attack()


func handle_waiting(delta):
	kill_time -= delta


	if BlinkStatus.blink_active and BlinkStatus.blink_time >= 3.0:
		cancel_attack()
		return


	if kill_time <= 0.0:
		start_jumpscare()


func handle_jumpscare(delta):
	jumpscare_time += delta
	if jumpscare_time >= 1.2:
		get_tree().change_scene_to_file("res://Scenes/die.tscn")

func start_attack():
	state = State.PUT_UP
	false_sprite.show()
	false_sprite.play("default") # put-up animation
	breathing.play()
	kill_time = randi_range(7, 8)


func start_jumpscare():
	state = State.JUMPSCARE
	false_sprite.play("Jumpscare")
	breathing.stop()
	scream.play()
	jumpscare_time = 0.0


func cancel_attack():
	state = State.IDLE
	false_sprite.hide()
	breathing.stop()
	leave.play()
	time = 0.0

func _on_animation_finished():
	match state:
		State.PUT_UP:
			state = State.WAITING
			false_sprite.play("Waiting")
